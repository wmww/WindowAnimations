#!/bin/bash
# See https://superuser.com/a/556031
ffmpeg -framerate 30 -i render_png/img%04d.png -vf "fps=30,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 output.gif
