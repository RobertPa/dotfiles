function paxflags
	sudo setfattr -n user.pax.flags -v m $argv
end
