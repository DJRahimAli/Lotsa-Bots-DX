/// @desc Chance(percent, range)
/// @arg percent
/// @arg range

// Returns true or false depending on RNG
// ex: 
//      Chance(0.7,1);    -> Returns true 70% of the time

function Chance(percent, range)
{
	return percent > random(range);
}
