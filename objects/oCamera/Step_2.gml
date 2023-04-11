if ( room != rTitle )
{
	// Get current camera position
	x = camera_get_view_x(camera);
	y = camera_get_view_y(camera);
	var camW = camera_get_view_width(camera);
	var camH = camera_get_view_height(camera);
	
	// Set camera position
	if ( camSmoothCurrent = -1 )
	{
		// Set target camera position
		if (instance_exists(target))
		{
			targetX = (target.x - round(camW / 2));
			targetY = (target.y - round(camH / 2));
		}
	}
	else
	{
		// Set target camera position
		if (instance_exists(target))
		{
			targetX += (target.x - round(camW / 2) - targetX) * camSmoothCurrent;
			targetY += (target.y - round(camH / 2) - targetY) * camSmoothCurrent;
		}
	}
	
	if (instance_exists(target))
	{
		targetOffsetX = lengthdir_x(camLengthXCurrent,target.direction);
		targetOffsetY = lengthdir_y(camLengthYCurrent,target.direction);
	}
	
	x = round(targetX + targetOffsetX);
	y = round(targetY + targetOffsetY);
	
	// Clamp the camera position to room bounds
	x = clamp(x, 0, room_width - camW);
	y = clamp(y, 0, room_height - camH);
	
	
	// Apply camera position
	camera_set_view_pos(camera, x, y);
	//camera_set_view_size(camera, camW, camH);
}
