package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import source.Stats;

class PlayState extends FlxState
{
	private var _btnPC:FlxButton;
	private var _btnSleep:FlxButton;
	private var _btnWork:FlxButton;
	
	override public function create():Void
	{
		_btnPC = new FlxButton(0, 0, "Log on", clickPC);
		add(_btnPC);
		
		_btnSleep = new FlxButton(20, 20, "Go to sleep", clickSleep);
		add(_btnSleep);
		
		_btnWork = new FlxButton(20, 40, "Work", clickWork);
		add(_btnWork);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function clickPC():Void
	{
		FlxG.switchState(new PCState());
	}
	
	private function clickSleep():Void
	{
		
	}
	
	private function clickWork():Void
	{
		Stats._cash += 8;
		FlxG.log.add("Cash = " + Stats._cash);
	}
}