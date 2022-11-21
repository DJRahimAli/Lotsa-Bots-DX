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
	if (device_mouse_check_button(touch_id, mb_any))
	{
		oPlayer.keyPrimary = true;
		
		joy_x = device_mouse_x(touch_id) - x;
		joy_y = device_mouse_y(touch_id) - y;
	
		_direction = point_direction(0, 0, joy_x, joy_y);
		_distance = point_distance(0, 0, joy_x, joy_y);
	
		if (_distance > radius)
		{
			joy_x = lengthdir_x(radius, _direction);
			joy_y = lengthdir_y(radius, _direction);
		}
		
		joy_x = round(joy_x);
		joy_y = round(joy_y);
	}
	
	if (!device_mouse_check_button(touch_id, mb_any))
	{
		oPlayer.keyPrimary = false;
		
		touch_id = -1;
		joy_x = 0;
		joy_y = 0;
	}
}

hDir = map_value( x + joy_x, bbox_left, bbox_right, -1, 1 );

vDir = map_value( y + joy_y, bbox_top, bbox_bottom, -1, 1 );
