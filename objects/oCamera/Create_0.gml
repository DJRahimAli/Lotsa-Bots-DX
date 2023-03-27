// Resolution
#macro RES_W 960
#macro RES_H 540

#macro CAM_RES_W 960
#macro CAM_RES_H 540

#macro CAM_SMOOTH 0.12

targetX = 0;
targetY = 0;

targetOffsetX = 0;
targetOffsetY = 0;


camLengthSmoothMin = 0.1;
camLengthSmoothMax = 0.4;


camLengthX = 0;

camLengthXPrimary = 50;

camLengthXSecondary = 100;

camLengthXCurrent = 0;


camLengthY = 0;

camLengthYPrimary = 50;

camLengthYSecondary = 100;

camLengthYCurrent = 0;

// Enable views
view_enabled = true;
view_visible[0] = true;

// Set target object
target = oPlayer;

x = 0;
y = 0;

// Create camera
camera = camera_create_view(x, y, CAM_RES_W, CAM_RES_H);

view_set_camera(0, camera);


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
