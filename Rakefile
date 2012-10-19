SUBMODULE_URLS = %w[
  https://github.com/Lokaltog/vim-easymotion
  https://github.com/bbommarito/vim-slim
  https://github.com/bronson/vim-trailing-whitespace
  https://github.com/chikamichi/mediawiki.vim
  https://github.com/kchmck/vim-coffee-script
  https://github.com/mattn/gist-vim
  https://github.com/mattn/webapi-vim
  https://github.com/othree/html5.vim
  https://github.com/pangloss/vim-javascript
  https://github.com/scrooloose/nerdtree
  https://github.com/tomasr/molokai
  https://github.com/tpope/vim-abolish
  https://github.com/tpope/vim-endwise
  https://github.com/tpope/vim-eunuch
  https://github.com/tpope/vim-fugitive
  https://github.com/tpope/vim-git
  https://github.com/tpope/vim-haml
  https://github.com/tpope/vim-markdown
  https://github.com/tpope/vim-pastie
  https://github.com/tpope/vim-pathogen
  https://github.com/tpope/vim-ragtag
  https://github.com/tpope/vim-rails
  https://github.com/tpope/vim-repeat
  https://github.com/tpope/vim-speeddating
  https://github.com/tpope/vim-unimpaired
  https://github.com/tpope/vim-vividchalk
  https://github.com/vim-scripts/apachelogs.vim
  https://github.com/vim-scripts/apachestyle
  https://github.com/vim-scripts/dhcpd.vim
  https://github.com/vim-scripts/iptables
  https://github.com/vim-scripts/nginx.vim
  https://github.com/vim-scripts/tComment.git
  https://github.com/wincent/Command-T.git
]

task :default => [:submodules]

desc 'Add all submodules listed in Rakefile'
task :submodules do
  SUBMODULE_URLS.each do |url|
    set_up_submodule url
  end
  Rake::Task[:compile_command_t].invoke
end

desc 'Compile Command-T'
task :compile_command_t do
  #compile_command_t
  puts 'Remember to recompile command-t if it updated'
end

desc 'Update repo and all plugins to latest master/HEAD version'
task :update do
  `git pull`
  pwd = FileUtils.pwd
  submodule_dirs.each do |dir|
    FileUtils.cd dir
    `git checkout master` unless on_branch?
    `git pull`
    FileUtils.cd pwd
  end
end

private

def on_branch?
  !`git branch | grep '*'`.match /\(no branch\)/
end

def submodule_dirs
  SUBMODULE_URLS.map do |url|
    "bundle/#{dirname(url)}"
  end
end

#
# FIXME This doesn't work. :)
#
def compile_command_t
  FileUtils.cd 'bundle/command-t'
  `zsh -lc "rvm use 1.8.7; rake make"`
end

def set_up_submodule(url)
  dirname = dirname(url)
  target  = "bundle/#{dirname}"
  FileUtils.mkdir_p target
  `git submodule add #{url} #{target}`
end

#
# lowercase version of the repo name without extraneous vim or git labels
#
def dirname(url)
  File.basename(url).downcase.gsub(/^vim-/, '').gsub(/(-|\.)(git|vim)$/, '')
end
