function update-grub
    doas grub-mkconfig -o /boot/grub/grub.cfg
end
