#!/bin/sh
git clone https://github.com/XSCALE-Alliance/virtual_game_without_thrones.git /usr/share/minetest/games/virtual_game_without_thrones
cp "$(dirname $0)/../config/world.mt" /home/minetestrunner/.minetest/worlds/world/