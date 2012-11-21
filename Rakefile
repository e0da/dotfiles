require 'socket'

@force = false

Mappings = {
  :global => {
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
    'Xdefaults'        =>  '~/.Xdefaults',
    'zshrc'            =>  '~/.zshrc',
    'zsh'              =>  '~/.zsh'
  }
}

def link_file(src, tgt)
  src = "#{pwd}/files/#{src}"
  tgt = File.expand_path tgt
  rm_rf tgt if @force
  ln_s src, tgt unless File.exists? tgt
rescue
  STDERR.puts "Couldn't link #{src} to #{tgt}. Use `rake force` to overwrite."
end

def link_all_files
  Mappings[:global].each do |src,tgt|
    link_file src, tgt
  end
  host_mapping = Mappings[Socket.gethostname.to_sym]
  host_mapping.each do |src,tgt|
    link_file src, tgt
  end unless host_mapping.nil?
end

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
    link_all_files
  end

  desc 'Install Gnome Terminal configuration'
  task :gnome_terminal do
    `gconftool-2 --load files/gnome-terminal-conf.xml`
  end
end

desc 'Pull the latest changes from Git and update all submodules'
task :update do
  `git pull`
  `git submodule foreach --recursive git submodule sync`
  `git submodule foreach --recursive git submodule update --init`
  `git submodule update --init --recursive`
end

desc 'Save Gnome Terminal configuration to files/gnome-terminal-conf.xml'
task :save_gnome_terminal do
  `gconftool-2 --dump '/apps/gnome-terminal' > files/gnome-terminal-conf.xml`
end

task :default do
  puts `rake --tasks`
end
