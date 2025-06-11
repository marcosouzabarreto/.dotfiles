function timeshift_gui
    xhost si:localuser:root
    sudo timeshift-gtk
    xhost -si:localuser:root
end
