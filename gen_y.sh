#!/bin/sh
echo "\nResHelper: Generating data...\n";
name="shaper_calibrate_y";
[ ! -d $HOME"/klipper_config/RES_DATA/" ] && mkdir ~/klipper_config/RES_DATA;

#graph generation
~/klipper/scripts/calibrate_shaper.py /tmp/resonances_y_*.csv -o ~/klipper_config/RES_DATA/shaper_calibrate_y.png;

#damping ratio
dr="$(Rscript ~/ResHelper/Y.R)";
dr=${dr#"[1] "};
echo "Damping ratio for Y calculated:\ndamping_ratio_y: $dr\n ";
name="$name-dr_$dr-v$(date "+%Y%m%d_%H%M").png";


#cleanup
mv ~/klipper_config/RES_DATA/shaper_calibrate_y.png ~/klipper_config/RES_DATA/$name;
find '/tmp/' -name "resonances_y_*.csv" -print 2>/dev/null -exec rm {} \;
