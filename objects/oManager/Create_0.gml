randomise();

if (os_browser != browser_not_a_browser) instance_create_layer( 0, 0, layer, obj_HTML_FS );

//instance_create_layer( 0, 0, layer, oData );

global.mobileControls = false;

if ( os_type == os_android || os_type == os_ios ) global.mobileControls = true;

//instance_create_layer( 0, 0, layer, oPauseManager );

window_set_cursor(cr_none);
