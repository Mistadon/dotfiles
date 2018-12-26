separator="|"

if [ $(hostname) = "moritz-arch" ]; then
    bat=$(acpi | awk '{
           gsub(",", "", $4)
           gsub(":[0-5][0-9]$", "", $5)
           if ($3 == "Discharging,") {
              print $4 " (" $5 " " $6 ")"
           }
           else {
              if ($6 == "until") {
                 print $4 " (" $5 " " $6 " " $7 ")"
              }
              else {
                 print $4
              }
           }
           }')
    bat=" $bat $separator "
else
    bat=''
fi

# datetime=$(date +"%A, %d %B %Y, %R")
date=$(date +"%A, %d %B %Y")
time=$(date +"%R")
xsetroot -name "$bat$date $separator $time"
