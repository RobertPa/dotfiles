function wifi
	doas ip link set wlan0 $argv
end
