################################################################################
# Constants and helpers
################################################################################

COLORS = {
  red:    '1;31',
  yellow: '1;33',
}

INSTALL_TASKS = %w[
  packages
  hub
  links
  environment
  gnome_terminal:install
  vim
]

##
# Each key corresponds to a file in the +files+ directory, and each value is the
# destination of the symlink.
#
MAPPINGS = {
  'Xdefaults'          => '~/.Xdefaults',
  'Xresources'         => '~/.Xresources',
  'ackrc'              => '~/.ackrc',
  'bash_profile'       => '~/.bash_profile',
  'bashrc'             => '~/.bashrc',
  'bin'                => '~/bin',
  'clusterssh'         => '~/.clusterssh',
  'gitconfig'          => '~/.gitconfig',
  'gitignore_global'   => '~/.gitignore_global',
  'rake'               => '~/.rake',
  'rspec'              => '~/.rspec',
  'terminfo'           => '~/.terminfo',
  'tmux.conf'          => '~/.tmux.conf',
  'vim'                => '~/.vim',
  'vim/vimrc'          => '~/.vimrc',
  'xrdb-merge.desktop' => '~/.config/autostart/xrdb-merge.desktop',
  'zsh'                => '~/.zsh',
  'zsh/rc.zsh'         => '~/.zshrc',
}

##
# Packages to be instaled. global packages are always installed; gui packages
# are only installed if a GUI is detected.
#
PACKAGES = {
  global: %w[
    ack-grep
    autojump
    exuberant-ctags
    tmux
    vim
    zsh
  ],
  gui: %w[
    vim-gnome
  ]
}

PREFERRED_SHELL = 'zsh'

##
# Wraps rake's own #warn with support for colors.
#
alias :rake_warn :warn
def warn(msg, color=:red)
  rake_warn "\e[#{COLORS[color]}m#{msg}\e[m"
end

##
# Symlinks +src+ file or directory to +target+
#
def link_file(source, target)
  source = "#{pwd}/files/#{source}"
  target = File.expand_path target
  rm_rf target if File.exists?(target) and ENV['force'] =~ /y/i
  if File.directory? target
    warn "#{target} is a directory. I'm not symlinking that unless you use force=yes", :yellow
  else
    FileUtils.mkdir_p File.dirname(target)
    ln_s source, target
  end
rescue
  warn "Couldn't create #{target} because it exists. Use `force=yes` to overwrite."
end


################################################################################
# Tasks
################################################################################

task default: :update_and_force

desc 'Set environmental settings that are not simple config files (e.g. `chsh`)'
task environment: :shell

desc 'Same as install, but overwrites any existing files.'
task :force do
  ENV['force'] = 'yes'
  Rake::Task[:install].invoke
end

namespace :gnome_terminal do
  desc 'Install Gnome Terminal configuration (NOOP if there is no gconftool-2 bin)'
  task :install do
    `which gconftool-2 && gconftool-2 --load files/gnome-terminal-conf.xml`
  end

  desc 'Save Gnome Terminal configuration to files/gnome-terminal-conf.xml (NOOP if there is no gconftool-2 bin)'
  task :save do
    `which gconftool-2 && gconftool-2 --dump '/apps/gnome-terminal' > files/gnome-terminal-conf.xml`
  end
end

desc 'Set up hub (GitHub CLI tool)'
task hub: :links do
  `curl http://defunkt.io/hub/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub`
end

desc "Run these tasks in order: #{INSTALL_TASKS.join(' ')}"
task install: INSTALL_TASKS

desc 'Symlink config files to appropriate locations. (force=yes to overwrite)'
task :links do
  MAPPINGS.each do |source, target|
    link_file source, target
  end
end

desc 'Install packages'
task :packages do
  to_install  = PACKAGES[:global]
  to_install += PACKAGES[:gui] unless ENV['DISPLAY'].nil?
  `sudo apt-get update ; sudo apt-get install -y #{to_install.join(' ')}`
end

desc 'Set preferred shell'
task shell: :packages do
  `sudo chsh -s $(which #{PREFERRED_SHELL}) $(whoami)`
end

# Because this may update the Rakefile, we depend on the update task, then we
# actually exec a call to rake in the shell.
desc '[Default] Update repository and run force task'
task update_and_force: :update do
  exec 'rake force' if $? == 0
end

desc 'Update repository'
task :update do
  `git fetch --prune`
  `git pull --rebase --recurse-submodules origin master`
end

desc 'Update all plugins to latest origin/master/HEAD'
task :update_plugins do
  `git submodule foreach 'git checkout master; git pull --force origin master'`
end

# FIXME vim shouldn't symlink EVERYTHING. Need to make symlinker more granular.
desc 'Install vim config, including plugins'
task :vim => :links do
  `~/.vim/install_vundle`
end
