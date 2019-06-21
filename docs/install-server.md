# Server installation

## Installation notes

I started from a Ubuntu 18.04 AMI, on an Amazon AWS ECS t2.micro instance.

### Install Minetest

```
sudo ./scripts/install_minetest.sh
```

Now add the user `minetestrunner`, and check that `minetestrunner` 
can run the minetest server:

```
$ sudo adduser minetestrunner
$ sudo su minetestrunner -
$ /usr/bin/minetest --server
```

It should display something similar to:

```
Jun 21 11:03:36 ip-172-31-33-97 minetest[16527]: 2019-06-21 11:03:36: ACTION[Main]: New font registered in font_api: tinycurs.
Jun 21 11:03:36 ip-172-31-33-97 minetest[16527]: 2019-06-21 11:03:36: ACTION[Main]: New font registered in font_api: metro.
Jun 21 11:03:37 ip-172-31-33-97 minetest[16527]:         .__               __                   __
Jun 21 11:03:37 ip-172-31-33-97 minetest[16527]:   _____ |__| ____   _____/  |_  ____   _______/  |_
Jun 21 11:03:37 ip-172-31-33-97 minetest[16527]:  /     \|  |/    \_/ __ \   __\/ __ \ /  ___/\   __\
Jun 21 11:03:37 ip-172-31-33-97 minetest[16527]: |  Y Y  \  |   |  \  ___/|  | \  ___/ \___ \  |  |
Jun 21 11:03:37 ip-172-31-33-97 minetest[16527]: |__|_|  /__|___|  /\___  >__|  \___  >____  > |__|
Jun 21 11:03:37 ip-172-31-33-97 minetest[16527]:       \/        \/     \/          \/     \/
Jun 21 11:03:37 ip-172-31-33-97 minetest[16527]: 2019-06-21 11:03:37: ACTION[Main]: World at [/home/minetestrunner/.minetest/worlds/xscale]
Jun 21 11:03:37 ip-172-31-33-97 minetest[16527]: 2019-06-21 11:03:37: ACTION[Main]: Server for gameid="virtual_game_without_thrones" listening on 0.0.0.0:30000.
```

Exit the server by hitting `ctrl-c`.
And type `exit` to log out the `minetestrunner` user.

### Install the game

I find it easiest to hookup the game using git.
The directory where Minetest keeps its games is `/usr/share/minetest/games`

```
sudo ./scripts/install_gwt.sh
```

To update the server with the latest version of the Game Without Thrones game. 

```
sudo ./scripts/update_gwt.sh 
```

Place the following world file into an empty `xscale` folder under 
`/home/minetestrunner/.minetest/worlds`,
named after the world you want to host.
When Minetest starts for the first time, 
it will initiate the player and world databases and add any additional files it needs.

### Run Minetest as a service

Copy the [Service unit file] to `/etc/systemd/system/minetestrunner.service`):

Now you can control the minetestrunner service using these service commands:

```
sudo systemctl status minetestrunner
sudo systemctl [start|stop] minetestrunner
sudo systemctl enable minetestrunner
sudo systemctl disable minetestrunner
```

After enabling the service, it will automatically start on system startup.


 [world.mt]: ../config/world.mt
 [Service unit file]: ../config/minetestrunner.service
