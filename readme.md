# mastro's dotfiles

To use these settings with i3 (the best tiling window manager) you will need

- i3
- sucklesstools
- scrot
- imagemagick
- rofi
- compton
- feh

To use my .vim configuration to configure vim (the best editor ever) you will need vundle, so as to be able to use vim plugins, so get vundle now with 

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Install this dotfiles onto a new system

```bash
# define the alias "config" that is just git with some default parameters
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# define the .gitignore file
echo ".cfg" >> .gitignore
# clone this repo
git clone --bare https://github.com/mastro35/dotfiles $HOME/.cfg
# checkout the actual content 
config checkout
```

The step above might fail with a message like:

```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Re-run the check out if you had problems:

```bash
config checkout
```

Set the flag showUntrackedFiles to no on this specific (local) repository:

```bash
config config --local status.showUntrackedFiles no
```

From now on you can use config to add or update the dotfiles.
```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

## Install vim plugins

Now that you have installed every dot file, start vim and execute

```
:PluginInstall
```

this will install all the plugin you need for vim.
