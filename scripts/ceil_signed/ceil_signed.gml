/// @func ceil_signed()
/// @param {real} value
/// Rounds the value rounded away from 0
function ceil_signed(argument0) {
	return ceil(abs(argument0))*sign(argument0);
}
