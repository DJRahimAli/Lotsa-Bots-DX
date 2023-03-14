if ( hover )
{
	yOffsetCurrent = approach( yOffsetCurrent, yOffset, accel );
}
else
{
	yOffsetCurrent = approach( yOffsetCurrent, 0, decel );
}

lineX += lineSpeed;

lineX = lineX mod lineWidth;


//Shake
xDraw = x;
//yDraw = y;

xDraw += random_range(-shake,shake);
//yDraw += random_range(-shake,shake);
shake = max(0,shake-((1/shakeLength)*shakeMagnitude));

if (oTitle.image_alpha == 0) && (oButton.clicked && oButton.buttonCurrent == 0)
{
	audio_stop_all();
	room_goto(rTest);
}
if (oTitle.image_alpha == 0) && (oButton.clicked && oButton.buttonCurrent != 0)
{
	audio_stop_all();
	room_goto(rTitle);
}