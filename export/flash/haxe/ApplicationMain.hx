#if !macro


@:access(lime.app.Application)
@:access(lime.Assets)
@:access(openfl.display.Stage)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new openfl.display.Application ();
		app.create (config);
		
		var display = new Preloader ();
		
		preloader = new openfl.display.Preloader (display);
		app.setPreloader (preloader);
		preloader.onComplete.add (init);
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("Arial Bold");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("Open Sans Cond Light");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("assets/images/BBS.PNG");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/BBSblurred.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/lenny.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/NewGameStats.jpg");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/1683_newgrounds_lhm__e.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("flixel/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("flixel/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("Nokia Cellphone FC Small");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Monsterrat");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("flixel/images/ui/button.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/images/logo/default.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/box.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/button.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/button_arrow_down.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/button_arrow_left.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/button_arrow_right.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/button_arrow_up.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/button_thin.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/button_toggle.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/check_box.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/check_mark.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/chrome.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/chrome_flat.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/chrome_inset.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/chrome_light.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/dropdown_mark.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/finger_big.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/finger_small.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/hilight.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/invis.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/minus_mark.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/plus_mark.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/radio.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/radio_dot.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/swatch.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/tab.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/tab_back.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/img/tooltip_arrow.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/flixel-ui/xml/defaults.xml");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("flixel/flixel-ui/xml/default_loading_screen.xml");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("flixel/flixel-ui/xml/default_popup.xml");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		
		if (total == 0) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			build: "473",
			company: "",
			file: "NGSimtest",
			fps: 60,
			name: "NGSimtest",
			orientation: "",
			packageName: "com.example.myapp",
			version: "0.0.1",
			windows: [
				
				{
					antialiasing: 0,
					background: 0,
					borderless: false,
					depthBuffer: false,
					display: 0,
					fullscreen: false,
					hardware: true,
					height: 720,
					parameters: "{}",
					resizable: true,
					stencilBuffer: true,
					title: "NGSimtest",
					vsync: true,
					width: 1280,
					x: null,
					y: null
				},
			]
			
		};
		
		#if hxtelemetry
		var telemetry = new hxtelemetry.HxTelemetry.Config ();
		telemetry.allocations = true;
		telemetry.host = "localhost";
		telemetry.app_name = config.name;
		Reflect.setField (config, "telemetry", telemetry);
		#end
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 1280, 720, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		#if !flash
		if (openfl.Lib.current.stage.window.fullscreen) {
			
			openfl.Lib.current.stage.dispatchEvent (new openfl.events.FullScreenEvent (openfl.events.FullScreenEvent.FULL_SCREEN, false, false, true, true));
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		#end
		
	}
	
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
