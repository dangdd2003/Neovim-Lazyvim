# 💤 LazyVim

## Installation

### Make a backup of current Neovim files

- Linux/MacOS

```shell
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- Windows

```shell
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

### Clone the repository

- Linux/MacOS

```shell
git clone https://github.com/dangdd2003/Neovim-Lazyvim.git ~/.config/nvim
```

- Windows

```shell
git clone https://github.com/dangdd2003/Neovim-Lazyvim.git $env:LOCALAPPDATA\nvim
```

### Start nvim

```shell
nvim
```

## Uninstallation

- Linux/MacOS

```shell
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.loca/state/nvim
rm -rf ~/.cache/nvim

```

- Windows

```shell
# required
rd -r $env:LOCALAPPDATA\nvim

# optional but recommended
rd -r $env:LOCALAPPDATA\nvim-data
```

## Custom configuration

- Visit main page of [LazyVim](https://www.lazyvim.org)
