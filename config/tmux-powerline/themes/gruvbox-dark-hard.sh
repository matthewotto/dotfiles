# shellcheck shell=bash
# tmux-powerline theme: gruvbox-dark-hard
#
# base16-gruvbox-dark-hard palette mapped to 256-color indices:
#   base00 #1d2021 → 234   background (darkest)
#   base01 #3c3836 → 237   dark surface
#   base02 #504945 → 239   selection / inactive
#   base03 #665c54 → 241   comments / muted
#   base04 #bdae93 → 144   light muted fg
#   base06 #d5c4a1 → 223   primary fg
#   base08 #fb4934 → 167   red
#   base09 #fe8019 → 208   orange
#   base0A #fabd2f → 214   yellow
#   base0B #b8bb26 → 142   green
#   base0C #8ec07c → 108   aqua/cyan
#   base0D #83a598 → 109   blue
#   base0E #d3869b → 175   purple

TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=$'\ue0b2'
TMUX_POWERLINE_SEPARATOR_LEFT_THIN=$'\ue0b3'
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=$'\ue0b0'
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=$'\ue0b1'

TMUX_POWERLINE_WINDOW_LEFT=$'\ue0b6'
TMUX_POWERLINE_WINDOW_RIGHT=$'\ue0b4'
TMUX_POWERLINE_DISK_USAGE_IMAGE=$'\uf0a0'


TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'234'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'223'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

TMUX_POWERLINE_SEG_VCS_BRANCH_GIT_SYMBOL_COLOUR='234'


# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_CURRENT" ]; then
	TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
		"#[$(tp_format regular)]"
		"$TMUX_POWERLINE_WINDOW_LEFT"
		"#[$(tp_format inverse)]"
		" #F#I:#W "
		"#[$(tp_format regular)]"
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
    "#[fg=colour241,bg=colour234]"
		"$TMUX_POWERLINE_WINDOW_LEFT"
		"#[fg=white,bg=colour241]"
		" #{?window_flags,#F, }#I:#W "
    "#[fg=colour241,bg=colour234]"
		"$TMUX_POWERLINE_WINDOW_RIGHT"
		"#[$(tp_format regular)]"
	)
fi

# Format: segment_name [bg_color] [fg_color] [separator] [sep_bg] [sep_fg] [spacing_disable] [separator_disable]
# Colors: named, #rrggbb hex, 0-255 palette index, default_bg_color, default_fg_color, default, terminal

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_LEFT_STATUS_SEGMENTS" ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
    "mode_indicator 109 234"
		# Session name — green bg, dark fg
		"tmux_session_info 142 234"
		# CWD — blue bg, dark fg
		"hostname 109 234"
		"pwd 109 234"
	)
fi

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS" ]; then
	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
    "vcs_branch 109 234"
    "tmux_continuum_status 175 237"
    "tmux_continuum_save 175 237"
    "mem_used 234"
    "disk_usage 234 208 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN} "
  # Date — dark surface bg, primary fg
		"date 237 223 ${TMUX_POWERLINE_SEPARATOR_LEFT_BOLD} 175"
		# Time — orange bg, dark fg
		"time 208 234 ${TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}"
	)
fi
