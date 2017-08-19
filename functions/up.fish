function up
    if test -e /usr/sbin/sv
        doas sv up $argv
    else
	    doas rc-service $argv start
    end
end
