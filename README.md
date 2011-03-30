These are my personal configuration files. The directory structure is designed
so that you can symlink everything with a single command, then just
periodically do a `git pull` in the directory to update everything. Here is one
way to make the symlinks:

    cd
    git clone git://github.com/sidewaysmilk/dotfiles
    find dotfiles -maxdepth 1 -name ".*"| grep -v '.git$' | grep -v .gitignore | while read f; do rm `basename $f`; ln -s $f; done

The various scripts, etc. found here are copyright their respective owners and
documentation can be found for each of them by viewing the file or googling the
product name. If I am improperly using anything here, please let me know and I
will correct the problem.

Justin Force
March 30, 2011

