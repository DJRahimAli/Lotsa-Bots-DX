if (pause && pauseCurrent)
{
	if (audio_is_playing(sndSMG)) audio_stop_sound( sndSMG );

	instance_deactivate_all(true);
	
	instance_create_layer( 224, 106, "Layer1", oBack );
	
	pauseCurrent = false;
}

if (!pause && pauseCurrent)
{
	if (layer_sequence_exists("Assets1", sequence)) layer_sequence_destroy(sequence);
	instance_activate_all();
	pauseCurrent = false;
}
