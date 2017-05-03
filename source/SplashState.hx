package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * Basically a stripped down version of the FlxSplash that comes with HaxeFlixel
 * More info can be found here : https://github.com/ninjamuffin99/HFSplashTemplate
 * @author ...
 */
class SplashState extends FlxState 
{
	private var _times:Array<Float>;
	private var _curPart:Int = 0;
	private var _functions:Array<Void->Void>;
	
	//all the text made in flash
	private var _madeBy:FlxSprite;
	private var _ninjaMuffin:FlxSprite;
	private var _using:FlxSprite;
	private var _hfLogo:FlxSprite;
	private var _haxeFlixel:FlxSprite;
	
	override public function create():Void 
	{
		FlxG.fixedTimestep = false;
		
		
		_madeBy = new FlxSprite(154, 29);
		_madeBy.loadGraphic("assets/images/MadeBy.png", true, 347, 340);
		_madeBy.animation.add("play", [0, 1], 6);
		
		_ninjaMuffin = new FlxSprite(163, 301);
		_ninjaMuffin.loadGraphic("assets/images/NinjaMuffin.png", true, 672, 276);
		_ninjaMuffin.animation.add("play", [0, 1], 6);
		
		_using = new FlxSprite(895, 421);
		_using.loadGraphic("assets/images/using.png", true, 216, 129);
		_using.animation.add("play", [0, 1], 6);
		
		_hfLogo = new FlxSprite(745, 490);
		_hfLogo.loadGraphic("assets/images/HFLogo.png", true, 150, 152);
		_hfLogo.animation.add("play", [0, 1], 6);
		_hfLogo.angle = 20;
		
		_haxeFlixel = new FlxSprite(910, 575);
		_haxeFlixel.loadGraphic("assets/images/HaxeFlixelWords.png", true, 351, 111);
		_haxeFlixel.animation.add("play", [0, 1], 6);
		_haxeFlixel.angle = 20;
		
		_times = [0.041, 0.184, 0.334, 0.495, 0.636];
		_functions = [addText1, addText2, addText3, addText4, addText5];
		
		for (time in _times)
		{
			new FlxTimer().start(time, timerCallback);
		}
		
		FlxG.sound.play("assets/sounds/flixel.mp3", 1, false, null, true);
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressed)
		{
			finishSound();
		}
		
		super.update(elapsed);
	}
	
	private function timerCallback(Timer:FlxTimer):Void
	{
		_functions[_curPart]();
		_curPart++;
		
		if (_curPart == 5)
		{
			FlxG.camera.fade(FlxColor.BLACK, 3.25, false, finishSound);
		}
	}
	
	private function addText1():Void
	{
		_madeBy.animation.play("play");
		add(_madeBy);
	}
	
	private function addText2():Void
	{
		_ninjaMuffin.animation.play("play");
		add(_ninjaMuffin);
	}
	
	private function addText3():Void
	{
		_using.animation.play("play");
		add(_using);
	}
	
	private function addText4():Void
	{
		_hfLogo.animation.play("play");
		add(_hfLogo);
	}
	
	private function addText5():Void
	{
		_haxeFlixel.animation.play("play");
		add(_haxeFlixel);
	}
	
	private function finishSound():Void
	{
		FlxG.switchState(new MenuState());
	}
	
}
