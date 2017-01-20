set fish_greeting

# eval sh ~/.config/base16-shell/base16-solarized.dark.sh
eval sh ~/.config/base16-shell/base16-flat.sh
# Git
git config --global color.ui true
git config --global format.pretty short
git config --global core.autocrl input
git config --global core.fileMode true
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias editC='atom ~/.config/config.fish'
alias masterful='git pull origin master'
alias beGoneFool='git checkout .'
alias push='git push'
alias pull='git pull'
alias clone='git clone $1'
alias gs='git status -s'
alias gss='git status'
alias gc-='git checkout -'
alias gc0='git checkout -'
alias f-c='git fetch; and git checkout'
alias reload='source ~/.config/fish/config.fish'
alias m2s='git checkout staging; and set_color blue; echo "ON STAGING BRANCH"; set_color normal; and git pull; and set_color red; echo "PULLED"; set_color normal; and git merge -; and set_color blue; echo "MERGED"; set_color normal; and git push; and set_color red; echo "PUUUUUUUUSHED"; set_color normal; and gc-; set_color green; and echo "BACK!"; set_color normal'
alias lastChanged='git log --name-status -4'
alias removeOrig='rm -rf */**/*.orig'

alias subl='Open -a Sublime\ Text\ 2'
alias atom='Open -a Atom'
alias sketch='Open -a Sketch'
alias chrome='Open -a "Google Chrome"'
alias imgopt='Open -a ImageOptim'

alias topProcess='top -o cpu -O +rsize -s 5 -n 20'

alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'
alias c='clear'

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_show_informative_status 'yes'

function prdif
    git request-pull getOriginSHA
end

function getOriginSHA
    git rev-parse origin/master
end

function unstage
    git reset HEAD $args
end

function lastDiff
    git diff (git rev-parse HEAD)^ HEAD
end

function fish_prompt
    set -l last_status $status
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')

    if [ $last_status -ne 0 ]
        set_color red
        echo -ne '\n▽ '
    else
        set_color cyan
        echo -ne '\n△ '
    end
    set_color yellow
    echo -ne (prompt_pwd)
    set_color normal

    if git ls-files >/dev/null ^/dev/null
        if git status | grep "nothing to commit" > /dev/null
            set_color green
        else
            set_color red
        end
    end

    echo (__fish_git_prompt)
    set_color normal
    echo -e '→ '
end

if [ $ITERM_SESSION_ID ]
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
end



#set -gx PATH $PATH ~/.gem/ruby/1.8/bin:/opt/nginx/sbin
# rvm default
#set -gx PATH /opt/local/bin /opt/local/sbin $PATH
rvm default
