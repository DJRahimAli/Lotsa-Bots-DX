shader_set(shFlash);

draw_sprite_ext( sArrayPose, pose, 10, 10, 1, 1, 0, make_color_rgb(0, 20, 64), 0.5 );

shader_reset();


draw_sprite( sArrayPose, pose, 0, 0 );


//establishing essential code for the text and drawing it 
draw_set_font(fntSilver);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


//Drawing the string value in Optionstring
draw_text(optionText[0], optionText[1], string(optionText[2]));
