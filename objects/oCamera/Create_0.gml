// Resolution
#macro RES_W 960
#macro RES_H 540

#macro CAM_RES_W 960
#macro CAM_RES_H 540

#macro CAM_SMOOTH 0.12

camLengthSmooth = 0;


camLengthXMin = 0;
camLengthXMax = 0;

camLengthXPrimaryMin = 0;
camLengthXPrimaryMax = 50;

camLengthXSecondaryMin = 0;
camLengthXSecondaryMax = 100;


camLengthXCurrent = 0;


camLengthYMin = 0;
camLengthYMax = 0;

camLengthYPrimaryMin = 0;
camLengthYPrimaryMax = 50;

camLengthYSecondaryMin = 0;
camLengthYSecondaryMax = 100;


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
