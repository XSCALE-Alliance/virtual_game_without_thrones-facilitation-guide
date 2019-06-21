systemctl stop minetestrunner
git -C /usr/share/minetest/games/virtual_game_without_thrones/ pull origin --recurse-submodules
systemctl start minetestrunner