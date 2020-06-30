#!/bin/bash
# forest night theme

declare -A COLORS
# Black/Grey
COLORS['color0']='#262626' # color 235
COLORS['color8']='#303030' # color 236
# Maroon/Red
COLORS['color1']='#ff005f' # color 197
COLORS['color9']='#d70000' # color 160
# Green/Lime
COLORS['color2']='#afd700' # color 148
COLORS['color10']='#87ff00' # color 118
# Olive/Yellow
COLORS['color3']='#d7d787' # color 186
COLORS['color11']='#d75f00'  # color 166
# Navy/Blue
COLORS['color4']='#5fd7ff' # color 81
COLORS['color12']='#5f87af' # color 67
# Purple/Fuchsia
COLORS['color5']='#af87ff' # color 141
COLORS['color13']='#875f5f' # color 95
# Teal/Aqua
COLORS['color6']='#75715e' # color 144
COLORS['color14']='#87ffaf' # color 121
# Silver/White
COLORS['color7']='#bcbcbc' # color 241
COLORS['color15']='#ffffff' # color 15

COLORS['foreground']=${COLORS['color7']}
COLORS['foreground_bold']=${COLORS['color15']}
COLORS['cursor']=${COLORS['color7']}
COLORS['cursor_foreground']=${COLORS['color0']}
COLORS['background']=${COLORS['color0']}

NVIM_OPTIONS="\
set termguicolors
colorscheme forest-night
let g:airline_theme = 'forest_night'
"

BAT_CONFIG=""

WALLPAPER="$HOME/Nextcloud/misc/wallpapers/itstoolate.jpg"
for file in $HOME/git/dotfiles/themes/apps/*; do
	source $file
done
