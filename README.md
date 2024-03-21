# My Environment

After some time losing and rebuilding my environment from scratch, I decided to
create this repository to hold all of my personal customizations for bash as
well as for emacs, my preferred text editor.

These are my personal customizations. If you want to use it, remember to add
your own customizations.

Hope this can be useful somehow.

# Installation

## Linux

Clone this repository on your home directory, under the `.environment` name. In
fact, the directory name is up to you:

```bash
# Using SSH
git clone git@github.com:ronflima/environment.git .environment

# Using HTTPS
git clone https://github.com/ronflima/environment.git .environment
```

After that, run `.environment/linux-install.sh` and you are done. It will save your
original `.bash_*` files into the `.environment_backup` directory under your
HOME dir. So, you can undo the installation only by removing the links the
installer created and putting back your files.

> **Notice**
>
> This will try to download every single tool I use. Some of those tools are
> specific for my needs. You are free to fork this repo and add your own
> customizations. I tried to make the install.sh as simple as possible so anyone
> can customize it at will.
>
> It is important to mention, also, that I built it to run under WSL
> on Windows. But it should work on virtually any popular apt-based
> linux distro out there since I have used only linux standard stuff.

## macOS 

Currently, there is no installer for macOS. However, you may use the
zshrc file that lies inside the zsh directory. In order to use it in
your environment, as your `.zshrc`, just do this:

```zsh
cd ~/
ln -s .environment/zsh/zshrc .zshrc
```

Remember to remove any existing `.zshrc` before running this.

You may add your own customizations by creating a
`.zsh_customizations` file under your HOME directory. My `zshrc`
detect its presence and load it, so you don't need to modify my stuff
if you need to add more things.
