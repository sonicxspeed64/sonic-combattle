/// Sonic-specific

event_inherited()

if (action = "jump" or action = "spinjump"
	or action = "hop")
	and yspeed >= 0
{
	if keyboard_check_pressed(ord("Z"))
	{
		var dircheck = keyboard_check(vk_right) - keyboard_check(vk_left)
		// wall jump
		if (dircheck = 0 and place_meeting(x+image_xscale*10,y,objSolid))
			or (dircheck != 0 and place_meeting(x+dircheck*10,y,objSolid))
		{
			action = "wall"
			if dircheck != 0
			image_xscale = dircheck
			while !place_meeting(x+image_xscale,y,objSolid)
			x += image_xscale
			xspeed = 0
			yspeed = 0
			spinrev = -3
		}
		else if 5 = 4 // homing attack
		{
			
		}
		else // jump dash
		{
			
		}
	}
}