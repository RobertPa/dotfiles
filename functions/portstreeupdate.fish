function portstreeupdate
	cd /usr/ports
doas cvs -q up -Pd
doas chown -R root:wsrc /usr/ports
end
