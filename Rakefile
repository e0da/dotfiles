# desc '[disabled] Compile Command-T'
# task :compile_command_t dt
#   #compile_command_t
#   puts 'Remember to recompile command-t if it updated'
# end

task :default => [:pull]

desc '[default] Update repo and all plugins to latest origin/master/HEAD'
task :pull do
  `git fetch --prune`
  `git pull --rebase --recurse-submodules origin master`
  Rake::Task[:command_t].invoke
end

desc 'Update repo and all plugins to latest master/HEAD version'
task :update do
  `git submodule foreach 'git checkout master; git pull --force origin master'`
  Rake::Task[:command_t].invoke
end

desc 'Compile Command-T'
task :command_t do
  FileUtils.cd 'bundle/command-t'
  env_exec "rvm use #{vim_ruby_version} --install; rake make"
end

desc 'Demo colors'
task :colors do
  COLORS.each do |key, value|
    say key, "HELLO! In glorious #{key.to_s.upcase}!"
  end
end

private

##
# *nix shell colors
#
COLORS = {
  :black         =>  '0;30',	  :dark_gray     =>  '1;30',
  :blue          =>  '0;34',	  :light_blue    =>  '1;34',
  :green         =>  '0;32',	  :light_green   =>  '1;32',
  :cyan          =>  '0;36',	  :light_cyan    =>  '1;36',
  :red           =>  '0;31',	  :light_red     =>  '1;31',
  :purple        =>  '0;35',	  :light_purple  =>  '1;35',
  :brown         =>  '0;33',	  :yellow        =>  '1;33',
  :light_gray    =>  '0;37',	  :white         =>  '1;37',
}

##
# Prints the +message+ in the given +color+ (default is no color)
#
# == Example
#
#   say :blue, "This text is blue"
#
def say(color=nil, message)
  puts "\e[#{COLORS[color]}m#{message}\e[m"
end

##
# Returns the Ruby version against which Vim was compiled.
#
def vim_ruby_version
  `vim --version | grep -o "ruby\S\+" | sed s/ruby-//`
end

##
# Executes the +command+ in the context of a login shell.
#
def env_exec(command)
  `zsh --login -c "#{command}"`
end
