function sstatus
    if test -e /usr/sbin/sv
        doas sv status $argv
    else
	    doas rc-service $argv status
    end
end
