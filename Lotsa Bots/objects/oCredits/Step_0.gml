if ( yOffsetCurrent != 0 )
{
	yDraw = approach( yDraw, y + yOffsetCurrent, accel );
}
else
{
	yDraw = approach( yDraw, y + 0, decel );
}

lineX += lineSpeed;

lineX = lineX mod lineWidth;
