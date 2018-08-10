function mypkgs
	pacman -Qent | cut -d' ' -f1
end
