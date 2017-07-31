function paxflags
	doas setfattr -n user.pax.flags -v m $argv
end
