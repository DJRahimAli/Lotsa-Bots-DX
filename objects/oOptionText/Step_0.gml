//switch statement to set string value for the option description
//code checks each case to see if Optiontext is a specific value based on what option the cursor is on
//different strings have different x values so that the text can stay centered


switch (Optiontext)
{
	case 1:
		Optionstring = "Select an option by clicking on it.";
		x = 250;
	break;
	
	case 2:
		Optionstring = "Play the game.";
		x = 360;
	break;
	
	case 3:
		Optionstring = "Configure game settings.";
		x = 300;
	break;
	
	case 4:
		Optionstring = "Check out the awesome folks who made this game!";
		x = 120;
	break;
	
}