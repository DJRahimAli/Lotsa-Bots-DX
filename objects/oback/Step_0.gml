if ( touch_id == -1 )
{
	for (var i = 0; i < 10; i += 1)
	{
		if (device_mouse_check_button(i, mb_any))
		{
			if (position_meeting(device_mouse_x_to_gui(i), device_mouse_y_to_gui(i), id))
			{
				touch_id = i;
			}
		}
	}
}
else
{
	if (!device_mouse_check_button(touch_id, mb_any))
	{
		if (position_meeting(device_mouse_x_to_gui(touch_id), device_mouse_y_to_gui(touch_id), id))
		{
			oPauseManager.pause = false;
			oPauseManager.pauseCurrent = true;
		}
		touch_id = -1;
	}
}
