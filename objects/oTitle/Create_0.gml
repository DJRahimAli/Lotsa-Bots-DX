var layerID = layer_get_id("Background")
bgID = layer_background_get_id(layerID);

portrait = 0;
surface = surface_create(room_width, room_height);

audio_play_sound(musTitle, 1, 2);

cooldown = 60*3;
cooldownCurrent = cooldown;


optionString =
{
	def		: [ int64(room_width/2), room_height-20, "Select an option by clicking on it."			   ],
	play	: [ int64(room_width/2), room_height-20, "Play the game."								   ],
	options : [ int64(room_width/2), room_height-20, "Configure game settings."						   ],
	credits : [ int64(room_width/2), room_height-20, "Check out the awesome folks who made this game!" ]
};

optionText = optionString.def;


fadeinAmount = 0.02;
fadeoutAmount = 0.02;

mousexPrevious = mouse_x;
mouseyPrevious = mouse_y;

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
