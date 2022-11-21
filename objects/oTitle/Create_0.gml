var layerID = layer_get_id("Background")
bgID = layer_background_get_id(layerID);
pose = 0;
audio_play_sound(musTitle, 1, 2);


cooldownCurrent = 0;

array =
[
	["What's ", 15],
	["this,\n", 15],
	["what's ", 15],
	["this,\n", 15],
	["What's ", 15],
	["this?\n", 35],
	[-1,		0]
];

arrayCurrent = 0 - 1;

text = "";

textAmount = array_length(array);
textAmountCurrent = textAmount;
