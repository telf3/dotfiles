# Install dependencies

Ubuntu
```bash
sudo apt install zsh vim tmux wget git stow
```

Arch
```bash
sudo pacman -S zsh vim tmux wget git stow
```

Oh My Zsh
```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# Usage

Install with stow
```bash
stow */
```
or stow vim, tmux etc.  

Install without stow

```bash
cp -r zsh/.* ~
```
