///scr_tip(text);
//Spawns a tip!
var str = argument0;
var i = instance_create(0,0,efct_uiTip);

if str != ""
{
    i.tip = str;
}
