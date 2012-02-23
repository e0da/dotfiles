#!/usr/bin/env ruby

require 'yaml'
require 'optparse'
require 'fileutils'

USAGE=<<-EOL
  Usage: #{__FILE__} [role]
  Roles are defined in config.yml. If no role is given, "default" will be used.
EOL

def link_file(file)
  source = File.expand_path "files/#{file}"
  target = File.expand_path "~/.#{file}"
  puts "Symlinking #{source} to #{target}..." if @verbose
  File.symlink source, target
rescue Errno::EEXIST => e
  if @force
    puts "Overwriting symlink #{target}..." if @verbose
    FileUtils.rm_rf target
    link_file file
  else
    STDERR.puts "#{target} already exists. Skipping... (use -f to force overwrite)"
  end
end

def process_role(role)

  # handle dependencies (if any)
  #
  role['depends'].each do |d|
    process_role @conf['roles'][d]
  end if role['depends']

  role['files'].each do |f|
    link_file f
  end
end



#
# Parse the command line options, read the configuration file, then process any
# roles supplied ("default" if none is defined). Print errors and quit if
# there's a problem.
#

OptionParser.new do |o|
  o.banner = USAGE
  o.on('-v', '--verbose') { |v| @verbose = v }
  o.on('-f', '--force')   { |f| @force = f }
end.parse!

@conf = YAML.load_file 'config.yml'
role = @conf['roles'][ARGV[0] || 'default']

if !role
  puts "Role '#{role}' is not defined"
  puts USAGE
  exit false
end

process_role role
