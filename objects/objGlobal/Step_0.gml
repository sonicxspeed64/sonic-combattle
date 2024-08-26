/// DEBUGGING

if global.debug
{
	if keyboard_check(vk_numpad2)
	game_set_speed(15, gamespeed_fps);
	else if keyboard_check(vk_shift)
	game_set_speed(300, gamespeed_fps);
	else
	game_set_speed(60, gamespeed_fps);

	if keyboard_check(vk_control)
	{
		if keyboard_check(ord("R"))
		room_restart()
	}
}