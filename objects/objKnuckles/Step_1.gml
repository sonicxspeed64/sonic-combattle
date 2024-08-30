/// Knuckles-specific

event_inherited()

if (action = "jump" or action = "spinjump")
	and yspeed >= 0
{
	if keyboard_check_pressed(ord("Z"))
	{
		// glide
		var dircheck = keyboard_check(vk_right) - keyboard_check(vk_left)
		if dircheck != 0
		image_xscale = dircheck
		
		action = "glide"
		image_index = 0
		xspeed *= 0.5
	}
}
else if action = "wall"
{
	if keyboard_check(vk_down) = keyboard_check(vk_up)
	image_index = 0
	else
	{
		var climb = keyboard_check(vk_down) - keyboard_check(vk_up);
		if image_index = 0
		image_index = 1
		
		image_index -= climb * 0.125
		y += climb
		
		if image_index = image_number - 1
		image_index = 1
		if image_index < 1
		image_index = 7
		
		if place_meeting(x,y+1,objSolid)
		{
			action = "squat"
			image_index = 0
		}
		else if place_meeting(x,y-4,objSolid)
		while place_meeting(x,y-4,objSolid) y ++
	}
	
	if keyboard_check_pressed(ord("Z"))
	{
		action = "spinjump"
		image_xscale *= -1
		xspeed = speRun * image_xscale
		yspeed = -speHop
		image_speed = 1
	}
	else if !place_meeting(x+image_xscale,y-10,objSolid)
	{
		action = "spinjump"
		x -= 20 * image_xscale
		xspeed = 3 * image_xscale
		yspeed = -speHop
		image_speed = 1
	}
}