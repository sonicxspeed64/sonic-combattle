/// Tails-specific

event_inherited()

prevx = x
prevy = y

if (action = "jump" or action = "spinjump")
	and yspeed >= 0
{
	if keyboard_check_pressed(ord("Z"))
	{
		// fly
		var dircheck = keyboard_check(vk_right) - keyboard_check(vk_left)
		if dircheck != 0
		image_xscale = dircheck
		
		action = "fly"
	}
}