if (pause && pauseCurrent)
{
	if (audio_is_playing(sndSMG)) audio_stop_sound( sndSMG );
	if (!layer_sequence_exists("Assets1", sequence)) sequence = layer_sequence_create( "Assets1", oCamera.x, oCamera.y, sqPause );
	instance_deactivate_all(true);
	instance_activate_layer("Assets1");
	pauseCurrent = false;
}

if (!pause && pauseCurrent)
{
	if (layer_sequence_exists("Assets1", sequence)) layer_sequence_destroy(sequence);
	instance_activate_all();
	pauseCurrent = false;
}
