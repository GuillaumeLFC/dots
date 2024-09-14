#!/bin/bash

rm ~/.wallpaper.*
rm /usr/share/sddm/themes/sddm-astronaut-theme/wallpaper.*
wallpaper=$(find ~/wallpapers/* | shuf -n 1)
echo $wallpaper
extension=${wallpaper##*.}
cp $wallpaper ~/.wallpaper.$extension
cp $wallpaper /usr/share/sddm/themes/sddm-astronaut-theme/wallpaper.$extension
chmod 764 ~/.wallpaper.$extension
chmod 764 /usr/share/sddm/themes/sddm-astronaut-theme/wallpaper.$extension

if [[ "$extension" == 'jpg' ]]; then
  sed -i 's|Background=.*$|Background=wallpaper.jpg|' /usr/share/sddm/themes/sddm-astronaut-theme/theme.conf
elif [[ "$extension" == "png" ]]; then
  sed -i 's|Background=.*$|Background=wallpaper.png|' /usr/share/sddm/themes/sddm-astronaut-theme/theme.conf
else
  sed -i 's|Background=.*$|Background=background.png' /usr/share/sddm/themes/sddm-astronaut-theme/theme.conf
fi


echo "" > /home/guillaume/.config/hypr/hyprpaper.conf
echo "preload = ~/.wallpaper.$extension" >> ~/.config/hypr/hyprpaper.conf
echo "splash = false" >> ~/.config/hypr/hyprpaper.conf
echo "wallpaper = ,~/.wallpaper.$extension" >> ~/.config/hypr/hyprpaper.conf

echo "On a tout bien fait et le wallpaper est $wallpaper"
# wallpapers=(
#   "~/wallpapers/doggo.png"
#   "~/wallpapers/mushrooms_1.png"
#   "~/wallpapers/mushrooms_2.png"
#   "~/wallpapers/mushrooms_3.png"
#   "~/wallpapers/mushrooms_4.png"
#   "~/wallpapers/japan_tower_pink.jpg"
#   "~/wallpapers/japan_mountain_pink.jpg"
#   "~/wallpapers/mountain_dragon_pink.jpg"
#   "~/wallpapers/astronaut.png"
#   )
#
# num_workspaces=7
# shuffled_wallpapers=($(shuf -e "${wallpapers[@]}" | head -n $num_workspaces))

# binding_file="/home/guillaume/.config/hypr/wallpapers.sh"

# echo "" > $binding_file

# for ((i=0; i < $num_workspaces; i++)); do 
#   echo "\$w$((i)) = hyprctl hyprpaper wallpaper ',${shuffled_wallpapers[${i}]}'" >> $binding_file
#   # echo "preload = ${shuffled_wallpapers[${i}]}" >> $config_file
# done
