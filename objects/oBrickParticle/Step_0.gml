timerCurrent++;

if (timerCurrent > timer ) image_alpha -= 0.2;

if (image_alpha <= 0) instance_destroy();

image_angle -= 10;
