if ( touch_id == -1 )
{
	for (var i = 0; i < 10; i += 1)
	{
		if (device_mouse_check_button(i, mb_any))
		{
			if (position_meeting(device_mouse_x(i), device_mouse_y(i), id))
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
		if (position_meeting(device_mouse_x(touch_id), device_mouse_y(touch_id), id))
		{
			if (os_browser == browser_not_a_browser)
			{
				window_set_fullscreen(!window_get_fullscreen());
				
				// Resize window & application surface
				window_set_size(RES_W, RES_H);
				surface_resize(application_surface, RES_W, RES_H);
				
				display_set_gui_size(RES_W, RES_H);
			}
			else with (obj_HTML_FS) HTML_FS_canvas_fullscreen();
		}
		touch_id = -1;
	}
}
