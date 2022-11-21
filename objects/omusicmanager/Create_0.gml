vol1 = 1;
vol2 = 0;
vol3 = 0;

mus1 = audio_play_sound(musWave1, 6, true);
mus2 = audio_play_sound(musWave2, 6, true);
mus3 = audio_play_sound(musWave3, 6, true);

audio_sound_gain(mus1, vol1, 0);
audio_sound_gain(mus2, vol2, 0);
audio_sound_gain(mus3, vol3, 0);
