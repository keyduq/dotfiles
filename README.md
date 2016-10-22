# dotfiles
Mis dotfiles, funciona para Ubuntu 16.04

![Screenshot](https://raw.githubusercontent.com/keyduq/dotfiles/master/screenshot.png)

## Requisitos

- Python 2 o 3
- Git
- Módulos de python

Si no posees los módulos de python, debes instalarlos con el siguiente comando
```shell
sudo apt install python-dev python-pip python3-dev python3-pip
```

## Instalación

### Dotfiles

Primero que nada debes correr el siguiente comando para obtener el repositorio:
```
git clone https://github.com/keyduq/dotfiles.git ~/dotfiles
```

### Instalar oh-my-zsh

Las instrucciones para instalar estan aquí [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

### Gnome terminal base16 solarized theme

Debes correr lo siguiente:
```shell
git clone https://github.com/chriskempson/base16-gnome-terminal.git ~/.config/base16-gnome-terminal
source .config/base16-gnome-terminal/base16-solarized.dark.sh
```
Luego debes elegir el perfil abriendo la terminal e yendo al menú Terminal > Change profile > Base16 Solarized Dark

### Instalar neovim

Para las instrucciones en ubuntu ingresa aquí [Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)

Para poder instalar plugins que necesiten neovim compilado con python (como el incluido YouCompleteMe), debes correr lo siguiente:
```shell
sudo pip3 install neovim
```

### Instalar tmux

Sólo debes correr el comando:
```shell
sudo apt install tmux
```

## Configuración

Primero que nada se deben crear symlinks a este repositorio de la siguiente manera
```shell
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
```

Luego debes instalar [vim-plug](https://github.com/junegunn/vim-plug):
```shell
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Después vas a instalar los plugins de vim
```shell
vim +PlugInstall
```

Debes copiar la carpeta de temas base16:
```shell
cp -rf ~/.config/nvim/plugged/base16-vim/colors ~/.config/nvim/colors
```

### Autocompletado Javascript y Typescript

Primero que nada debes tener instalado [nodejs](https://nodejs.org/en/)

Luego instalar el autocompletado para javascript y typescript con [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

**Javascript**
```shell
~/.config/nvim/plugged/YouCompleteMe/install.py --tern-completer
```
**Typescript**
```shell
sudo npm i -g typescript
```

## Problemas

Si se muestran el header y bottom de vim en azul, debes obtener [base16-shell](https://github.com/chriskempson/base16-shell) 
y agregar a tu .zshrc lo siguiente:
```zsh
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
```

