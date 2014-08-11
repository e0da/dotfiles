dotfiles
========

These are my personal configuration files. The directory structure is designed
so that you can symlink everything with a single command. ~~This is only tested
with and only expected to work on Ubuntu.~~ I changed jobs and I work
exclusively on a Mac now. _(Not thrilled about the Mac, but the job is
excellent!  Do not cry for me.)_ So the Ubuntu-specific parts of this may
become stale over time. **Bug reports and pull requests are appreciated!**

Installation
------------

### Copypasta Installation ###

> [Here be dragons!][] This is for **me** to use. The goal is for me to be able
> to copy and paste a couple of lines to get up and running with my local
> configuration. I **definitely want** all of the **potentially destructive**
> actions taken by this script to take place. I'm **not responsible** if you
> lose data or break something using my script. If you **really** want to do all
> of the things that this script does, proceed **at your own peril!**

* Install a couple of prerequisites with APT.
* Install RVM and Ruby.
* Clone the repository.
* Run the `rake force` task, symlinking all config files and overwriting any
  existing files.

If you understand the risks and want to press on, copy and paste this (you can
skip the first 2 lines if you have the commands from the 2nd line):

```sh
sudo apt-get update && \
sudo apt-get --yes --no-install-recommends install bash curl git patch bzip2 && \
curl https://raw.githubusercontent.com/justinforce/dotfiles/master/bootstrap | bash
```

### Manual Installation ###

This method won't overwrite any files and skips some cool magic stuff. This'll
just get you the content, and it's up to you to symlink what you like.

```sh
git clone https://github.com/justinforce/dotfiles ~/.dotfiles --recursive
```

Then you can `cd` into `~/.dotfiles` and run `rake -T` to get a list of the
available tasks.

License
-------

Highlights
----------

I use [VAM][] (the Vim Addon Manager) to manage plugins. I use
[my fork][my zsh-git-prompt] of [zsh-git-prompt][] to get nice git info in my
prompt.

License and Copyright
---------------------

Copyright Justin Force and Licensed under the [MIT license][].

[Here be dragons!]: http://en.wikipedia.org/wiki/Here_be_dragons
[MIT license]: http://www.opensource.org/licenses/MIT
[VAM]: https://github.com/MarcWeber/vim-addon-manager
[my zsh-git-prompt]: https://github.com/justinforce/zsh-git-prompt/tree/silent
[zsh-git-prompt]: https://github.com/olivierverdier/zsh-git-prompt
