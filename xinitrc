#get_bat(){
#PERCENTAGE="$(acpi -i -b | head -n 1 | gawk -F '[[:space:]]|%' '{print $4}')"
#    echo ' BAT' $PERCENTAGE '%'
#}

get_bat(){
	echo "$(apm -l)"
}
	
get_ip(){
echo 'IP' $(curl -s http://whatismyip.akamai.com)
}

#while true; do
#    xsetroot -name " $(get_bat) | $(get_ip) | $(date +"%F %R" )";
#    sleep 1m;
#    done &

export EDITOR="vim"
export BROWSER="chrome"
PKG_PATH=http://mirror.hs-esslingen.de/pub/OpenBSD/snapshots/packages/amd64/
export PKG_PATH
export PARALLEL_BUILD=Yes 
export MAKE_JOBS=8 
export _JAVA_AWT_WM_NONREPARENTING=1

xautolock -time 10 -locker slock &
#devmon --info-on-mount &
#setlayout
xmodmap ~/.capsswitch
wsconsctl keyboard.bell.volume=0
xset b off
xset b 0 0 0

sct 4900
xbacklight -set 87

xrdb ~/.Xresources
nitrogen --restore &
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
compton -CGb
tmuxinator base
#exec dwm
exec spectrwm
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session dwm

