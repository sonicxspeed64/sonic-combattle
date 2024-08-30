/// Tails-specific

event_inherited()

if action = "hop"
{
	if spinrev < 15
	{
		yspeed = -3
		if image_xscale * xspeed < speHop
		xspeed += image_xscale
	}
	else
	{
		if abs(xspeed) > speRun
		{
		xspeed -= image_xscale * 0.5
		if abs(xspeed) <= speRun
		image_index = 0
		}
		else
		{
			action = "jump"
			image_index = 4
			spinrev = -1
		}
	}
	
	if image_index = 5
	image_index = 0
	spinrev ++
}
else if action = "fly"
{
	if !keyboard_check_pressed(ord("X")) //has boost
	{
		if keyboard_check(vk_down)
		{
			if yspeed < 5
			yspeed ++
			else
			yspeed = 5
		}
		else
		{
			yspeed += 0.125
			
			if keyboard_check_pressed(ord("Z"))
			yspeed -= 2
			if yspeed > 2
			yspeed = 2
			else if yspeed < -4
			yspeed = -4
		}
		
		if image_index = image_number - 1
		image_index = 1
	}
	else
	{
		action = "spinjump"
	}
	
	if place_meeting(x,y+1,objSolid)
	{
		action = "run"
	}
}