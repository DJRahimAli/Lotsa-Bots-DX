shader_set(shFlash);

draw_sprite_ext( sArrayPose, pose, 10, 10, 1, 1, 0, make_color_rgb(0, 20, 64), 0.5 );

shader_reset();


draw_sprite( sArrayPose, pose, 0, 0 );
