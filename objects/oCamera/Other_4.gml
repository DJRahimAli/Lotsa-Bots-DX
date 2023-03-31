if (instance_exists(target))
{
	targetX = target.x - round(camResH / 2);
	targetY = target.y - round(camResW / 2);
	
	x = targetX;
	y = targetY;
	
	camera_set_view_pos(camera, targetX, targetY);
}
