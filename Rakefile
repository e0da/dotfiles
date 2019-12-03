require 'tmpdir'

################################################################################
# Constants and helpers
################################################################################

PREFERRED_SHELL = 'zsh'.freeze
INSTALL_TASKS   = %w[packages links shell].freeze
UBUNTU          = `which lsb_release` && $CHILD_STATUS.to_i.zero?
RECENT_UBUNTU   = UBUNTU && `lsb_release -rs`.chomp.to_i >= 18
CODING_FONT     = RECENT_UBUNTU ? 'fonts-firacode' : ''
PACKAGES        = %W[
  #{CODING_FONT} #{PREFERRED_SHELL} autojump build-essential exuberant-ctags
  libpython-dev libpython2.7-dev libpython3-dev molly-guard silversearcher-ag
  ssh tmux
].join(' ')

##
# Each key corresponds to a file in the +files+ directory, and each value is the
# destination of the symlink.
#
MAPPINGS = {
  'gitconfig'        => '~/.gitconfig',
  'gitignore_global' => '~/.gitignore_global',
  'nvim'             => %w[~/.config/nvim ~/.vim],
  'nvim/init.vim'    => '~/.vimrc',
  'postman.desktop'  => '~/.local/share/applications/postman.desktop',
  'tmux.conf'        => '~/.tmux.conf',
  'zim/style.conf'   => '~/.config/zim/style.conf',
  'zsh'              => '~/.zsh',
  'zsh/zshrc.zsh'    => '~/.zshrc'
}.freeze

##
# Symlinks +src+ file or directory to +target+
#
def link_file(source, target)
  source = "#{pwd}/files/#{source}"
  target = File.expand_path target
  rm_rf target
  FileUtils.mkdir_p File.dirname(target)
  ln_s source, target
end

################################################################################
# Tasks
################################################################################

task default: :update_and_install

desc "Run these tasks in order: #{INSTALL_TASKS.join(' ')}"
task install: INSTALL_TASKS

desc 'Symlink config files to appropriate locations'
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
desc '[Default] Update repository and run install task'
task update_and_install: :update do
  exec 'rake install' if $CHILD_STATUS.to_i.zero?
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
