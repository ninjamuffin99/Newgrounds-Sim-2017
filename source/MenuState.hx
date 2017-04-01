package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import com.newgrounds.*;

class MenuState extends FlxState
{
	private var _btnPlay:FlxButtonPlus;
	
	private var savegroup:SaveGroup;
	
	override public function create():Void
	{
		_btnPlay = new FlxButtonPlus(0, 0,  clickPlay, "Play", 150, 40);
		add(_btnPlay);
		
		
		_btnPlay.screenCenter();
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function clickPlay():Void
	{
		API.createSaveFile("CloudSave");
		Logger.logMessage("TEST MESSAGE");
		FlxG.log.add("thing");
		FlxG.switchState(new PlayState());
	}
}