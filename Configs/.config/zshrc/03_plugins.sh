# safe-paste: prevent code from running while pasting
# url-tools : urlencode/urlencode 'given string'
# zsh-navigation-tools: (n-aliases| n-cd| n-functions| n-history| n-kill| n-env| n-options| n-panelize)
# fast-syntax-highlighting: highlighting
# bgnotify: send a notification when a long task is completed
# zsh-interactive-cd: interactive 'cd' with 'fzf', like fish shell
# vi-mode: vi/vim motions
plugins=(bgnotify safe-paste)
# plugins=(urltools)

# source "/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# ZVM_KEYTIMEOUT=0.1 # default is (0.4)

if [[ ! -d /home/$USER/.config/zshrc/plugins/zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair /home/$USER/.config/zshrc/plugins/zsh-autopair
fi
source "/home/$USER/.config/zshrc/plugins/zsh-autopair/zsh-autopair.plugin.zsh"
autopair-init

# ( fast-theme -t {theme-name} | fast-theme -l )
source "/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=1,bold,underline"
# bindkey '^ ' autosuggest-accept # autosuggest-execute
bindkey '^[l' 'autosuggest-accept'

source "$ZSH"/oh-my-zsh.sh

# WARN: must be after souring oh-my-zsh, otherwise won't work
source "/home/$USER/.config/zshrc/plugins/zsh_interactive_cd.plugin.zsh"
