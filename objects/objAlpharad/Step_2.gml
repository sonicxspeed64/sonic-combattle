/// Mapping

if place_meeting(x+xspeed,y,objSolid)
{
	for (var k = abs(xspeed); k > 0; k -= 0.25)
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
	
	if action = "jump"
	{
		if xspeed = 0
		action = "stand"
		else
		action = "run"
	}
}
else
y += yspeed

tapDir -= sign(tapDir)


///actions to sprites

if action = "stand"
sprite_index = sprStand
else if action = "run"
sprite_index = sprRun
else if action = "jump"
sprite_index = sprJump
else if action = "hop"
sprite_index = sprHop
else if action = "squat"
sprite_index = sprSquat