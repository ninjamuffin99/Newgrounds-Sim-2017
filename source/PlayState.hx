package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _btnPC:FlxButton;
	
	override public function create():Void
	{
		_btnPC = new FlxButton(0, 0, "Log on", clickPC);
		add(_btnPC);
		
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
}