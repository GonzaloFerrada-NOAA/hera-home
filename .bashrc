# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

source /scratch1/BMC/gsd-fv3-dev/Gonzalo.Ferrada/miniconda3/etc/profile.d/conda.sh

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ls='ls --color=auto'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# bind 'set match-hidden-files off'
# bind 'set horizontal-scroll-mode off'

# Only run bind if the shell is interactive
if [[ $- == *i* ]]; then
	bind 'set match-hidden-files off'
	bind 'set horizontal-scroll-mode off'
fi

export TERM=xterm-256color

# Load modules:
module load gnu intel/2023.2.0 ncview/2.1.7
module load netcdf/4.7.0
module load xxdiff
module load nco cdo ncl
module load rocoto
module load wgrib2


# Common aliases:
alias c='clear'
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."
alias cd.......="cd ../../../../../.."
alias kk="ls -ltrh"
alias ll="ls -lh"
alias la="ls -la"
alias l1="ls -1"
alias ld="ls -lhd"
alias reload="source ~/.bashrc; clear"


# Shortcuts:
alias sc0="cd /scratch1/data_untrusted/Gonzalo.Ferrada"
alias sc1="cd /scratch1/BMC/gsd-fv3-dev/Gonzalo.Ferrada"
alias sc2="cd /scratch2/BMC/gsd-fv3-dev/Gonzalo.Ferrada"
alias sc3="cd /scratch3/BMC/gsd-fv3-dev/Gonzalo.Ferrada"
export SC0="/scratch1/data_untrusted/Gonzalo.Ferrada"
export SC1="/scratch1/BMC/gsd-fv3-dev/Gonzalo.Ferrada"
export SC2="/scratch2/BMC/gsd-fv3-dev/Gonzalo.Ferrada"
export SC3="/scratch3/BMC/gsd-fv3-dev/Gonzalo.Ferrada"
alias mate="rmate"
alias acc="saccount_params"
# alias quota="saccount_params"
alias grepi="grep -rnw . -e "
alias grepo="grep -rno . -e "
alias findi="find . -print | grep -i "
alias tf="tail -f "
alias weight="du -skh"
alias ncview="ncview -repl"


# Slurm:
alias qsme="date; squeue --user=Gonzalo.Ferrada"
alias qs="date; squeue --start --user=Gonzalo.Ferrada"


# Sudo:
alias rtfim="sudo su - role.rtfim"


# PATH:
PATH="/home/Gonzalo.Ferrada/bin:$PATH"
export PATH

# ------------------------------------------------------
# Application specifics:
# Python:
export PATH=/scratch1/BMC/gsd-fv3-dev/Gonzalo.Ferrada/miniconda3/bin:$PATH
export PYTHONPATH=/scratch1/BMC/gsd-fv3-dev/Gonzalo.Ferrada/HOME/PYTHON/FUNCTIONS

# Matlab:
MATLABPATH=$( find /scratch3/BMC/gsd-fv3-dev/Gonzalo.Ferrada/.HOME/MATLAB/matlab-earth-sciences -type d | awk '{ printf ":%s", $1; }' )
# MATLABPATH=/home/Gonzalo.Ferrada/MATLAB/LARGE:${MATLABPATH}
# MATLABPATH=/home/Gonzalo.Ferrada/MATLAB/FUNCTIONS:${MATLABPATH}
export MATLABPATH
alias loadmatlab='module load matlab; matlab -nodisplay -nodesktop -nosplash'
alias loadmatlab1='module load matlab; matlab -nodesktop -nosplash'

# Geoweaver:
export GEOWEAVER_PORT=8071

# Terminal beautification:
update_prompt() {
    DIR1=$(echo "$PWD" | cut -d/ -f2)               # Extract top-level directory
    DIR2=$(basename "$(dirname "$PWD")")           # Extract parent of current directory
    PS1="\[\033[31m\]\h:\[\033[32m\]$DIR1\[\033[37m\]:$DIR2\[\033[33m\]/\W\[\033[0m\]> "
}

PROMPT_COMMAND=update_prompt

# Java (Geoweaver):
export JAVA_HOME="/home/Gonzalo.Ferrada/jdk/jdk-11.0.18+10"
export PATH="$JAVA_HOME/bin:$PATH"
