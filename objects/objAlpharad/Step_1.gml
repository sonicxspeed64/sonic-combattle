/// Gameplay

if keyboard_check(vk_right) = keyboard_check(vk_left)
{
	if action = "run" or action = "jump"
	{
		if abs(xspeed) < 1
		{
			xspeed = 0
			if action = "run"
			action = "stand"
		}
		else
		{
			xspeed -= image_xscale * 0.25
		}
	}
}
else
{
	// hip hop
	if sign(tapDir) = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left) and tapDir != 0
		and (action = "stand" or action = "run")
	{
		image_xscale = keyboard_check(vk_right) - keyboard_check(vk_left)
		xspeed = image_xscale
		action = "hop"
		image_index = 0
		hoptime = 0
	}
	else
	// basic motion
	{
		if xspeed = 0
		{
			image_xscale = keyboard_check(vk_right) - keyboard_check(vk_left)
			xspeed = image_xscale
			
			if action = "stand"
			action = "run"
			
			if keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_left)
			tapDir = 15 * image_xscale
		}
		else
		{
			if action = "run"
			{
				image_xscale = keyboard_check(vk_right) - keyboard_check(vk_left)
				if xspeed * image_xscale < speRun
				{
				xspeed += image_xscale
				if xspeed * image_xscale > speRun
				xspeed = image_xscale * speRun
				}
			
			if keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_left)
			tapDir = 15 * image_xscale
			}
			else if action = "jump"
			{
				var goin = keyboard_check(vk_right) - keyboard_check(vk_left)
				if xspeed * goin < speRun
				{
					xspeed += goin * 0.5
					if xspeed * goin > speRun
					xspeed = goin * speRun
				}
			}
		}
	}
}

if keyboard_check(vk_down)
{
	if action = "stand" or action = "run"
	{
		action = "squat"
		image_index = 0
		image_speed = 0
	}
	else if action = "squat"
	{
		if image_index < 2
		{
		image_index += 0.25
		xspeed -= sign(xspeed) * 0.25
		}
		else
		{
			xspeed = 0
		}
	}
}
else
{
	if action = "squat"
	{
		if image_index > 0
		image_index -= 0.25
		else
		{
			action = "stand"
			image_speed = 1
		}
	xspeed = 0
	}
}

if keyboard_check_pressed(ord("Z"))
{
	if action = "stand" or action = "run"
	{
		action = "jump"
		image_index = 0
		yspeed = -speJump
	}
	
}