///scr_popMessage(string,font,duration,popColor,x,y);

var popFont = argument1;
var time = argument2;

var i = instance_create(argument4,argument5,efct_popMessage);
i.popFont = popFont;
i.popString = argument0;
i.time = time;
i.alarm[0] = time*room_speed; //Time displayed in seconds.
i.popColor = argument3;
i.direction = irandom_range(80,100);
i.speed = 4;
i.friction = random_range(0.2,0.7);

