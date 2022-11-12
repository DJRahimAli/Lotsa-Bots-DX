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
