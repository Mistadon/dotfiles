#!/bin/sh
# set dwm status bar text
# script idea from here: https://gitlab.com/snippets/1863242

tmp_status_file=/run/user/$(id -u)/tmp_status

bat_percent() { read -r bat_percent </sys/class/power_supply/BAT0/capacity
                read -r bat_status </sys/class/power_supply/BAT0/status
            }
date_time() { date_time="$(date +"%A, %d %B %Y | %R")"; }
tmp_status() { read -r tmp_status_time <$tmp_status_file
               curr_time=$(date +%s)
            }

main() {
	every() { [ $((${round:=0} % ${1:-1})) -eq 0 ]; }

	while :; do
		every 1 && {
            date_time
            tmp_status
		}
		every 10 && {
            bat_percent
		}

    if (($curr_time >= $tmp_status_time + 5)); then
        xsetroot -name 
        sh ~/git/dotfiles/scripts/set_status.sh "${bat_percent}% (${bat_status}) | ${date_time}"
    fi

		round=$((round + 1))
		sleep 1
	done
}; main

