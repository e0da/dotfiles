require 'socket'

force = false

task :default => :install


# Mappings are defined as a hash where the key is the source path relative to
# ./files and the value is the destination
Mappings = {
  'bash_aliases'     =>  '~/.bash_aliases',
  'bash_profile'     =>  '~/.bash_profile',
  'bashrc'           =>  '~/.bashrc',
  'gemrc'            =>  '~/.gemrc',
  'gitconfig'        =>  '~/.gitconfig',
  'lftp'             =>  '~/.lftp',
  'global_Rakefile'  =>  '~/Rakefile',
  'rspec'            =>  '~/.rspec',
  'tmux.conf'        =>  '~/.tmux.conf',
  'vim'              =>  '~/.vim',
  'vim/vimrc'        =>  '~/.vimrc',
  'zshrc'            =>  '~/.zshrc'
}

HostMappings = {
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
  Mappings.each do |src,tgt|
    link_file src, tgt, force
  end
  host_mapping = HostMappings[Socket.gethostname.to_sym]
  host_mapping.each do |src,tgt|
    link_file src, tgt, force
  end unless host_mapping.nil?
end

desc 'Symlink config files to appropriate locations and overwrite any existing files.'
task :force do
  link_all_files true
end 

desc 'Symlink config files to appopriate locations.'
task :install do
  link_all_files
end

namespace :git do
  desc 'Pull the latest changes and update all submodules'
  task :update do
    `git submodule update --init --recursive`
    `git pull --recurse-submodules`
  end
end
