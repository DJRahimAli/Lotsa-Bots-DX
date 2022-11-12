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
