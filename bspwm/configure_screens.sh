#!/bin/bash
DESKTOPS=(1 2 3 4 5 6 7 8 9 0)
DESKTOPS_PER_SECONDARY=2

PRIMARY=$(xrandr -q | grep -Po '[a-zA-Z0-9]*(?= connected primary)')

declare -a SECONDARIES
mapfile -t SECONDARIES < <( xrandr -q | grep -Po '^[a-zA-Z0-9]*(?= connected(?! primary))' )


echo "Primary screen:"
echo "$PRIMARY"
echo "Secondary screens: ${#SECONDARIES[*]}"
echo "$SECONDARIES"
echo "===END==="

# Circle though the secondary screens, assigning a position (top, right, bottom, left)
SECONDARY_DIRECTIONS=(--above --right-of --below --left-of)
for i in ${!SECONDARIES[*]}
do
	echo "xrandr --output ${SECONDARIES[$i]} ${SECONDARY_DIRECTIONS[$i]} $PRIMARY"
	xrandr --output ${SECONDARIES[$i]} ${SECONDARY_DIRECTIONS[$i]} $PRIMARY
done

DESKTOPS_ON_PRIMARY=$(( ${#DESKTOPS[*]} - $DESKTOPS_PER_SECONDARY * ${#SECONDARIES[*]}))
echo "Primary: ${DESKTOPS[@]:0:$DESKTOPS_ON_PRIMARY}"
bspc monitor $PRIMARY -d ${DESKTOPS[@]:0:$DESKTOPS_ON_PRIMARY}

for SECONDARY in ${SECONDARIES[*]}
do
	echo "Secondary $SECONDARY: ${DESKTOPS[@]:DESKTOPS_ON_PRIMARY:$DESKTOPS_PER_SECONDARY}"
	bspc monitor $SECONDARY -d ${DESKTOPS[@]:DESKTOPS_ON_PRIMARY:$DESKTOPS_PER_SECONDARY}
	((DESKTOPS_ON_PRIMARY+=$DESKTOPS_PER_SECONDARY))
done
