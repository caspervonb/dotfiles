# Source /etc/bashrc
if [ -f "/etc/bashrc" ]; then
  source "/etc/bashrc"
fi

# Source ~/.shrc
if [ -f "$HOME/.shrc" ]; then
  source $HOME/.shrc
fi

# Source completions
for file in $HOME/.bash/completion/*; do
  source $file;
done
