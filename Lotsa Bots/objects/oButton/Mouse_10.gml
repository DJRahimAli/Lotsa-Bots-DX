if (audio_is_playing(hoverSound)) audio_stop_sound(hoverSound);
audio_play_sound( hoverSound, 4, false, 1, 0, hoverPitch );
layer_background_index(oTitle.bgID, button);
oTitle.pose = button;
hover = true;
