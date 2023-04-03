draw_set_alpha(image_alpha);

//Create surface
if (!surface_exists(surface)) surface = surface_create(room_width, room_height);

//Set surface target
surface_set_target(surface);

//Clear surface
draw_clear_alpha(c_black, 0);

//Draw shadow
gpu_set_blendenable(false);
shader_set(shFlash);
draw_sprite_ext(sArrayPortrait, portrait, 10, 10, 1, 1, 0, make_color_rgb(0, 20, 64), 0.5);
shader_reset();
gpu_set_blendenable(true);

//Draw overlap
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(sArrayPortrait, portrait, 0, 0, 1, 1, 0, c_white, 1);
gpu_set_blendmode(bm_normal);

//Reset target
surface_reset_target();

//Draw surface
draw_surface_ext(surface, 0, 0, 1, 1, 0, c_white, image_alpha);

//Reset surface
if (surface_exists(surface)) surface_free(surface);

//Draw portrait
draw_sprite(sArrayPortrait, portrait, 0, 0);


//establishing essential code for the text and drawing it 
draw_set_font(fntSilver);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Drawing the string value in optionString
draw_text(optionText[0], optionText[1], string(optionText[2]));

draw_set_alpha(1);
