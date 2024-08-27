/// Actions

if sprite_index = sprHop
{
	if image_speed = 1
	{
		if abs(xspeed) < speHop
		xspeed += sign(xspeed)
		if image_index = 6
		image_speed *= -1
	}
	else
	{
		if image_index > 0
		{
			xspeed -= sign(xspeed) * 0.5
		}
		else
		{
			sprite_index = sprRun
			image_speed = 1
			xspeed = image_xscale * speRun
		}
	}
}

if yspeed = 0 and !place_meeting(x,y+1,objSolid)
{
	if sprite_index = sprStand or sprite_index = sprRun
	{
	sprite_index = sprJump
	image_index = frStartfall
	}
	else if sprite_index = sprJump or sprite_index = sprHop
	{
		yspeed += 0.5
	}
}
else if !place_meeting(x,y+yspeed,objSolid)
{
	yspeed += 0.5
	
	if sprite_index = sprJump
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