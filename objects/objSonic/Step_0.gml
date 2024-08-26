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
			sprite_index = sprSonic
			xspeed = 0
			image_speed = 1
		}
	}
}