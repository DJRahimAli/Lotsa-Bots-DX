draw_set_alpha(image_alpha);

//Create surface
if (!surface_exists(surf)) surf = surface_create(portraitWidth, portraitHeight);

//Set surface target
surface_set_target(surf);

//Draw shadow
shader_set(shFlash);

draw_sprite_ext( sArrayPortrait, portrait, 10, 10, 1, 1, 0, make_color_rgb(0, 20, 64), 0.5*image_alpha );

shader_reset();

//Draw overlap
gpu_set_blendmode(bm_subtract);
draw_sprite_ext( sArrayPortrait, portrait, 0, 0, 1, 1, 0, c_white, 1 );
gpu_set_blendmode(bm_normal);

//Reset target
surface_reset_target();

//Draw surface
draw_surface(surf, 0, 0);

//Draw portrait
draw_sprite(sArrayPortrait, portrait, 0, 0);


//establishing essential code for the text and drawing it 
draw_set_font(fntSilver);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


//Drawing the string value in Optionstring
draw_text(optionText[0], optionText[1], string(optionText[2]));
