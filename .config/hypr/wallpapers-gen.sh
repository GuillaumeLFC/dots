#!/bin/bash

wallpapers=(
  "~/wallpapers/doggo.png"
  "~/wallpapers/mushrooms_1.png"
  "~/wallpapers/mushrooms_2.png"
  "~/wallpapers/mushrooms_3.png"
  "~/wallpapers/mushrooms_4.png"
  "~/wallpapers/japan_tower_pink.jpg"
  "~/wallpapers/japan_mountain_pink.jpg"
  "~/wallpapers/mountain_dragon_pink.jpg"
  )

num_workspaces=7
shuffled_wallpapers=($(shuf -e "${wallpapers[@]}" | head -n $num_workspaces))
config_file="/home/guillaume/.config/hypr/hyprpaper.conf"
binding_file="/home/guillaume/.config/hypr/wallpapers.sh"

echo "" > $binding_file
echo "" > $config_file
echo "je suis executé" >> ~/.log
for ((i=0; i < $num_workspaces; i++)); do 
  echo "\$w$((i)) = hyprctl hyprpaper wallpaper ',${shuffled_wallpapers[${i}]}'" >> $binding_file
  echo "preload = ${shuffled_wallpapers[${i}]}" >> $config_file
done

echo "splash = false" >> $config_file
echo "wallpaper = ,${shuffled_wallpapers[0]}" >> $config_file 
