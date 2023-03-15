/// @func approach(start, target, change);
/// @param {real} start
/// @param {real} target
/// @param {real} change
function approach(argument0, argument1, argument2) {
		  return (argument0 < argument1)
			? min(argument0 + argument2, argument1)
			: max(argument0 - argument2, argument1);
}
