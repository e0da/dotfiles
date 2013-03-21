dotfiles
========

These are my personal configuration files. The directory structure is designed
so that you can symlink everything with a single command. This is only tested
with and only expected to work on Ubuntu.

Installation
------------

### Copypasta ###

> [Here be dragons!][] This is for **me** to use. The goal is for me to be able
> to copy and paste a couple of lines to get up and running with my local
> configuration. I **definitely want** all of the **potentially destructive**
> actions taken by this script to take place. I'm **not responsible** if you
> lose data or break something using my script. If you **really** want to do all
> of the things that this script does, proceed **at your own peril!**

This copypasta will:

* Install a couple of prerequisites with APT.
* Install RVM and Ruby.
* Clone the repository.
* Run the `rake force` task, symlinking all config files and overwriting any
  existing files.

If you understand the risks and want to press on, copy and paste this:

```sh
sudo apt-get update && \
sudo apt-get --yes --no-install-recommends install bash curl git patch bzip2 && \
curl https://raw.github.com/justinforce/dotfiles/master/bootstrap | bash
```

### Manual Installation ###

This method won't overwrite any files and skips some cool magic stuff. This'll
just get you the content, and it's up to you to symlink what you like.

```sh
git clone https://github.com/justinforce/dotfiles ~/.dotfiles --recursive
```

Then you can `cd` into `~/.dotfiles` and run `rake -T` to get a list of the
available tasks.

Highlights
----------

I use [Vundle][] to manage plugins. I use [my fork][my zsh-git-prompt] of
[git-zsh-prompt][] to get nice git info in my prompt.

License
-------

[MIT license](http://www.opensource.org/licenses/MIT)

[Here be dragons!]:http://en.wikipedia.org/wiki/Here_be_dragons
[Vundle]:https://github.com/gmarik/vundle
[my zsh-git-prompt]:https://github.com/justinforce/zsh-git-prompt
[zsh-git-prompt]:https://github.com/olivierverdier/zsh-git-prompt
