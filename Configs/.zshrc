# ------------ Source the configuration files --------------------

for cfgs in "$HOME"/.config/zshrc/*; do
  source "$cfgs"
done

# ----------------------------------------------------------------

alias pat='nvim --headless ~/dev/pat "+yank" +qa'
alias oh="cd /home/gl00ria/Documents/notes/ && \nvim"
alias todo="cd /home/gl00ria/Documents/todo/ && \nvim"

# ----------------------------------------------------------------
