// Resolution
#macro RES_W 960
#macro RES_H 540

#macro CAM_RES_W 960
#macro CAM_RES_H 540
#macro CAM_SMOOTH -1

// Enable views
view_enabled = true;
view_visible[0] = true;

// Create camera
camera = camera_create_view(0, 0, CAM_RES_W, CAM_RES_H);

view_set_camera(0, camera);

// Set target object
target = oPlayer;

targetX = 0;
targetY = 0;

if ( instance_exists( target ) )
{
	targetX = target.x;
	targetY = target.y;
	
	//Set camera position to the target position
	camera_set_view_pos(camera, targetX, targetY);
}


// Resize window & application surface
window_set_size(RES_W, RES_H);
surface_resize(application_surface, RES_W, RES_H);

display_set_gui_size(RES_W, RES_H);

/* Center window
var display_width = display_get_width();
var display_height = display_get_height();

var window_width = RES_W;
var window_height = RES_H;

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);*/
