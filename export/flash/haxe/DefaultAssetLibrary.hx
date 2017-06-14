package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_data_arial_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_data_arialbd_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_data_featureditem_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_data_opensans_condlight_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/ARIAL.TTF", __ASSET__assets_data_arial_ttf);
		type.set ("assets/data/ARIAL.TTF", AssetType.FONT);
		className.set ("assets/data/ARIALBD.TTF", __ASSET__assets_data_arialbd_ttf);
		type.set ("assets/data/ARIALBD.TTF", AssetType.FONT);
		className.set ("assets/data/FeaturedItem.ttf", __ASSET__assets_data_featureditem_ttf);
		type.set ("assets/data/FeaturedItem.ttf", AssetType.FONT);
		className.set ("assets/data/OpenSans-CondLight.ttf", __ASSET__assets_data_opensans_condlight_ttf);
		type.set ("assets/data/OpenSans-CondLight.ttf", AssetType.FONT);
		className.set ("assets/images/animate.png", __ASSET__assets_images_animate_png);
		type.set ("assets/images/animate.png", AssetType.IMAGE);
		className.set ("assets/images/BBS.PNG", __ASSET__assets_images_bbs_png);
		type.set ("assets/images/BBS.PNG", AssetType.IMAGE);
		className.set ("assets/images/BBSblurred.png", __ASSET__assets_images_bbsblurred_png);
		type.set ("assets/images/BBSblurred.png", AssetType.IMAGE);
		className.set ("assets/images/BedDoor.png", __ASSET__assets_images_beddoor_png);
		type.set ("assets/images/BedDoor.png", AssetType.IMAGE);
		className.set ("assets/images/BG.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/BG.png", AssetType.IMAGE);
		className.set ("assets/images/ButtonNoText.png", __ASSET__assets_images_buttonnotext_png);
		type.set ("assets/images/ButtonNoText.png", AssetType.IMAGE);
		className.set ("assets/images/CreditsAnim.png", __ASSET__assets_images_creditsanim_png);
		type.set ("assets/images/CreditsAnim.png", AssetType.IMAGE);
		className.set ("assets/images/CreditsAnim.swf", __ASSET__assets_images_creditsanim_swf);
		type.set ("assets/images/CreditsAnim.swf", AssetType.BINARY);
		className.set ("assets/images/defaultProfilePic.jpg", __ASSET__assets_images_defaultprofilepic_jpg);
		type.set ("assets/images/defaultProfilePic.jpg", AssetType.IMAGE);
		className.set ("assets/images/Desk.png", __ASSET__assets_images_desk_png);
		type.set ("assets/images/Desk.png", AssetType.IMAGE);
		className.set ("assets/images/fd.png", __ASSET__assets_images_fd_png);
		type.set ("assets/images/fd.png", AssetType.IMAGE);
		className.set ("assets/images/fl.png", __ASSET__assets_images_fl_png);
		type.set ("assets/images/fl.png", AssetType.IMAGE);
		className.set ("assets/images/gear.png", __ASSET__assets_images_gear_png);
		type.set ("assets/images/gear.png", AssetType.IMAGE);
		className.set ("assets/images/GitHub-Mark-32px.png", __ASSET__assets_images_github_mark_32px_png);
		type.set ("assets/images/GitHub-Mark-32px.png", AssetType.IMAGE);
		className.set ("assets/images/GitHub-Mark-Light-32px.png", __ASSET__assets_images_github_mark_light_32px_png);
		type.set ("assets/images/GitHub-Mark-Light-32px.png", AssetType.IMAGE);
		className.set ("assets/images/GitHub-Mark-Light-64px.png", __ASSET__assets_images_github_mark_light_64px_png);
		type.set ("assets/images/GitHub-Mark-Light-64px.png", AssetType.IMAGE);
		className.set ("assets/images/HAXEFLIXEL.png", __ASSET__assets_images_haxeflixel_png);
		type.set ("assets/images/HAXEFLIXEL.png", AssetType.IMAGE);
		className.set ("assets/images/HaxeFlixelWords.png", __ASSET__assets_images_haxeflixelwords_png);
		type.set ("assets/images/HaxeFlixelWords.png", AssetType.IMAGE);
		className.set ("assets/images/HFLogo.png", __ASSET__assets_images_hflogo_png);
		type.set ("assets/images/HFLogo.png", AssetType.IMAGE);
		className.set ("assets/images/internet.png", __ASSET__assets_images_internet_png);
		type.set ("assets/images/internet.png", AssetType.IMAGE);
		className.set ("assets/images/lenny.png", __ASSET__assets_images_lenny_png);
		type.set ("assets/images/lenny.png", AssetType.IMAGE);
		className.set ("assets/images/MadeBy.png", __ASSET__assets_images_madeby_png);
		type.set ("assets/images/MadeBy.png", AssetType.IMAGE);
		className.set ("assets/images/mouse.png", __ASSET__assets_images_mouse_png);
		type.set ("assets/images/mouse.png", AssetType.IMAGE);
		className.set ("assets/images/NewGameStats.jpg", __ASSET__assets_images_newgamestats_jpg);
		type.set ("assets/images/NewGameStats.jpg", AssetType.IMAGE);
		className.set ("assets/images/NGBG.png", __ASSET__assets_images_ngbg_png);
		type.set ("assets/images/NGBG.png", AssetType.IMAGE);
		className.set ("assets/images/NG_LOGO.png", __ASSET__assets_images_ng_logo_png);
		type.set ("assets/images/NG_LOGO.png", AssetType.IMAGE);
		className.set ("assets/images/NinjaMuffin.png", __ASSET__assets_images_ninjamuffin_png);
		type.set ("assets/images/NinjaMuffin.png", AssetType.IMAGE);
		className.set ("assets/images/PCBG.png", __ASSET__assets_images_pcbg_png);
		type.set ("assets/images/PCBG.png", AssetType.IMAGE);
		className.set ("assets/images/projectFiles/NGBG.psd", __ASSET__assets_images_projectfiles_ngbg_psd);
		type.set ("assets/images/projectFiles/NGBG.psd", AssetType.BINARY);
		className.set ("assets/images/projectFiles/TitleScreenPSD.psd", __ASSET__assets_images_projectfiles_titlescreenpsd_psd);
		type.set ("assets/images/projectFiles/TitleScreenPSD.psd", AssetType.BINARY);
		className.set ("assets/images/PS.png", __ASSET__assets_images_ps_png);
		type.set ("assets/images/PS.png", AssetType.IMAGE);
		className.set ("assets/images/TitleScreen.png", __ASSET__assets_images_titlescreen_png);
		type.set ("assets/images/TitleScreen.png", AssetType.IMAGE);
		className.set ("assets/images/tomfulpcoe.jpg", __ASSET__assets_images_tomfulpcoe_jpg);
		type.set ("assets/images/tomfulpcoe.jpg", AssetType.IMAGE);
		className.set ("assets/images/using.png", __ASSET__assets_images_using_png);
		type.set ("assets/images/using.png", AssetType.IMAGE);
		className.set ("assets/images/Window.png", __ASSET__assets_images_window_png);
		type.set ("assets/images/Window.png", AssetType.IMAGE);
		className.set ("assets/images/WorkDoor.png", __ASSET__assets_images_workdoor_png);
		type.set ("assets/images/WorkDoor.png", AssetType.IMAGE);
		className.set ("assets/music/1683_newgrounds_lhm__e.mp3", __ASSET__assets_music_1683_newgrounds_lhm__e_mp3);
		type.set ("assets/music/1683_newgrounds_lhm__e.mp3", AssetType.MUSIC);
		className.set ("assets/music/mynamatom.mp3", __ASSET__assets_music_mynamatom_mp3);
		type.set ("assets/music/mynamatom.mp3", AssetType.MUSIC);
		className.set ("assets/music/SHITLOOP.mp3", __ASSET__assets_music_shitloop_mp3);
		type.set ("assets/music/SHITLOOP.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/save.wav", __ASSET__assets_sounds_save_wav);
		type.set ("assets/sounds/save.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tooltip_arrow.png", __ASSET__flixel_flixel_ui_img_tooltip_arrow_png);
		type.set ("flixel/flixel-ui/img/tooltip_arrow.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/ARIAL.TTF";
		className.set (id, __ASSET__assets_data_arial_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/data/ARIALBD.TTF";
		className.set (id, __ASSET__assets_data_arialbd_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/data/FeaturedItem.ttf";
		className.set (id, __ASSET__assets_data_featureditem_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/data/OpenSans-CondLight.ttf";
		className.set (id, __ASSET__assets_data_opensans_condlight_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/images/animate.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/BBS.PNG";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/BBSblurred.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/BedDoor.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/BG.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ButtonNoText.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CreditsAnim.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/CreditsAnim.swf";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/defaultProfilePic.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Desk.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fd.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fl.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/gear.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GitHub-Mark-32px.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GitHub-Mark-Light-32px.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GitHub-Mark-Light-64px.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HAXEFLIXEL.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HaxeFlixelWords.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HFLogo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/internet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/lenny.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/MadeBy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mouse.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NewGameStats.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NGBG.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NG_LOGO.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NinjaMuffin.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/PCBG.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/projectFiles/NGBG.psd";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/projectFiles/TitleScreenPSD.psd";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/PS.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TitleScreen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tomfulpcoe.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/using.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Window.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/WorkDoor.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/1683_newgrounds_lhm__e.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/mynamatom.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/SHITLOOP.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/save.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_thin.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_toggle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/check_box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/check_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_flat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_inset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_light.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/dropdown_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/finger_big.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/finger_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/hilight.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/invis.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/minus_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/plus_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/radio.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/radio_dot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/swatch.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tab.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tab_back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tooltip_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/xml/defaults.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/flixel-ui/xml/default_loading_screen.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/flixel-ui/xml/default_popup.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/ARIAL.TTF", __ASSET__assets_data_arial_ttf);
		type.set ("assets/data/ARIAL.TTF", AssetType.FONT);
		
		className.set ("assets/data/ARIALBD.TTF", __ASSET__assets_data_arialbd_ttf);
		type.set ("assets/data/ARIALBD.TTF", AssetType.FONT);
		
		className.set ("assets/data/FeaturedItem.ttf", __ASSET__assets_data_featureditem_ttf);
		type.set ("assets/data/FeaturedItem.ttf", AssetType.FONT);
		
		className.set ("assets/data/OpenSans-CondLight.ttf", __ASSET__assets_data_opensans_condlight_ttf);
		type.set ("assets/data/OpenSans-CondLight.ttf", AssetType.FONT);
		
		className.set ("assets/images/animate.png", __ASSET__assets_images_animate_png);
		type.set ("assets/images/animate.png", AssetType.IMAGE);
		
		className.set ("assets/images/BBS.PNG", __ASSET__assets_images_bbs_png);
		type.set ("assets/images/BBS.PNG", AssetType.IMAGE);
		
		className.set ("assets/images/BBSblurred.png", __ASSET__assets_images_bbsblurred_png);
		type.set ("assets/images/BBSblurred.png", AssetType.IMAGE);
		
		className.set ("assets/images/BedDoor.png", __ASSET__assets_images_beddoor_png);
		type.set ("assets/images/BedDoor.png", AssetType.IMAGE);
		
		className.set ("assets/images/BG.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/BG.png", AssetType.IMAGE);
		
		className.set ("assets/images/ButtonNoText.png", __ASSET__assets_images_buttonnotext_png);
		type.set ("assets/images/ButtonNoText.png", AssetType.IMAGE);
		
		className.set ("assets/images/CreditsAnim.png", __ASSET__assets_images_creditsanim_png);
		type.set ("assets/images/CreditsAnim.png", AssetType.IMAGE);
		
		className.set ("assets/images/CreditsAnim.swf", __ASSET__assets_images_creditsanim_swf);
		type.set ("assets/images/CreditsAnim.swf", AssetType.BINARY);
		
		className.set ("assets/images/defaultProfilePic.jpg", __ASSET__assets_images_defaultprofilepic_jpg);
		type.set ("assets/images/defaultProfilePic.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/Desk.png", __ASSET__assets_images_desk_png);
		type.set ("assets/images/Desk.png", AssetType.IMAGE);
		
		className.set ("assets/images/fd.png", __ASSET__assets_images_fd_png);
		type.set ("assets/images/fd.png", AssetType.IMAGE);
		
		className.set ("assets/images/fl.png", __ASSET__assets_images_fl_png);
		type.set ("assets/images/fl.png", AssetType.IMAGE);
		
		className.set ("assets/images/gear.png", __ASSET__assets_images_gear_png);
		type.set ("assets/images/gear.png", AssetType.IMAGE);
		
		className.set ("assets/images/GitHub-Mark-32px.png", __ASSET__assets_images_github_mark_32px_png);
		type.set ("assets/images/GitHub-Mark-32px.png", AssetType.IMAGE);
		
		className.set ("assets/images/GitHub-Mark-Light-32px.png", __ASSET__assets_images_github_mark_light_32px_png);
		type.set ("assets/images/GitHub-Mark-Light-32px.png", AssetType.IMAGE);
		
		className.set ("assets/images/GitHub-Mark-Light-64px.png", __ASSET__assets_images_github_mark_light_64px_png);
		type.set ("assets/images/GitHub-Mark-Light-64px.png", AssetType.IMAGE);
		
		className.set ("assets/images/HAXEFLIXEL.png", __ASSET__assets_images_haxeflixel_png);
		type.set ("assets/images/HAXEFLIXEL.png", AssetType.IMAGE);
		
		className.set ("assets/images/HaxeFlixelWords.png", __ASSET__assets_images_haxeflixelwords_png);
		type.set ("assets/images/HaxeFlixelWords.png", AssetType.IMAGE);
		
		className.set ("assets/images/HFLogo.png", __ASSET__assets_images_hflogo_png);
		type.set ("assets/images/HFLogo.png", AssetType.IMAGE);
		
		className.set ("assets/images/internet.png", __ASSET__assets_images_internet_png);
		type.set ("assets/images/internet.png", AssetType.IMAGE);
		
		className.set ("assets/images/lenny.png", __ASSET__assets_images_lenny_png);
		type.set ("assets/images/lenny.png", AssetType.IMAGE);
		
		className.set ("assets/images/MadeBy.png", __ASSET__assets_images_madeby_png);
		type.set ("assets/images/MadeBy.png", AssetType.IMAGE);
		
		className.set ("assets/images/mouse.png", __ASSET__assets_images_mouse_png);
		type.set ("assets/images/mouse.png", AssetType.IMAGE);
		
		className.set ("assets/images/NewGameStats.jpg", __ASSET__assets_images_newgamestats_jpg);
		type.set ("assets/images/NewGameStats.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/NGBG.png", __ASSET__assets_images_ngbg_png);
		type.set ("assets/images/NGBG.png", AssetType.IMAGE);
		
		className.set ("assets/images/NG_LOGO.png", __ASSET__assets_images_ng_logo_png);
		type.set ("assets/images/NG_LOGO.png", AssetType.IMAGE);
		
		className.set ("assets/images/NinjaMuffin.png", __ASSET__assets_images_ninjamuffin_png);
		type.set ("assets/images/NinjaMuffin.png", AssetType.IMAGE);
		
		className.set ("assets/images/PCBG.png", __ASSET__assets_images_pcbg_png);
		type.set ("assets/images/PCBG.png", AssetType.IMAGE);
		
		className.set ("assets/images/projectFiles/NGBG.psd", __ASSET__assets_images_projectfiles_ngbg_psd);
		type.set ("assets/images/projectFiles/NGBG.psd", AssetType.BINARY);
		
		className.set ("assets/images/projectFiles/TitleScreenPSD.psd", __ASSET__assets_images_projectfiles_titlescreenpsd_psd);
		type.set ("assets/images/projectFiles/TitleScreenPSD.psd", AssetType.BINARY);
		
		className.set ("assets/images/PS.png", __ASSET__assets_images_ps_png);
		type.set ("assets/images/PS.png", AssetType.IMAGE);
		
		className.set ("assets/images/TitleScreen.png", __ASSET__assets_images_titlescreen_png);
		type.set ("assets/images/TitleScreen.png", AssetType.IMAGE);
		
		className.set ("assets/images/tomfulpcoe.jpg", __ASSET__assets_images_tomfulpcoe_jpg);
		type.set ("assets/images/tomfulpcoe.jpg", AssetType.IMAGE);
		
		className.set ("assets/images/using.png", __ASSET__assets_images_using_png);
		type.set ("assets/images/using.png", AssetType.IMAGE);
		
		className.set ("assets/images/Window.png", __ASSET__assets_images_window_png);
		type.set ("assets/images/Window.png", AssetType.IMAGE);
		
		className.set ("assets/images/WorkDoor.png", __ASSET__assets_images_workdoor_png);
		type.set ("assets/images/WorkDoor.png", AssetType.IMAGE);
		
		className.set ("assets/music/1683_newgrounds_lhm__e.mp3", __ASSET__assets_music_1683_newgrounds_lhm__e_mp3);
		type.set ("assets/music/1683_newgrounds_lhm__e.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/mynamatom.mp3", __ASSET__assets_music_mynamatom_mp3);
		type.set ("assets/music/mynamatom.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/SHITLOOP.mp3", __ASSET__assets_music_shitloop_mp3);
		type.set ("assets/music/SHITLOOP.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/save.wav", __ASSET__assets_sounds_save_wav);
		type.set ("assets/sounds/save.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tooltip_arrow.png", __ASSET__flixel_flixel_ui_img_tooltip_arrow_png);
		type.set ("flixel/flixel-ui/img/tooltip_arrow.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_arial_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_data_arialbd_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_data_featureditem_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_data_opensans_condlight_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_images_animate_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bbs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bbsblurred_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_beddoor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_buttonnotext_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_creditsanim_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_creditsanim_swf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_defaultprofilepic_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_desk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_gear_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_github_mark_32px_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_github_mark_light_32px_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_github_mark_light_64px_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_haxeflixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_haxeflixelwords_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hflogo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_internet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lenny_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_madeby_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mouse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_newgamestats_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ngbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ng_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ninjamuffin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pcbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_projectfiles_ngbg_psd extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_projectfiles_titlescreenpsd_psd extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_ps_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_titlescreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tomfulpcoe_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_using_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_window_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_workdoor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_1683_newgrounds_lhm__e_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_mynamatom_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_shitloop_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_save_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends flash.utils.ByteArray { }


#elseif html5

@:keep #if display private #end class __ASSET__assets_data_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 
@:keep #if display private #end class __ASSET__assets_data_arialbd_ttf extends lime.text.Font { public function new () { super (); name = "Arial Bold"; } } 
@:keep #if display private #end class __ASSET__assets_data_featureditem_ttf extends lime.text.Font { public function new () { super (); name = "Featured Item"; } } 
@:keep #if display private #end class __ASSET__assets_data_opensans_condlight_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Cond Light"; } } 












































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 


































#else



#if (windows || mac || linux || cpp)


@:font("assets/data/ARIAL.TTF") #if display private #end class __ASSET__assets_data_arial_ttf extends lime.text.Font {}
@:font("assets/data/ARIALBD.TTF") #if display private #end class __ASSET__assets_data_arialbd_ttf extends lime.text.Font {}
@:font("assets/data/FeaturedItem.ttf") #if display private #end class __ASSET__assets_data_featureditem_ttf extends lime.text.Font {}
@:font("assets/data/OpenSans-CondLight.ttf") #if display private #end class __ASSET__assets_data_opensans_condlight_ttf extends lime.text.Font {}
@:image("assets/images/animate.png") #if display private #end class __ASSET__assets_images_animate_png extends lime.graphics.Image {}
@:image("assets/images/BBS.PNG") #if display private #end class __ASSET__assets_images_bbs_png extends lime.graphics.Image {}
@:image("assets/images/BBSblurred.png") #if display private #end class __ASSET__assets_images_bbsblurred_png extends lime.graphics.Image {}
@:image("assets/images/BedDoor.png") #if display private #end class __ASSET__assets_images_beddoor_png extends lime.graphics.Image {}
@:image("assets/images/BG.png") #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:image("assets/images/ButtonNoText.png") #if display private #end class __ASSET__assets_images_buttonnotext_png extends lime.graphics.Image {}
@:image("assets/images/CreditsAnim.png") #if display private #end class __ASSET__assets_images_creditsanim_png extends lime.graphics.Image {}
@:file("assets/images/CreditsAnim.swf") #if display private #end class __ASSET__assets_images_creditsanim_swf extends lime.utils.Bytes {}
@:image("assets/images/defaultProfilePic.jpg") #if display private #end class __ASSET__assets_images_defaultprofilepic_jpg extends lime.graphics.Image {}
@:image("assets/images/Desk.png") #if display private #end class __ASSET__assets_images_desk_png extends lime.graphics.Image {}
@:image("assets/images/fd.png") #if display private #end class __ASSET__assets_images_fd_png extends lime.graphics.Image {}
@:image("assets/images/fl.png") #if display private #end class __ASSET__assets_images_fl_png extends lime.graphics.Image {}
@:image("assets/images/gear.png") #if display private #end class __ASSET__assets_images_gear_png extends lime.graphics.Image {}
@:image("assets/images/GitHub-Mark-32px.png") #if display private #end class __ASSET__assets_images_github_mark_32px_png extends lime.graphics.Image {}
@:image("assets/images/GitHub-Mark-Light-32px.png") #if display private #end class __ASSET__assets_images_github_mark_light_32px_png extends lime.graphics.Image {}
@:image("assets/images/GitHub-Mark-Light-64px.png") #if display private #end class __ASSET__assets_images_github_mark_light_64px_png extends lime.graphics.Image {}
@:image("assets/images/HAXEFLIXEL.png") #if display private #end class __ASSET__assets_images_haxeflixel_png extends lime.graphics.Image {}
@:image("assets/images/HaxeFlixelWords.png") #if display private #end class __ASSET__assets_images_haxeflixelwords_png extends lime.graphics.Image {}
@:image("assets/images/HFLogo.png") #if display private #end class __ASSET__assets_images_hflogo_png extends lime.graphics.Image {}
@:image("assets/images/internet.png") #if display private #end class __ASSET__assets_images_internet_png extends lime.graphics.Image {}
@:image("assets/images/lenny.png") #if display private #end class __ASSET__assets_images_lenny_png extends lime.graphics.Image {}
@:image("assets/images/MadeBy.png") #if display private #end class __ASSET__assets_images_madeby_png extends lime.graphics.Image {}
@:image("assets/images/mouse.png") #if display private #end class __ASSET__assets_images_mouse_png extends lime.graphics.Image {}
@:image("assets/images/NewGameStats.jpg") #if display private #end class __ASSET__assets_images_newgamestats_jpg extends lime.graphics.Image {}
@:image("assets/images/NGBG.png") #if display private #end class __ASSET__assets_images_ngbg_png extends lime.graphics.Image {}
@:image("assets/images/NG_LOGO.png") #if display private #end class __ASSET__assets_images_ng_logo_png extends lime.graphics.Image {}
@:image("assets/images/NinjaMuffin.png") #if display private #end class __ASSET__assets_images_ninjamuffin_png extends lime.graphics.Image {}
@:image("assets/images/PCBG.png") #if display private #end class __ASSET__assets_images_pcbg_png extends lime.graphics.Image {}
@:file("assets/images/projectFiles/NGBG.psd") #if display private #end class __ASSET__assets_images_projectfiles_ngbg_psd extends lime.utils.Bytes {}
@:file("assets/images/projectFiles/TitleScreenPSD.psd") #if display private #end class __ASSET__assets_images_projectfiles_titlescreenpsd_psd extends lime.utils.Bytes {}
@:image("assets/images/PS.png") #if display private #end class __ASSET__assets_images_ps_png extends lime.graphics.Image {}
@:image("assets/images/TitleScreen.png") #if display private #end class __ASSET__assets_images_titlescreen_png extends lime.graphics.Image {}
@:image("assets/images/tomfulpcoe.jpg") #if display private #end class __ASSET__assets_images_tomfulpcoe_jpg extends lime.graphics.Image {}
@:image("assets/images/using.png") #if display private #end class __ASSET__assets_images_using_png extends lime.graphics.Image {}
@:image("assets/images/Window.png") #if display private #end class __ASSET__assets_images_window_png extends lime.graphics.Image {}
@:image("assets/images/WorkDoor.png") #if display private #end class __ASSET__assets_images_workdoor_png extends lime.graphics.Image {}
@:file("assets/music/1683_newgrounds_lhm__e.mp3") #if display private #end class __ASSET__assets_music_1683_newgrounds_lhm__e_mp3 extends lime.utils.Bytes {}
@:file("assets/music/mynamatom.mp3") #if display private #end class __ASSET__assets_music_mynamatom_mp3 extends lime.utils.Bytes {}
@:file("assets/music/SHITLOOP.mp3") #if display private #end class __ASSET__assets_music_shitloop_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/save.wav") #if display private #end class __ASSET__assets_sounds_save_wav extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,1/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/box.png") #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_down.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_left.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_right.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_up.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_thin.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_toggle.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/check_box.png") #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/check_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome_flat.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome_inset.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome_light.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/dropdown_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/finger_big.png") #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/finger_small.png") #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/hilight.png") #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/invis.png") #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/minus_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/plus_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/radio.png") #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/radio_dot.png") #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/swatch.png") #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/tab.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/tab_back.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/tooltip_arrow.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/xml/defaults.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/xml/default_loading_screen.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/xml/default_popup.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends lime.utils.Bytes {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_data_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_data_arial_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_data_arialbd_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_data_arialbd_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_data_featureditem_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_data_featureditem_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_data_opensans_condlight_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_data_opensans_condlight_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end