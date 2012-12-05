require 'socket'

task :default => [:pull]

desc 'Same as install, but overwrites any existing files.'
task :force do
  @force = true
  Rake::Task[:install].invoke
end

desc 'Run all installation tasks'
task :install do
  Rake::Task['install:all'].invoke
end

namespace :install do

  task :all do
    Rake::Task['install:links'].invoke
    Rake::Task['install:gnome_terminal'].invoke
  end

  desc 'Symlink config files to appopriate locations.'
  task :links do
    Mappings.each do |source, target|
      link_file source, target
    end
  end

  desc 'Install Gnome Terminal configuration'
  task :gnome_terminal do
    `gconftool-2 --load files/gnome-terminal-conf.xml`
  end
end

desc '[default] Pull the latest changes from Git and update all submodules'
task :pull do
  `git fetch --prune`
  `git pull --rebase --recurse-submodules origin master`
end

desc 'Update all plugins to latest origin/master/HEAD'
task :update_plugins do
  `git submodule foreach 'git checkout master; git pull --force origin master'`
end

desc 'Save Gnome Terminal configuration to files/gnome-terminal-conf.xml'
task :save_gnome_terminal do
  `gconftool-2 --dump '/apps/gnome-terminal' > files/gnome-terminal-conf.xml`
end

private

@force = false

##
# Each key corresponds to a file in the +files+ directory, and each value is the
# destination of the symlink.
#
Mappings = {
  'Xdefaults'        =>  '~/.Xdefaults',
  'bash_aliases'     =>  '~/.bash_aliases',
  'bash_profile'     =>  '~/.bash_profile',
  'bashrc'           =>  '~/.bashrc',
  'gitconfig'        =>  '~/.gitconfig',
  'gitignore_global' =>  '~/.gitignore_global',
  'rake'             =>  '~/.rake',
  'rspec'            =>  '~/.rspec',
  'tmux.conf'        =>  '~/.tmux.conf',
  'vim'              =>  '~/.vim',
  'vim/vimrc'        =>  '~/.vimrc',
  'zsh'              =>  '~/.zsh',
  'zshrc'            =>  '~/.zshrc',
}

##
# Symlinks +src+ file or directory to +target+
#
def link_file(source, target)
  source = "#{pwd}/files/#{source}"
  target = File.expand_path target
  rm_rf target if @force
  ln_s source, target unless File.exists? target
rescue
  $stderr.puts "Couldn't link #{source} to #{target}. Use `rake force` to overwrite."
end
