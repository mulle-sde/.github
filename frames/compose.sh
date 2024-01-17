#! /bin/sh

convert -loop 0 `cat scene.txt` anim.gif &&
gifsicle -O3 --lossy=95 anim.gif -o opti.gif
