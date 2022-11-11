if ( hover )
{
	yDraw = approach( yDraw, y + yOffsetCurrent, accel );
}
else
{
	yDraw = approach( yDraw, y, decel );
}

lineX += lineSpeed;

lineX = lineX mod lineWidth;
