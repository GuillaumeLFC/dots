#!/bin/bash
hyprctl output create headless vnc
wayvncctl output-set vnc
hyprctl keyword monitor eDP-1,disable
wayvnc
