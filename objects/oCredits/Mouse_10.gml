
/// @description Insert description here
// You can write your code in this editor
if (audio_is_playing(hoverSound)) audio_stop_sound(hoverSound);
audio_play_sound( hoverSound, 4, false, 1, 0, hoverPitch );
layer_background_index(oTitle.bgID, button);
oTitle.pose = button;
hover = true;

//Change option string value if mouse hovers over object
oOptionText.Optiontext = 4;