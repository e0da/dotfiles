require 'erb'
require 'ostruct'

ORIGINAL_DIR = Rake.application.original_dir

def year
  Time.now.year
end

def name
  (`git config --get user.name` or '').chomp
end

namespace :license do

  desc 'Print the URL to the MIT license and output the LICENSE text to ./LICENSE'
  task :mit do
    puts "http://www.opensource.org/licenses/MIT"
    template_file = "#{File.expand_path(File.dirname(__FILE__))}/templates/mit_license.erb"
    target_file = "#{ORIGINAL_DIR}/LICENSE"
    opts = OpenStruct.new({
      :year => year,
      :holder => name
    })
    template = open(template_file, 'r') {|f| f.read}
    render = ERB.new(template).result(opts.instance_eval {binding})
    open(target_file, 'w') {|f| f.write render}
  end
end
