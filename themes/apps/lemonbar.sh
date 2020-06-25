#!/bin/bash
FIFO=""
cat <<EOF > $BSPWM_FIFO
BACKGROUND=${COLORS['background']}
FOREGROUND=${COLORS['foreground_bold']}
EOF
