require 'tmpdir'

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
  shell
  gnome_terminal:install
]

##
# Each key corresponds to a file in the +files+ directory, and each value is the
# destination of the symlink.
#
MAPPINGS = {
  'agignore'           => '~/.agignore',
  'bin'                => '~/bin',
  'gitconfig'          => '~/.gitconfig',
  'gitignore_global'   => '~/.gitignore_global',
  'nvim'               => %w[~/.config/nvim ~/.vim],
  'nvim/init.vim'      => '~/.vimrc',
  'tmux.conf'          => '~/.tmux.conf',
  'ycm_extra_conf.py'  => '~/.ycm_extra_conf.py',
  'zsh'                => '~/.zsh',
  'zsh/zlogin.zsh'     => '~/.zlogin',
  'zsh/zshenv.zsh'     => '~/.zshenv',
  'zsh/zshrc.zsh'      => '~/.zshrc',
}

##
# Packages to be installed. global packages are always installed; gui packages
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
# Wraps Kernel#warn with support for colors.
#
alias :kernel_warn :warn
def warn(msg, color=:red)
  kernel_warn "\e[#{COLORS[color]}m#{msg}\e[m"
end

def force?
  @force ||= ENV['force'] =~ /y/i
end

##
# Symlinks +src+ file or directory to +target+
#
def link_file(source, target)
  source = "#{pwd}/files/#{source}"
  target = File.expand_path target
  rm_rf target if File.exists?(target) and force?
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

  desc 'Save Gnome Terminal configuration to files/gnome-terminal-conf.xml (requires gconftool-2 bin)'
  task :save do
    `gconftool-2 --dump '/apps/gnome-terminal' > files/gnome-terminal-conf.xml`
  end
end

desc 'Set up hub (GitHub CLI tool)'
task hub: :links do
  `
    set -x
    gem install hub &&
      hub hub standalone > ~/bin/hub &&
      chmod +x ~/bin/hub
  `
end

desc "Run these tasks in order: #{INSTALL_TASKS.join(' ')}"
task install: INSTALL_TASKS

desc 'Symlink config files to appropriate locations. (force=yes to overwrite)'
task :links do
  MAPPINGS.each do |source, target|
    if target.is_a? Array
      target.each do |targetlet|
        link_file source, targetlet
      end
    else
      link_file source, target
    end
  end
end

desc 'Install packages'
task :packages do
  to_install  = PACKAGES[:global]
  to_install += PACKAGES[:gui] unless ENV['DISPLAY'].nil?
  `sudo apt-get update && sudo apt-get install --yes --quiet #{to_install.join(' ')}`
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
