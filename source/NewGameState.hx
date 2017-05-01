package;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.geom.Matrix;
import flash.net.FileFilter;
import flash.net.FileReference;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.Anchor;
import flixel.addons.ui.FlxButtonPlus;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUITooltip;
import flixel.system.FlxAssets.GraphicLogo;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import com.newgrounds.*;
import com.newgrounds.components.*;

import source.Stats;

/**
 * ...
 * @author ninjaMuffin
 */
class NewGameState extends FlxState 
{
	private var _btnNext:FlxButton;
	
	private var _btnPicUpload:FlxButton;
	
	private var _skillPoints:Int = 15;
	private var _skillPointsText:FlxText;
	
	private var _animationSkillText:FlxText;
	private var _btnAnimationAdd:FlxButtonPlus;
	private var _btnAnimationSub:FlxButtonPlus;
	
	private var _artSkillText:FlxText;
	private var _btnArtAdd:FlxButtonPlus;
	private var _btnArtSub:FlxButtonPlus;
	
	private var _musicSkillText:FlxText;
	private var _btnMusicAdd:FlxButtonPlus;
	private var _btnMusicSub:FlxButtonPlus;
	
	private var _programSkillText:FlxText;
	private var _btnProgramAdd:FlxButtonPlus;
	private var _btnProgramSub:FlxButtonPlus;
	
	private var _voiceSkillText:FlxText;
	private var _btnVoiceAdd:FlxButtonPlus;
	private var _btnVoiceSub:FlxButtonPlus;
	
	private var _writingSkillText:FlxText;
	private var _btnWritingAdd:FlxButtonPlus;
	private var _btnWritingSub:FlxButtonPlus;	
	
	private var _text:FlxText;
	private var _button:FlxButton;
	private var _img:FlxSprite;
	private var _displayWidth:Float;
	private var _displayHeight:Float;
	private var _scaleText:FlxText;
	
	private var _nameText:FlxText;
	private var _nameInput:FlxInputText;
	
	private var _usernameInput:FlxInputText;
	private var _usernameText:FlxText;
	
	private var animationToolTip:FlxUITooltip;
	
	override public function create():Void 
	{
		var bg:FlxSprite;
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/NewGameStats.jpg", false, 1280, 720);
		add(bg);
		
		_btnNext = new FlxButton(230, 203, "Next", clickNext);
		add(_btnNext);
		
		createUserStats();
		
		
		/*
		_btnPicUpload = new FlxButton(200, 200, "Upload profile pic", clickUpload);
		add(_btnPicUpload);
		
		_img = new FlxSprite(0, 0);
		_img.antialiasing = true;
		add(_img);
		
		_showImage(new GraphicLogo(0, 0));
		*/
		super.create();
	}
	
	private function createUserStats():Void
	{
		var subBtnX:Int = 35;
		var addBtnX:Int =  195;
		var textX:Int = 60;
		var plus:String = "+";
		var sub:String = "-";
		
		_skillPointsText = new FlxText(textX, 270, 0, "Points Left: " + _skillPoints, 10);
		
		_usernameText = new FlxText(60, 100, 0, "Username:", 10);
		
		var _NGUserName:String = "";
		_NGUserName = API.username;
		
		_usernameInput = new FlxInputText(130, 100, 100, _NGUserName, 10);
		
		_animationSkillText = new FlxText(textX, 120, 0, "Animation Skill: " + Stats._animationLevel, 10);
		_artSkillText = new FlxText(textX, 145, 0, "Art Skill: " + Stats._artLevel, 10);
		_musicSkillText = new FlxText(textX, 170, 0, "Music Skill: " + Stats._musicLevel, 10);
		_programSkillText = new FlxText(textX, 195, 0, "Programming Skill: " + Stats._programLevel, 10);
		_voiceSkillText = new FlxText(textX, 220, 0, "Voice Acting Skill: " + Stats._voiceLevel, 10);
		_writingSkillText = new FlxText(textX, 245, 0, "Writing Skill: " + Stats._writingLevel, 10);
		
		_btnAnimationAdd = new FlxButtonPlus(addBtnX, 120, clickAddAnimation, plus, 20, 20);
		_btnArtAdd = new FlxButtonPlus(addBtnX, 145, clickAddArt, plus, 20, 20);
		_btnMusicAdd = new FlxButtonPlus(addBtnX, 170, clickAddMusic, plus, 20, 20);
		_btnProgramAdd = new FlxButtonPlus(addBtnX, 195, clickAddProgram, plus, 20, 20);
		_btnVoiceAdd = new FlxButtonPlus(addBtnX, 220, clickAddVoice, plus, 20, 20);
		_btnWritingAdd = new FlxButtonPlus(addBtnX, 245, clickAddWriting, plus, 20, 20);
		
		
		_btnAnimationSub = new FlxButtonPlus(subBtnX, 120, clickSubAnimation, "-", 20, 20);
		_btnArtSub =  new FlxButtonPlus(subBtnX, 145, clickSubArt, sub, 20, 20);
		_btnMusicSub = new FlxButtonPlus(subBtnX, 170, clickSubMusic, sub, 20, 20);
		_btnProgramSub = new FlxButtonPlus(subBtnX, 195, clickSubProgram, sub, 20, 20);
		_btnVoiceSub = new FlxButtonPlus(subBtnX, 220, clickSubVoice, sub, 20, 20);
		_btnWritingSub = new FlxButtonPlus(subBtnX, 245, clickSubWriting, sub, 20, 20);
		
		add(_skillPointsText);
		add(_usernameText);
		add(_usernameInput);
		
		add(_animationSkillText);
		add(_artSkillText);
		add(_musicSkillText);
		add(_programSkillText);
		add(_voiceSkillText);
		add(_writingSkillText);
		
		add(_btnAnimationAdd);
		add(_btnArtAdd);
		add(_btnMusicAdd);
		add(_btnProgramAdd);
		add(_btnVoiceAdd);
		add(_btnWritingAdd);
		
		add(_btnAnimationSub);
		add(_btnArtSub);
		add(_btnMusicSub);
		add(_btnProgramSub);
		add(_btnVoiceSub);
		add(_btnWritingSub);
	}
	/*
	private function createToolTips():Void
	{
		animationToolTip = new FlxUITooltip(100, 50);
		animationToolTip.body = "This is a tooltip";
		animationToolTip.show(_animationSkillText, "", "This is a tooltip");
		add(animationToolTip);
	}
	*/
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
	private function clickAddAnimation():Void
	{
		if(_skillPoints >= 1)
		{
			_skillPoints -= 1;
			Stats._animationLevel += 1;
		}
		
		updateText();
	}
	private function clickAddArt():Void
	{
		if(_skillPoints >= 1)
		{
			_skillPoints -= 1;
			Stats._artLevel += 1;
		}
		
		updateText();
	}
	
	private function clickAddMusic():Void
	{
		if(_skillPoints >= 1)
		{
			_skillPoints -= 1;
			Stats._musicLevel += 1;
		}
		
		updateText();
	}
	
	private function clickAddProgram():Void
	{
		if(_skillPoints >= 1)
		{
			_skillPoints -= 1;
			Stats._programLevel += 1;
		}
		
		updateText();
	}
	
	private function clickAddVoice():Void
	{
		if(_skillPoints >= 1)
		{
			_skillPoints -= 1;
			Stats._voiceLevel += 1;
		}
		
		updateText();
	}
	
	private function clickAddWriting():Void
	{
		if(_skillPoints >= 1)
		{
			_skillPoints -= 1;
			Stats._writingLevel += 1;
		}
		
		updateText();
	}
	
	
	
	
	
	private function clickSubAnimation():Void
	{
		if (Stats._animationLevel >= 1)
		{
			_skillPoints += 1;
			Stats._animationLevel -= 1;
		}
		updateText();
	}
	
	private function clickSubArt():Void
	{
		if (Stats._artLevel >= 1)
		{
			_skillPoints += 1;
			Stats._artLevel -= 1;
		}
		updateText();
	}
	
	private function clickSubMusic():Void
	{
		if (Stats._musicLevel >= 1)
		{
			_skillPoints += 1;
			Stats._musicLevel -= 1;
		}
		updateText();
	}
	
	private function clickSubProgram():Void
	{
		if (Stats._programLevel >= 1)
		{
			_skillPoints += 1;
			Stats._programLevel -= 1;
		}
		updateText();
	}
	
	private function clickSubVoice():Void
	{
		if (Stats._voiceLevel >= 1)
		{
			_skillPoints += 1;
			Stats._voiceLevel -= 1;
		}
		updateText();
	}
	
	private function clickSubWriting():Void
	{
		if (Stats._writingLevel >= 1)
		{
			_skillPoints += 1;
			Stats._writingLevel -= 1;
		}
		updateText();
	}
	
	
	
	private function updateText():Void
	{
		_animationSkillText.text = "Animation Skill: " + Stats._animationLevel;
		_artSkillText.text = "Art Skill: " + Stats._artLevel;
		_musicSkillText.text = "Music Skill: " + Stats._musicLevel;
		_programSkillText.text = "Programming Skill: " + Stats._programLevel;
		_voiceSkillText.text = "Voice Acting Skill: " + Stats._voiceLevel;
		_writingSkillText.text = "Writing Skill: " + Stats._writingLevel;
		
		_skillPointsText.text = "Points Left: " + _skillPoints;
	}
	
	private function clickNext():Void
	{
		var noName = ["NoNameMagee", "NamelessAndShameless", "Blanca", "InsertNameHere"];
		
		Stats._username = _usernameInput.text;
		if (Stats._username == "")
		{
			Stats._username = FlxG.random.getObject(noName);
			//API.unlockMedal("I need to PAY to change that now?!");
		}
		FlxG.log.add("Username is" + Stats._username);
		FlxG.switchState(new PlayState());
	}
	
	/*
	private function clickUpload():Void
	{
		var fr:FileReference = new FileReference();
		fr.addEventListener(Event.SELECT, _onSelect, false, 0, true);
		fr.addEventListener(Event.CANCEL, _onCancel, false, 0, true);
		var filters:Array<FileFilter> = new Array<FileFilter>();
		filters.push(new FileFilter("PNG Files", "*.png"));
		filters.push(new FileFilter("JPEG Files", "*.jpg;*.jpeg"));
		fr.browse();
		FlxG.log.add("clickUpload");
	}
	
	private function _onSelect(E:Event):Void
	{
		var fr:FileReference = cast(E.target, FileReference);
		_text.text = fr.name;
		fr.addEventListener(Event.COMPLETE, _onLoad, false, 0, true);
		fr.load();
		FlxG.log.add("_onSelect");
	}
	
	private function _onLoad(E:Event):Void
	{
		var fr:FileReference = E.target;
		fr.removeEventListener(Event.COMPLETE, _onLoad);

		var loader:Loader = new Loader();
		loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onImgLoad);
		loader.loadBytes(fr.data);
		FlxG.log.add("_onLoad");
	}
	
	private function _onImgLoad(E:Event):Void
	{
		var loaderInfo:LoaderInfo = E.target;
		loaderInfo.removeEventListener(Event.COMPLETE, _onImgLoad);
		var bmp:Bitmap = cast(loaderInfo.content, Bitmap);
		_showImage(bmp.bitmapData);
		FlxG.log.add("_onImgLoad");
	}
	
	private function _onCancel(_):Void
	{
		_text.text = "Cancelled!";
	}

	private function _showImage(Data:BitmapData):Void
	{
		var data2:BitmapData = _img.pixels.clone();
		var matrix:Matrix = new Matrix();
		matrix.identity();
		matrix.scale(1, 1);
		data2.fillRect(data2.rect, FlxColor.BLACK);
		data2.draw(Data, matrix, null, null, null, true);
		_img.pixels = data2;
		FlxG.log.add("_showImage");
	}
	*/
	
	
}