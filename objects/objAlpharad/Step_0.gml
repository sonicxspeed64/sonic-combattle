/// Actions

if yspeed = 0 and !place_meeting(x,y+1,objSolid)
{
	if action = "stand" or action = "run"
	{
	action = "jump"
	image_index = frStartfall
	}
	else if action = "jump" or action = "hop"
	{
		yspeed += 0.5
	}
}
else if !place_meeting(x,y+yspeed,objSolid)
{
	yspeed += 0.5
	
	if action = "jump"
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