get_bat(){
PERCENTAGE="$(acpi -i -b | head -n 1 | gawk -F '[[:space:]]|%' '{print $4}')"
    echo ' BAT' $PERCENTAGE '%'
}

get_ip(){
echo 'IP' $(curl -s http://whatismyip.akamai.com)
}

while true; do
    xsetroot -name " $(get_bat) | $(get_ip) | $(date +"%F %R" )";
    sleep 1m;
    done &


xautolock -time 10 -locker slock &
devmon --info-on-mount &
setlayout
aumix -v90
sct 4900
xrdb ~/.Xresources
export _JAVA_AWT_WM_NONREPARENTING=1
light -S 85
nitrogen --restore &

export EDITOR="vim"
export BROWSER="chromium"

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

compton -CGb
exec dwm
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session dwm

