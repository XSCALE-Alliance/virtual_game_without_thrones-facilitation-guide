# Tips

## Start the Game

Open the Zoom call with a shared screen of your Minetest game.
Log in to the game as Tyrion, the King's Hand.

Guide the players along the playing field using [Tyrion's speech](game-start-script.md).

## Protect building areas from accidental griefing

The game includes the [Areas mod] to protect areas.

Quick guide:


 * `/area_pos set` and punch the two corner nodes to set them.
 * `/area_pos [set1|set2]` and punch only the first or second corner node to set them one at a time.
 * `/set_owner` <OwnerName> <AreaName>


## Privileges

Players start with all the privileges required.
Use the chapter meetings to inject learning into the ecosystem.
Examples:

 * teach architects and maesters about worldedit
 * teach merchants about fast, fly and teleport
 * ... 

Quick guide:

```
/grant marijn fly
/revoke marijn worldedit
/privs
/privs marijn
/help privs
```

For an overview of privileges in Minetest, see the wiki page on [privileges].

Tip:  do not use `grant some_player all`, 
that allows players to do things you do not expect, 
such as `protection_bypass` and `server`.


## Control day and night (time)

Use the [`time`][time] to manipulate the time of day.
This requires the `settime` privilege, 
make sure that you have this privilege when you're facilitating a game.

Quick guide:

 * `/time 7:00` set the time to 7 o'clock in the morning
 * `/time 19:00`  set the time to 7 o'clock in the evening - in the default game, this is the time of sun-down

---

 [Areas mod]: (https://github.com/XSCALE-Alliance/virtual_game_without_thrones/tree/master/mods/areas)
 [time]: https://wiki.minetest.net/Time_of_day
 [privileges]: https://wiki.minetest.net/Privileges