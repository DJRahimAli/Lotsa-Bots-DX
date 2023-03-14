xDraw = x;
yDraw = y;

//yOffset = -5;
yOffsetCurrent = 0;

shake = 0;

shakeLength = 15;
shakeMagnitude = 12;

buttonCurrent = 0;
hover = false;
clicked = false;

//accel = 0.5;
//decel = 1;

lineX = 0;
//lineSpeed = 5;
lineWidth = sprite_get_width(sButtonLine);
lineHeight = sprite_get_height(sButtonLine);

surface = surface_create(room_width, room_height);
