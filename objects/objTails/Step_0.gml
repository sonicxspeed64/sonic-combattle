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
	
}