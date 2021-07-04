///scr_hurt(enemy to hurt, vKnockAmt, hKnockAmt, damage);
var instance = argument0;
var v_knockAmt = argument1;
var h_knockAmt = argument2;
var dmg = argument3;

if instance_exists(instance)
{
    //---Damage calculation and death-----
    instance.hp -= dmg;
    scr_popMessage(string(dmg),global.fnt_Ui,2,c_red,x,y);
    
    //death
    if instance.hp <= 0 then with instance { instance_destroy(); }
    
    //----Knockback calculation------------
    vspd += v_knockAmt;
    hspd += h_knockAmt;
    
    vspd = -abs(vspd);
    
    if y+vspd >= ground_point
    {
        vspd = 0;
    }
}
