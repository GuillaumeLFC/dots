#!/bin/bash

wallpaper_dir="/home/guillaume/wallpapers/"

wallpaper=$(ls "$wallpaper_dir" | wofi --dmenu -i -p "Choisir un fond d'écran")

echo "" > /home/guillaume/.config/hypr/hyprpaper.conf
echo "preload = ~/wallpapers/$wallpaper" >> ~/.config/hypr/hyprpaper.conf
echo "wallpaper = ,~/wallpapers/$wallpaper" >> ~/.config/hypr/hyprpaper.conf
echo "splash = false" >> ~/.config/hypr/hyprpaper.conf

pkill hyprpaper
hyprpaper

