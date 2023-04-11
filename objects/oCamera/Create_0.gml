targetX = 0;
targetY = 0;

targetOffsetX = 0;
targetOffsetY = 0;


camSmooth = 0.12;
camSmoothCurrent = camSmooth;

camLengthSmoothMin = 0.1;
camLengthSmoothMax = 0.2;


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

if (instance_exists(target))
{
	targetX = (target.x - round(camResW / 2));
	targetY = (target.y - round(camResH / 2)) - 100;
}

x = round(targetX);
y = round(targetY);

// Clamp the camera position to room bounds
x = clamp(x, 0, room_width - camResW);
y = clamp(y, 0, room_height - camResH);

// Create camera
camera = camera_create_view(x, y, camResW, camResH);

view_set_camera(0, camera);


// Resize window & application surface
window_set_size(resW, resH);
surface_resize(application_surface, resW, resH);

display_set_gui_size(resW, resH);

// Center window
var display_width = display_get_width();
var display_height = display_get_height();

var window_width = resW;
var window_height = resH;

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);
