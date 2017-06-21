require 'tmpdir'

################################################################################
# Constants and helpers
################################################################################

LOCAL_BIN_PATH  = "#{ENV['HOME']}/.local/bin"
PREFERRED_SHELL = 'zsh'
COLORS          = {red: '1;31', yellow: '1;33'}
INSTALL_TASKS   = %w[packages hub links shell]
PACKAGES        = %W[silversearcher-ag autojump exuberant-ctags tmux
                     #{PREFERRED_SHELL} golang-go build-essential].join(' ')

##
# Each key corresponds to a file in the +files+ directory, and each value is the
# destination of the symlink.
#
MAPPINGS = {'agignore'           => '~/.agignore',
            'bin'                => '~/bin',
            'gitconfig'          => '~/.gitconfig',
            'gitignore_global'   => '~/.gitignore_global',
            'nvim'               => %w[~/.config/nvim ~/.vim],
            'nvim/init.vim'      => '~/.vimrc',
            'tmux.conf'          => '~/.tmux.conf',
            'ycm_extra_conf.py'  => '~/.ycm_extra_conf.py',
            'zsh'                => '~/.zsh',
            'zsh/zshrc.zsh'      => '~/.zshrc'}

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

desc "Create local bin directory at #{LOCAL_BIN_PATH}"
task :local_bin do
  mkdir_p LOCAL_BIN_PATH
end

desc 'Set up hub (GitHub CLI tool)'
task hub: [:packages, :local_bin] do
  sh <<-SH
    set -e
    tmpdir=$(mktemp -d)
    cd "$tmpdir"
    git clone --depth=1 https://github.com/github/hub.git
    cd hub
    ./script/build
    install bin/hub #{LOCAL_BIN_PATH}
  SH
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
  sh <<-SH
    if (which dpkg &>/dev/null && which apt-get &>/dev/null); then
      dpkg --status #{PACKAGES} >/dev/null && exit 0
      sudo apt-get update
      sudo apt-get install --yes --quiet #{PACKAGES}
    fi
  SH
end

desc 'Set preferred shell'
task shell: :packages do
  sh <<-SH
    grep $USER.\*$(which #{PREFERRED_SHELL}) /etc/passwd >/dev/null ||
      sudo chsh -s $(which #{PREFERRED_SHELL}) $USER
  SH
end

# Because this may update the Rakefile, we depend on the update task, then we
# actually exec a call to rake in the shell.
desc '[Default] Update repository and run force task'
task update_and_force: :update do
  exec 'rake force' if $? == 0
end

desc 'Update repository'
task :update do
  sh <<-SH
    git fetch --prune
    git pull --rebase --recurse-submodules origin master
  SH
end

desc 'Update all plugins to latest origin/master/HEAD'
task :update_plugins do
  sh <<-SH
    git submodule foreach '
      git checkout master
      git pull --force origin master'
  SH
end
