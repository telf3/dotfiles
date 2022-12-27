# Install dependencies

Ubuntu
```bash
sudo apt install zsh vim tmux wget git fzf
```

Arch
```bash
sudo pacman -S zsh vim tmux wget git fzf
```

# Usage
Install all
```bash
find . -maxdepth 1 -type d \( ! -name . \) \( ! -name .git \) -exec bash -c "cd '{}' && cp -rv . ~" \;
```
