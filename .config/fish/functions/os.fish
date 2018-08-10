#!/usr/bin/env fish
function os -a dir
	set programs "emacsclient -c" "thunar"
	if not count $dir >/dev/null
		set dir "."
	end
	if not test -d $dir
		if test -e $dir
			echo "$dir exists and it is not a directory! Aborting"
		else
			mkdir $dir
		end
	end
	for prog in $programs
		fish -c "$prog $dir" &
	end
	cd $dir
end
