# zplug {{{
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose
# }}}

# ヒストリの設定 {{{
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# }}}

# zstyle {{{
# 大文字小文字区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 上下左右に補完選択
zstyle ':completion:*:default' menu select=2
# 補完候補に色を付ける
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# キャッシュを使ってコマンド高速化
zstyle ':completion:*' use-cache true
# }}}

# setopt {{{
setopt hist_ignore_dups   # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_all_dups  # 重複したヒストリは追加しない
setopt hist_ignore_space # スペースから始まるコマンド行はヒストリに残さない
setopt magic_equal_subst
setopt auto_list  # 補完候補が複数ある時に、一覧表示
setopt auto_menu  # 補完候補が複数あるときに自動的に一覧表示する
setopt share_history  # シェルのプロセスごとに履歴を共有
setopt ignore_eof # Ctrl+Dでzshを終了しない
# }}}

# PATH {{{
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export XDG_DATA_DIRS="$HOME/.linuxbrew/share:$XDG_DATA_DIRS"
# }}}

# その他 {{{
bindkey "^[[3~" delete-char # Deleteを使えるように
eval `dircolors ~/.config/color/dircolors-solarized/dircolors.ansi-dark`
# }}}
