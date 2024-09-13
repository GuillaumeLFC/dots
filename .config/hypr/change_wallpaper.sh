#!/bin/bash

wallpaper_dir="/home/guillaume/wallpapers/"

wallpaper=$(ls "$wallpaper_dir" | wofi --dmenu --location=top_right --width=600 --height=200 --xoffset=-60 -l 3 -i -p "Choisir un fond d'écran")

if [[ $wallpaper = "" ]]; then 
  exit 
fi 

echo "" > /home/guillaume/.config/hypr/hyprpaper.conf
echo "preload = ~/wallpapers/$wallpaper" >> ~/.config/hypr/hyprpaper.conf
echo "wallpaper = ,~/wallpapers/$wallpaper" >> ~/.config/hypr/hyprpaper.conf
echo "splash = false" >> ~/.config/hypr/hyprpaper.conf

pkill hyprpaper
hyprpaper

