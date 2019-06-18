# Server installation

To update the server with the latest version of the gwot game. From ubuntu admin's home folder run:

```
sudo ./update_gwot.sh 
```

### Installation notes:

I started from a Ubuntu 18.04 AMI, on a t2.micro instance.

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

Hookup the game using git:

```
sudo git clone https://github.com/XSCALE-Alliance/virtual_game_without_thrones.git --recurse-submodules
```

```
/usr/share/minetest/games$ sudo git clone https://github.com/XSCALE-Alliance/virtual_game_without_thrones.git --recurse-submodules
```
