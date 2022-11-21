if ( room != rTitle )
{
	// Get current camera position
	x = camera_get_view_x(camera);
	y = camera_get_view_y(camera);
	var camW = camera_get_view_width(camera);
	var camH = camera_get_view_height(camera);
	
	
	// Set target camera position
	if ( instance_exists( target ) )
	{
		targetX = target.x - round(camW / 2);
		targetY = target.y - round(camH / 2);
	}
	
	
	// Set camera position
	if ( CAM_SMOOTH = -1 )
	{
		x = targetX;
		y = targetY;
	}
	else
	{
		// Smoothly move the camera to the target position
		x = lerp(x, targetX, CAM_SMOOTH);
		y = lerp(y, targetY, CAM_SMOOTH);
	}
	
	
	// Clamp the camera position to room bounds
	x = clamp(x, 0, room_width - camW);
	y = clamp(y, 0, room_height - camH);
	
	
	round_position();
	
	
	// Apply camera position
	camera_set_view_pos(camera, x, y);
	camera_set_view_size(camera, camW, camH);
}


if ( room != rTitle )
{
	if ( global.mobileControls && (instance_exists( oAnalogueLeft ) || instance_exists( oAnalogueRight )) )
	{
		oAnalogueLeft.x += oCamera.x;
		oAnalogueLeft.y += oCamera.y;
		
		oAnalogueRight.x += oCamera.x;
		oAnalogueRight.y += oCamera.y;
	}
	
	if ( instance_exists( oPause ) )
	{
		oPause.x += oCamera.x;
		oPause.y += oCamera.y;
	}
}
