if (audio_is_playing(sound)) audio_stop_sound(sound);
audio_play_sound( sound, 4, false, 1, 0, pitch );
layer_background_index(oTitle.bgID, button);
oTitle.pose = button;
hover = true;
