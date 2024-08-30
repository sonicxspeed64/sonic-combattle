/// Actions

if action = "spinroll"
{
	if abs(xspeed) > 1
	xspeed -= sign(xspeed) * 0.25
	else
	{
		action = "squat"
		image_index = 2
		image_speed = 0
	}
}

if yspeed = 0 and !place_meeting(x,y+1,objSolid)
{
	if action = "stand" or action = "run"
	{
	action = "jump"
	image_index = frStartfall
	}
	else if action = "jump" or action = "hop" or action = "spinjump"
	{
		yspeed += 0.5
	}
	else if action = "walljump"
	{
		action = "jump"
		image_index = frStartfall
	}
	
}
else if !place_meeting(x,y+yspeed,objSolid)
{
	if action != "fly"
	yspeed += 0.5
	
	if action = "jump" or action = "spinjump"
	{
		if yspeed < 0
		{
			if image_index = frStartfall
			image_index = 0
			
			if !keyboard_check(ord("Z"))
			yspeed += 0.5
		}
		else
		{
			if image_index = image_number - 1
			image_index = frEndfall
		}
	}
}