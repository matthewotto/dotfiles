# shellcheck shell=bash
# tmux-powerline theme: base16-ocean
#
# base16-ocean palette mapped to 256-color indices:
BASE00=236 #  #2b303b background (darkest)
BASE01=237 #  #343d46 dark surface
BASE02=59  #  #4f5b66 selection / inactive
BASE03=66  #  #65737e comments / muted
BASE04=146 #  #a7adba light muted fg
BASE05=250 #  #c0c5ce primary fg
BASE08=131 #  #bf616a red
BASE09=173 #  #d08770 orange/salmon
BASE0A=222 #  #ebcb8b yellow
BASE0B=108 #  #a3be8c green
BASE0C=109 #  #96b5b4 teal/cyan
BASE0D=110 #  #8fa1b3 blue
BASE0E=139 #  #b48ead purple
BASE0F=137 #  #ab7967 brown

TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=$'\ue0b2'
TMUX_POWERLINE_SEPARATOR_LEFT_THIN=$'\ue0b3'
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=$'\ue0b0'
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=$'\ue0b1'

TMUX_POWERLINE_WINDOW_LEFT=$'\ue0b6'
TMUX_POWERLINE_WINDOW_RIGHT=$'\ue0b4'
TMUX_POWERLINE_DISK_USAGE_IMAGE=$'\uf0a0'

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-$BASE00}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-$BASE05}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

TMUX_POWERLINE_SEG_VCS_BRANCH_GIT_SYMBOL_COLOUR=$BASE00

TMUX_POWERLINE_SEG_MODE_INDICATOR_PREFIX_MODE_TEXT_COLOR="colour${BASE08}"
TMUX_POWERLINE_SEG_MODE_INDICATOR_COPY_MODE_TEXT_COLOR="colour${BASE0A}"

TMUX_POWERLINE_SEG_VCS_BRANCH_DEFAULT_SYMBOL=""

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_CURRENT" ]; then
	TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
		"#[$(tp_format regular)]"
		"#[fg=colour${BASE0A},bg=colour${BASE00}]"
		"$TMUX_POWERLINE_WINDOW_LEFT"
		"#[fg=colour${BASE00},bg=colour${BASE0A}]"
		" #F#I:#W "
		"#[fg=colour${BASE0A},bg=colour${BASE00}]"
		"$TMUX_POWERLINE_WINDOW_RIGHT"
	)
fi

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_STYLE" ]; then
	TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
		"$(tp_format regular)"
	)
fi

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_FORMAT" ]; then
	TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
		"#[fg=colour${BASE02},bg=colour${BASE00}]"
		"$TMUX_POWERLINE_WINDOW_LEFT"
		"#[fg=colour${BASE05},bg=colour${BASE02}]"
		" #{?window_flags,#F, }#I:#W "
		"#[fg=colour${BASE02},bg=colour${BASE00}]"
		"$TMUX_POWERLINE_WINDOW_RIGHT"
		"#[$(tp_format regular)]"
	)
fi


# Format: segment_name [bg_color] [fg_color] [separator] [sep_bg] [sep_fg] [spacing_disable] [separator_disable]
# Colors: named, #rrggbb hex, 0-255 palette index, default_bg_color, default_fg_color, default, terminal

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_LEFT_STATUS_SEGMENTS" ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		# Mode indicator — blue bg, dark fg
		"mode_indicator ${BASE01} ${BASE03}"
		# Session name — green bg, dark fg
		"tmux_session_info ${BASE0D} ${BASE01} ${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}"
		# Hostname — blue bg, dark fg
		"hostname ${BASE0F} ${BASE00}"
		# CWD — blue bg, dark fg
		"pwd ${BASE02} ${BASE05}"
	)
fi

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS" ]; then
	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		# Git branch — blue bg, dark fg
		"vcs_branch ${BASE0B} ${BASE01}"
		"tmux_continuum_save ${BASE0E} ${BASE01}"
		# Memory — dark bg, primary fg
		"mem_used ${BASE0E} ${BASE01} "
		# Disk usage — dark bg, orange fg
		"disk_usage ${BASE0E} ${BASE01} ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
		# Date — dark surface bg, primary fg
		"date ${BASE02} ${BASE09} ${TMUX_POWERLINE_SEPARATOR_LEFT_BOLD} ${BASE0E}"
		# Time — orange/salmon bg, dark fg
		"time ${BASE09} ${BASE00} ${TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}"
	)
fi
