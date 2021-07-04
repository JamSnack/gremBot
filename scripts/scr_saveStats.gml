///scr_saveStats(username);
///SAVE GAME
var username = argument0;

//-----Save stats-----
var _map = ds_map_create();

//- Package stats
ds_map_add(_map,"level",level);
ds_map_add(_map,"xp",xp);


//Game maker prefers to start with a ds_map.
//Wrap the root List up in a map!

//Save to a string
var str = json_encode(_map);
scr_saveString(string(username)+".sav",str);

//"Nuke the data." ~Shuan Spalding
ds_map_destroy(_map);
