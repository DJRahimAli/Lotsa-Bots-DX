/// @description sin_oscillate(min,max,duration,?position)
/// @function sin_oscillate
/// @param min
/// @param max
/// @param duration [in seconds]
/// @param ?position
function sin_oscillate(){
  var position = argument_count>3 ? argument[3] : get_timer() / 1000000;
  return((argument[1]-argument[0])/2 * sin(position*2*pi/argument[2]) + (argument[1]+argument[0])/2);
}
