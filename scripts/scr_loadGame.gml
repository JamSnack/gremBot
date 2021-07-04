///scr_loadGame();

//Load the game
if (file_exists("blockFarmer2.sav"))
{
    var _wrapper = scr_loadJson("blockFarmer2.sav");
    var _list = _wrapper[? "STATS"];
    
    //-unpackage levels
    click_strength = _list[? "click_strength"];
    block_formation_level = _list[? "block_formation_level"];
    block_level = _list[? "block_level"];
    auto_click_level = _list[? "auto_click_level"];
    points = _list[? "points"];
    prestige_points = _list[? "prestige_points"];
    
    //- unpackage prestige levels
    prestige_block_level = _list[? "prestige_block_level"];
    prestige_rank = _list[? "prestige_rank"];
    combo_level = _list[? "combo_level"];
    platform_level = _list[? "platform_level"];
    respawn_level = _list[? "respawn_level"];
    
    //- unpacked blue prestige levels
    base_block_level = _list[? "base_block_level"];
    base_block_formation_level = _list[? "base_block_formation_level"];
    combo_power = _list[? "combo_power"];
    
    //- unpacked uber prestige
    uber_rank = _list[? "uber_rank"];
    uber_prestige_points = _list[? "uber_prestige_points"];
    
    ds_map_destroy(_wrapper);
    
    //--------UPDATE COST---------------
    prestige_block_level_cost = max(1,power(5,prestige_block_level));
    combo_level_cost = max(10,power(10,combo_level));
    platform_level_cost = max(25,power(8,platform_level));
    block_formation_level_cost = max(25*block_formation_level,power(block_formation_level*100,floor((block_formation_level-1)/2)));
    block_level_cost = max(10*block_level,power(block_level*25,floor((block_level-1)/3)));
    click_strength_cost = max(click_strength*10,(click_strength*(10*floor(click_strength/2))));
    auto_click_level_cost = max(50,75*auto_click_level,power(auto_click_level*100,floor(auto_click_level/3)));
    respawn_level_cost = max(125,250*respawn_level,power(26,respawn_level));
    base_block_level_cost = max(1500,5000*base_block_level,power(250,base_block_level))
    base_block_formation_level_cost = max(2500,6500*base_block_formation_level,power(base_block_formation_level*100,floor((base_block_formation_level-1)/2)));
    combo_power_cost = max(power(10,9),power(2500,combo_power));
}
