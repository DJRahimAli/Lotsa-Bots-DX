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


idealWidth = 0;
idealHeight = 720;

aspectRatio = display_get_width()/display_get_height();

idealWidth = round(idealHeight*aspectRatio);
//idealHeight = round(idealWidth / aspectRatio);

//Perfect Pixel Scaling
if (display_get_width() mod idealWidth != 0)
{
	var d = round(display_get_width()/idealWidth);
	idealWidth = display_get_width()/d;
}

if (display_get_height() mod idealHeight != 0)
{
	var d = round(display_get_height()/idealHeight);
	idealHeight = display_get_height()/d;
} 

//Check for odd numbers
if (idealWidth & 1) idealWidth++;
if (idealHeight & 1) idealHeight++;

// Enable views
view_enabled = true;
view_visible[0] = true;

// Set target object
target = oPlayer;

if (instance_exists(target))
{
	targetX = (target.x - round(idealWidth / 2));
	targetY = (target.y - round(idealHeight / 2)) - 100;
}

x = round(targetX);
y = round(targetY);

// Clamp the camera position to room bounds
x = clamp(x, 0, room_width - idealWidth);
y = clamp(y, 0, room_height - idealHeight);

// Create camera
camera = camera_create_view(x, y, idealWidth, idealHeight);

view_set_camera(0, camera);


// Resize window & application surface
window_set_size(idealWidth, idealHeight);
surface_resize(application_surface, idealWidth, idealHeight);

display_set_gui_size(idealWidth, idealHeight);

// Center window
var display_width = display_get_width();
var display_height = display_get_height();

var window_width = idealWidth;
var window_height = idealHeight;

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);
