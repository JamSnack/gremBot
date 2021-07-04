///twitch_execute_command(name,data);
var name = string(argument0);
var data = argument1;

//Check for a user gremlin!
//Check for an existing gremlin and if no enemies exist (aka a wave)
if instance_exists(obj_viewerGremlin)
{
    for(i=0;i<instance_number(obj_viewerGremlin);i++)
    {
        var _grem = instance_find(obj_viewerGremlin,i)
        
        if _grem.name == name 
        {
            //Data comes in with 2 extra characters at the end of the string. Here, we trim them off for use with the view gremlins.
            var new_data = string_copy(data,0,string_length(data)-2);
            
            //Make them speak!
            _grem.alarm[1] = min(string_length(new_data)*8,8*13); //Each character is worth 8 frames  of alarm time
            _grem.alarm[2] = _grem.despawn_time;
            _grem.text = new_data;
            //show_debug_message("Data: "+data+" | "+string(string_length(data)));
            //show_debug_message("New Data: "+new_data+" | "+string(string_length(new_data)));
            break; //Break out of the for loop
        }
        else if _grem.name != name && i == instance_number(obj_viewerGremlin)-1
        {
            //If this is the end of the loop and no identical gremlins were found, make one.
            var new_grem = instance_create(irandom(room_width),0,obj_viewerGremlin);
            new_grem.name = name;
        }
    }
}
else if !instance_exists(ENEMY)
{
    //Spawn a gremlin!
    var new_grem = instance_create(irandom(room_width),room_height/2,obj_viewerGremlin);
    new_grem.name = name;
}


//Cmds commands
if string_pos("!cmds",data)
{
    twitch_chat_say("!cmds, !discord, !reskin, !stats"+" @"+name);
}
else if string_pos("!discord",data)
{
    twitch_chat_say("Discord Link: https://discord.gg/NQCWq64,"+" @"+name);
}
else if string_pos("!reskin",data)
{
    if instance_exists(obj_viewerGremlin)
    {
        for(i=0;i<instance_number(obj_viewerGremlin);i++)
        {
            var _grem = instance_find(obj_viewerGremlin,i)
            
            if _grem.name == name 
            {
                _grem.sprite_index = choose(spr_gremlin,spr_grassGremlin,spr_dirtGremlin);
            }
        }
    }
}
else if string_pos("!stats",data)
{
    //Check for gremlin
    if instance_exists(obj_viewerGremlin)
    {
        for(i=0;i<instance_number(obj_viewerGremlin);i++)
        {
            var _grem = instance_find(obj_viewerGremlin,i)
            
            if _grem.name == name
            {
                //Construct the stats message
                var _lv = _grem.level;
                var str_lv = string(_lv);
                var str_xp = string(_grem.xp);
                var str = "@"+string(name)+" Level: "+str_lv+"; XP: "+str_xp+"/"+string(_lv*(10+_lv));
                
                //Send the stats message
                twitch_chat_say(str);
            }
        }
    }
}
else if string_pos("!wave",data)
{
    if name == "jamsnack_"
    {
        //Check for gremlin
        if instance_exists(obj_viewerGremlin)
        {
            repeat(10)
            {
                instance_create(0,0,obj_enemy1);
            }
        }
    }
}
