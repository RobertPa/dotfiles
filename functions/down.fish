function down
    if test -e /usr/sbin/sv
        doas sv down $argv
    else
	    doas rc-service $argv stop
    end
end
