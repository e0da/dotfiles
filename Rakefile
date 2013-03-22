task :default => [ :update_and_force ]

desc 'Same as install, but overwrites any existing files.'
task :force do
  @force = true
  Rake::Task[:install].invoke
end

desc 'Run all installation tasks (same as install:all)'
task install: 'install:all'

namespace :install do

  desc 'Run all installation tasks'
  task all: %w[
    install:links
    install:gnome_terminal
    install:vim
  ]

  desc 'Symlink config files to appopriate locations.'
  task :links do
    MAPPINGS.each do |source, target|
      link_file source, target
    end
  end

  desc 'Install Gnome Terminal configuration'
  task :gnome_terminal do
    `which gconftool-2 && gconftool-2 --load files/gnome-terminal-conf.xml`
  end

  desc 'Install vim config, including plugins'
  task vim: 'install:links' do
    `~/.vim/install_vundle`
  end
end

desc '[Default] Update repository and run force task'
task update_and_force: [ :update, :force ]

desc 'Update repository'
task :update do
  `git fetch --prune`
  `git pull --rebase --recurse-submodules origin master`
end

desc 'Update all plugins to latest origin/master/HEAD'
task :update_plugins do
  `git submodule foreach 'git checkout master; git pull --force origin master'`
end

desc 'Save Gnome Terminal configuration to files/gnome-terminal-conf.xml'
task :save_gnome_terminal do
  `which gconftool-2 && gconftool-2 --dump '/apps/gnome-terminal' > files/gnome-terminal-conf.xml`
end

private

@force = false

##
# Each key corresponds to a file in the +files+ directory, and each value is the
# destination of the symlink.
#
MAPPINGS = {
  'Xdefaults'        =>  '~/.Xdefaults',
  'Xresources'       =>  '~/.Xresources',
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
