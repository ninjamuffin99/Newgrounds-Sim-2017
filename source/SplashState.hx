package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class SplashState extends FlxState 
{
	private var _times:Array<Float>;
	private var _curPart:Int = 0;
	private var _functions:Array<Void->Void>;
	
	override public function create():Void 
	{
		FlxG.fixedTimestep = false;
		
		_times = [0.041, 0.184, 0.334, 0.495, 0.636];
		_functions = [addText1, addText2, addText3, addText4, addText5];
		
		for (time in _times)
		{
			new FlxTimer().start(time, timerCallback);
		}
		
		FlxG.sound.play("assets/sounds/flixel.mp3", 1, false, null, true, finishSound);
		super.create();
	}
	
	private function timerCallback(Timer:FlxTimer):Void
	{
		_functions[_curPart]();
		_curPart++;
		
		if (_curPart == 5)
		{
			// Make the logo a tad bit longer, so our users fully appreciate our hard work :D
			FlxG.camera.fade(FlxColor.BLACK, 2.25, false, finishSound);
		}
	}
	
	private function addText1():Void
	{
		var text:FlxText;
		text = new FlxText(200, 200, 0, "MADE BY", 15);
		add(text);
	}
	
	private function addText2():Void
	{
		var text1:FlxText;
		text1 = new FlxText(300, 300, 0, "NINJAMUFFIN", 15);
		add(text1);
	}
	
	private function addText3():Void
	{
		var text2:FlxText;
		text2 = new FlxText(300, 400, 0, "USING", 15);
		add(text2);
	}
	
	private function addText4():Void
	{
		var text3:FlxText;
		text3 = new FlxText(300, 600, 0, "HAXEFLIXEL", 15);
		add(text3);
	}
	
	private function addText5():Void
	{
		var text4:FlxText;
		text4 = new FlxText(500, 600, 0, "YAY", 15);
		add(text4);
	}
	
	private function finishSound():Void
	{
		FlxG.switchState(new MenuState());
	}
	
}