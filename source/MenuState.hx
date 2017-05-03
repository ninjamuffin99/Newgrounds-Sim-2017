package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.addons.ui.FlxUIButton;
import flixel.system.FlxSound;
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
	
	private var _version:FlxText;
	
	private var _btnTHing:FlxUIButton;
	
	private var _sprPlay:FlxSprite;
	
	//private var savegroup:SaveGroup;
	
	override public function create():Void
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/TitleScreen.png", false, 1280, 720);
		add(bg);
		
		_version = new FlxText(750, 520, 0, "Version 0.1.3", 15);
		_version.font = "assets/data/ARIALBD.TTF";
		add(_version);
		
		_sprPlay = new FlxSprite(0, 0);
		_sprPlay.loadGraphic("assets/images/ButtonNoText.png", false, 342, 84);
		
		_btnTHing = new FlxUIButton(500, 570, "PLAY GAME", clickPlay, false);
		_btnTHing.setAllLabelOffsets(42, 15);
		_btnTHing.loadGraphicFromSprite(_sprPlay);
		_btnTHing.setLabelFormat("assets/data/FeaturedItem.ttf", 60);
		_btnTHing.screenCenter(X);
		add(_btnTHing);
		
		FlxG.camera.fade(FlxColor.BLACK, 0.2, true);
		
		_btnPlay = new FlxButtonPlus(500, 570, clickPlay, "PLAY GAME", 300, 50);
		_btnPlay.loadButtonGraphic(_sprPlay, _sprPlay);
		_btnPlay.screenCenter(X);
		_btnPlay.updateHitbox();
		//add(_btnPlay);
		
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic("assets/music/1683_newgrounds_lhm__e.mp3");
		}
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			clickPlay();
		}
		
		super.update(elapsed);
	}
	
	private function clickPlay():Void
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.6, false, finishFade);
		
	}
	private function finishFade():Void
	{
		//API.createSaveFile("CloudSave");
		//Logger.logMessage("TEST MESSAGE");
		FlxG.log.add("thing");
		FlxG.switchState(new FileSelect());
	}
}