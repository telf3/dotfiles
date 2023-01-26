find . -maxdepth 1 -type d \( ! -name . \) \( ! -name .git \) -exec bash -c "cd '{}' && cp -rv . ~" \;
