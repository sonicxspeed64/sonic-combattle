/// Mapping

if place_meeting(x+xspeed,y,objSolid)
{
	for (k = abs(xspeed); k > 0; k -= 0.25)
	{
		if !place_meeting(x+sign(xspeed)*k,y,objSolid)
		{
			x += sign(xspeed) * k
			break;
		}
	}
	
	xspeed = 0
}
else
x += xspeed


if place_meeting(x,y+yspeed,objSolid)
{
	for (k = abs(yspeed); k > 0; k -= 0.5)
	{
		if !place_meeting(x,y+sign(yspeed)*k,objSolid)
		{
			y += sign(yspeed) * k
			break;
		}
	}
	
	yspeed = 0
	
	if sprite_index = sprJump
	{
		if xspeed = 0
		sprite_index = sprStand
		else
		sprite_index = sprRun
	}
}
else
y += yspeed

tapDir -= sign(tapDir)

if sprite_index = sprHop
show_debug_message(y)