function tpeoff
	doas sysctl -w kernel.grsecurity.tpe=0
end
