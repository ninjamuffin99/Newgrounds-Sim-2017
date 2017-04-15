package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import com.newgrounds.*;
import flixel.ui.FlxSpriteButton;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import source.Stats;

class MenuState extends FlxState
{
	private var bg:FlxSprite;
	private var _btnPlay:FlxButtonPlus;
	
	private var savegroup:SaveGroup;
	
	override public function create():Void
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/TitleScreen.png", false, 1280, 720);
		add(bg);
		
		_btnPlay = new FlxButtonPlus(500, 570, clickPlay, "PLAY GAME", 300, 50);
		add(_btnPlay);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function clickPlay():Void
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.6, false, finishFade);
		
	}
	private function finishFade():Void
	{
		API.createSaveFile("CloudSave");
		Logger.logMessage("TEST MESSAGE");
		FlxG.log.add("thing");
		FlxG.switchState(new FileSelect());
	}
}