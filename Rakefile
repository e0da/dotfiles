require 'socket'

Mappings = {
  global: {
    'bash_aliases'     =>  '~/.bash_aliases',
    'bash_profile'     =>  '~/.bash_profile',
    'bashrc'           =>  '~/.bashrc',
    'gemrc'            =>  '~/.gemrc',
    'gitconfig'        =>  '~/.gitconfig',
    'lftp'             =>  '~/.lftp',
    'rake'             =>  '~/.rake',
    'rspec'            =>  '~/.rspec',
    'tmux.conf'        =>  '~/.tmux.conf',
    'vim'              =>  '~/.vim',
    'vim/vimrc'        =>  '~/.vimrc',
    'zshrc'            =>  '~/.zshrc'
    'zsh'              =>  '~/.zsh'
  },
  harold: {
    'harold_synergy.conf' => '~/.synergy.conf'
  }
}

def link_file(src, tgt, force)
  src = "#{pwd}/files/#{src}"
  tgt = File.expand_path tgt
  rm_rf tgt if force
  ln_s src, tgt
end

def link_all_files(force=false)
  Mappings[:global].each do |src,tgt|
    link_file src, tgt, force
  end
  host_mapping = Mappings[Socket.gethostname.to_sym]
  host_mapping.each do |src,tgt|
    link_file src, tgt, force
  end unless host_mapping.nil?
end

desc 'Same as install, but overwrites any existing files.'
task :force do
  link_all_files true
end 

desc 'Symlink config files to appopriate locations.'
task :install do
  link_all_files
end

desc 'Pull the latest changes from Git and update all submodules'
task :update do
  `git submodule update --init --recursive`
  `git pull --recurse-submodules`
end

task :default do
  puts `rake --tasks`
end
