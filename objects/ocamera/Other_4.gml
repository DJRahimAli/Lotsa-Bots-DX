if (instance_exists(target))
{
	targetX = target.x - round(CAM_RES_W / 2);
	targetY = target.y - round(CAM_RES_H / 2);
	
	x = targetX;
	y = targetY;
	
	camera_set_view_pos(camera, targetX, targetY);
}
