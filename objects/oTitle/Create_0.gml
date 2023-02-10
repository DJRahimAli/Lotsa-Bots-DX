var layerID = layer_get_id("Background")
bgID = layer_background_get_id(layerID);
pose = 0;
audio_play_sound(musTitle, 1, 2);


cooldownCurrent = 0;


optionString =
{
	def		: [ int64(room_width/2), room_height-20, "Select an option by clicking on it."			   ],
	play	: [ int64(room_width/2), room_height-20, "Play the game."								   ],
	options : [ int64(room_width/2), room_height-20, "Configure game settings."						   ],
	credits : [ int64(room_width/2), room_height-20, "Check out the awesome folks who made this game!" ]
};

optionText = optionString.def;

/* "What's this" code
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
textAmountCurrent = textAmount;*/
