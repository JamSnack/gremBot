///scr_loadStats(username);
var username = argument0;
var str_name = string(username);

//Check for the existence of a file, if false, create one.
var filename = str_name+".sav";

if file_exists(filename)
{
    var _list = scr_loadJson(filename);
    
    level = _list[? "level"];
    xp = _list[? "xp"];
    
    ds_map_destroy(_list);
}
else
{
    scr_saveStats(username);
}
