#!/bin/sh
sed -i \
         -e 's/#f2f4f4/rgb(0%,0%,0%)/g' \
         -e 's/#383e42/rgb(100%,100%,100%)/g' \
    -e 's/#4e585f/rgb(50%,0%,0%)/g' \
     -e 's/#3daee9/rgb(0%,50%,0%)/g' \
     -e 's/#fcfcfc/rgb(50%,0%,50%)/g' \
     -e 's/#4d4d4d/rgb(0%,0%,50%)/g' \
	$@
