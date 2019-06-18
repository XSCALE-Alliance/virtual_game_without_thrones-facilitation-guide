# Server installation

## Installation notes:

I started from a Ubuntu 18.04 AMI, on an Amazon AWS ECS t2.micro instance.

log of commands issued on the server to create a working minetest server: 

```
$ sudo add-apt-repository ppa:minetestdevs/stable
$ sudo apt-get update
$ sudo apt-get install minetest

$ sudo adduser minetestrunner
$ sudo su minetestrunner -
$ /usr/bin/minetest --server --worldname xscale --config ~/.minetest/worlds/xscale/world.mt
```

my world file:

```
creative_mode = true
auth_backend = sqlite3
player_backend = sqlite3
gameid = minetest
enable_damage = false
backend = sqlite3
```

Service unit file (`/etc/systemd/system/minetestrunner.service`):

```
[Unit]
Description=Runs the minetest server
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=5
User=minetestrunner
Group=minetestrunner
ExecStart=/usr/bin/minetest --server --worldname xscale --config /home/minetestrunner/.minetest/worlds/xscale/world.mt

[Install]
WantedBy=multi-user.target
```

Useful service commands:

```
sudo systemctl status minetestrunner
sudo systemctl [start|stop] minetestrunner
sudo systemctl enable minetestrunner
sudo systemctl disable minetestrunner
```


## Install the game

I find it easiest to hookup the game using git.
The directroy where Minetest keeps its games is `/usr/share/minetest/games`

```
sudo ./scripts/install_gwt.sh
```

To update the server with the latest version of the Game Withou Thrones game. 

```
sudo ./scripts/update_gwt.sh 
```

