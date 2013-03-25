task :default => [ :update_and_force ]

desc 'Same as install, but overwrites any existing files.'
task :force do
  ENV['force'] = 'yes'
  Rake::Task[:install].invoke
end

desc 'Run all installation tasks'
task install: %w[
  packages
  links
  environment
  gnome_terminal
  vim
]

desc 'Install packages'
task :packages do
  to_install  = PACKAGES[:global]
  to_install += PACKAGES[:gui] unless ENV['DISPLAY'].nil?
  `sudo apt-get update && sudo apt-get install -y #{to_install.join(' ')}`
end

desc 'Set environmental settings that are not simple config files (e.g. `chsh`)'
task environment: :shell

desc 'Set preferred shell'
task shell: :packages do
  `sudo chsh -s $(which #{PREFERRED_SHELL}) $(whoami)`
end

desc 'Symlink config files to appopriate locations. (force=yes to overwrite)'
task :links do
  MAPPINGS.each do |source, target|
    link_file source, target
  end
end

desc 'Install Gnome Terminal configuration (NOOP if there is no gconftool-2 bin)'
task :gnome_terminal do
  `which gconftool-2 && gconftool-2 --load files/gnome-terminal-conf.xml`
end

desc 'Install vim config, including plugins'
task vim: :links do
  `~/.vim/install_vundle`
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

desc 'Save Gnome Terminal configuration to files/gnome-terminal-conf.xml (NOOP if there is no gconftool-2 bin)'
task :save_gnome_terminal do
  `which gconftool-2 && gconftool-2 --dump '/apps/gnome-terminal' > files/gnome-terminal-conf.xml`
end

private

PREFERRED_SHELL = 'zsh'

COLORS = {
  red:    '1;31',
  yellow: '1;33',
}

alias :rake_warn :warn
def warn(msg, color=:red)
  rake_warn "\e[#{COLORS[color]}m#{msg}\e[m"
end

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
  'bin'              =>  '~/bin',
  'gitconfig'        =>  '~/.gitconfig',
  'gitignore_global' =>  '~/.gitignore_global',
  'rake'             =>  '~/.rake',
  'rspec'            =>  '~/.rspec',
  'tmux.conf'        =>  '~/.tmux.conf',
  'vim'              =>  '~/.vim',
  'vim/vimrc'        =>  '~/.vimrc',
  'zsh'              =>  '~/.zsh',
  'zsh/rc.zsh'       =>  '~/.zshrc',
}

##
# Packages to be instaled. global packages are always installed; gui packages
# are only installed if a GUI is detected.
#
PACKAGES = {
  global: %w[
    zsh
    tmux
    vim
  ],
  gui: %w[
    vim-gnome
  ]
}

##
# Symlinks +src+ file or directory to +target+
#
def link_file(source, target)
  source = "#{pwd}/files/#{source}"
  target = File.expand_path target
  link   = -> { ln_s source, target }
  if File.exists? target
    if ENV['force'] =~ /y/i
      rm_rf target if ENV['force'] =~ /y/i
      ln_s source, target
    elsif File.directory? target
      warn "#{target} is a directory. I'm not symlinking that unless you use force=yes", :yellow
    else
      link.call
    end
  else
    link.call
  end
rescue
  warn "Couldn't create #{target} because it exists. Use `force=yes` to overwrite."
end
