diskutil eject "$(mount | grep cddafs | awk -F 'on | \\(cdda' '{print $2}')"
