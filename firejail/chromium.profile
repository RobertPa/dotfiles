# Chromium browser profile
noblacklist ~/.config/chromium
noblacklist ~/.cache/chromium
include /etc/firejail/disable-common.inc
include /etc/firejail/disable-programs.inc

blacklist /data
netfilter

whitelist ${DOWNLOADS}
mkdir ~/.config/chromium
whitelist ~/.config/chromium
mkdir ~/.cache/chromium
whitelist ~/.cache/chromium
mkdir ~/.pki
whitelist ~/.pki

# lastpass, keepassx
whitelist ~/.keepassx
whitelist ~/.config/keepassx
whitelist ~/keepassx.kdbx
whitelist ~/.lastpass
whitelist ~/.config/lastpass

# specific to Arch
#whitelist ~/.config/chromium-flags.conf

include /etc/firejail/whitelist-common.inc
