/// Mapping

if place_meeting(x+xspeed,y,objSolid)
{
	for (k = abs(xspeed); k > 0; k -= 0.25)
	{
		if !place_meeting(x+sign(xspeed)*k,y,objSolid)
		{
			x += sign(xspeed) * k
			break
		}
	}
	
	xspeed = 0
}
else
x += xspeed



y += yspeed

tapDir -= sign(tapDir)