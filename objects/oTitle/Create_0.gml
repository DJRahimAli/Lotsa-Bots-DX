var layerID = layer_get_id("Background")
bgID = layer_background_get_id(layerID);

portrait = 0;
surface = surface_create(room_width, room_height);

//audio_play_sound(musTitle, 1, 2);

cooldown = 60*5;
cooldownCurrent = cooldown;

oLogo.image_alpha = 0;
oButton.image_alpha = 0;
oTitle.image_alpha = 0;


optionString =
{
	def		: [ round(room_width/2), room_height-20, "Select an option by clicking on it."			   ],
	play	: [ round(room_width/2), room_height-20, "Play the game."								   ],
	options : [ round(room_width/2), room_height-20, "Configure game settings."						   ],
	credits : [ round(room_width/2), room_height-20, "Check out the awesome folks who made this game!" ]
};

optionText = optionString.def;


fadeinAmount = 0.02;
fadeoutAmount = 0.02;
fadeoutAmountClicked = 0.04;

fadeinAmountCurrent = fadeinAmount;
fadeoutAmountCurrent = fadeoutAmount;

mousexPrevious = mouse_x;
mouseyPrevious = mouse_y;
