/// Knuckles-specific

event_inherited()

if action = "hop"
{
	if spinrev = 0
	{
		if image_index < 8
		image_index ++
		else
		{
			spinrev = 1
			xspeed = image_xscale * speHop
		}
	}
	else if spinrev < 20
	{
		spinrev ++
	}
	else
	{
		xspeed = 0
		if image_index > 0
		image_index --
		else
		{
			action = "squat"
			spinrev = 0
			image_index = 2
			image_speed = 0
		}
	}
	
	if edging
	xspeed = 0
}
else if action = "wall"
{
	
}
else if action = "glide"
{
	if keyboard_check(ord("Z"))
	{
		if keyboard_check(vk_left) - keyboard_check(vk_right) = image_xscale
		{
			if xspeed * image_xscale > 2
			{
				xspeed -= image_xscale * 0.5
				if image_index = 4
				image_index = 2
			}
			else
			{
				if image_index = 4
				image_index = 6
				if image_index = image_number - 1
				{
					image_xscale *= -1
					xspeed = image_xscale
				}
			}
		}
		else
		{
		if image_index = 4
		image_index = 2
		if xspeed * image_xscale < speHop
		xspeed += image_xscale * 0.25
		}
	
	if yspeed > 1
	yspeed --
	if yspeed = 0
	yspeed = 0.5
	
	if place_meeting(x+image_xscale * 10,y,objSolid)
	{
		image_speed = 0
		image_index = 0
		xspeed = 0
		yspeed = 0
		action = "wall"
		
		while !place_meeting(x+image_xscale,y,objSolid)
		x += image_xscale
	}
	}
	else
	{
		if image_index = image_number - 3
		action = "jump"
	}
	
	if place_meeting(x,y+1,objSolid)
	{
		action = "run"
	}
}