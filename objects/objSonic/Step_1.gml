/// Gameplay

if keyboard_check(vk_right) = keyboard_check(vk_left)
{
	if sprite_index = sprRun or sprite_index = sprJump
	{
		if abs(xspeed) < 1
		{
			xspeed = 0
			if sprite_index = sprRun
			sprite_index = sprStand
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
		and (sprite_index = sprStand or sprite_index = sprRun)
	{
		image_xscale = keyboard_check(vk_right) - keyboard_check(vk_left)
		xspeed = image_xscale
		sprite_index = sprHop
		image_index = 0
		yspeed = -5
	}
	else
	// basic motion
	{
		if xspeed = 0
		{
			image_xscale = keyboard_check(vk_right) - keyboard_check(vk_left)
			xspeed = image_xscale * 4
			
			if sprite_index = sprStand
			sprite_index = sprRun
			
			if keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_left)
			tapDir = 15 * image_xscale
		}
		else
		{
			if sprite_index = sprRun
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
			else if sprite_index = sprJump
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

if keyboard_check_pressed(ord("Z"))
{
	if sprite_index = sprStand or sprite_index = sprRun
	{
		sprite_index = sprJump
		image_index = 0
		yspeed = -speJump
	}
	
}