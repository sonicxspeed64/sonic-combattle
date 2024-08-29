/// Sonic-specific

event_inherited()

if action = "hop"
{
	if hoptime < 12
	{
		image_index = hoptime / 2
		if abs(xspeed) < speHop
		xspeed += sign(xspeed)
		yspeed = 0
		y -= abs(xspeed)/4
	}
	else if hoptime < 24
	{
		xspeed -= sign(xspeed) * 0.5
		image_index = (24 - hoptime) / 2
	}
	else
	{
		action = "run"
		xspeed = image_xscale * speRun
		exit;
	}
	
	hoptime ++
}
else if action = "wall"
{
	if spinrev < 0
	spinrev ++
	else
	{
		image_xscale *= -1
		action = "walljump"
		xspeed = speRun * image_xscale
		yspeed = -speJump
	}
}