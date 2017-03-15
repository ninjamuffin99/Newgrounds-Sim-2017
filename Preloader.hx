package;

import flixel.system.FlxBasePreloader;
import flash.display.*;
import flash.Lib;
import openfl.display.Sprite;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;

/**
 * ...
 * @author ninjaMuffin
 */
@:bitmap("assets/images/lenny.png") class LogoImage extends BitmapData { }
@:font("assets/data/OpenSans-CondLight.ttf") class CustomFont extends Font { }

class Preloader extends FlxBasePreloader 
{

	public function new(MinDisplayTime:Float=2, ?AllowedURLs:Array<String>) 
	{
		super(MinDisplayTime, AllowedURLs);
	}
	
	var logo:Sprite;
	var text:TextField;
	
	override function create():Void 
	{
		this._width = Lib.current.stage.stageWidth;
		this._height = Lib.current.stage.stageHeight;
		
		var ratio:Float = this._width / 800; //This allows us to scale assets depending on the size of the screen.
		
		logo = new Sprite();
		logo.addChild(new Bitmap(new LogoImage(0, 0))); //Sets the graphic of the sprite to a bitmap object, which uses our embedded bitmapData class
		logo.scaleX = logo.scaleY = ratio;
		logo.x = ((this._width) / 2) - ((logo.width) / 2);
		logo.y = (this._height / 2) - ((logo.height) / 2);
		addChild(logo);
		
		Font.registerFont(CustomFont);
		text = new TextField();
		text.defaultTextFormat = new TextFormat("Open Sans Condensed Light", Std.int(24 * ratio), 0xffffff);
		text.embedFonts = true;
		text.selectable = false;
		text.multiline = false;
		text.x = 0;
		text.y = 5.2 * this._height / 6;
		text.width = _width;
		text.height = Std.int(32 * ratio);
		text.text = "Loading";
		addChild(text);
		
		super.create();
	}
	
}