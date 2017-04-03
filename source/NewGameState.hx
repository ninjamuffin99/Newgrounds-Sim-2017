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
import flixel.addons.ui.FlxButtonPlus;
import flixel.addons.ui.FlxInputText;
import flixel.system.FlxAssets.GraphicLogo;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

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
	
	override public function create():Void 
	{
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
		var addBtnX:Int =  175;
		var textX:Int = 60;
		var plus:String = "+";
		var sub:String = "-";
		
		_skillPointsText = new FlxText(textX, 170, 0, "Points Left: " + _skillPoints, 10);
		
		_usernameText = new FlxText(60, 100, 0, "Username:", 10);
		
		_usernameInput = new FlxInputText(130, 100, 100, "", 10);
		
		_animationSkillText = new FlxText(textX, 120, 0, "Animation Skill: " + Stats._animationSkill, 10);
		_artSkillText = new FlxText(textX, 145, 0, "Art Skill: " + Stats._artSkill, 10);
		
		_btnAnimationAdd = new FlxButtonPlus(addBtnX, 120, clickAddAnimation, plus, 20, 20);
		_btnArtAdd = new FlxButtonPlus(addBtnX, 145, clickAddArt, plus, 20, 20);
		
		_btnAnimationSub = new FlxButtonPlus(subBtnX, 120, clickSubAnimation, "-", 20, 20);
		_btnArtSub =  new FlxButtonPlus(subBtnX, 145, clickSubArt, sub, 20, 20);
		
		add(_skillPointsText);
		add(_usernameText);
		add(_usernameInput);
		add(_animationSkillText);
		add(_artSkillText);
		add(_btnAnimationAdd);
		add(_btnArtAdd);
		add(_btnAnimationSub);
		add(_btnArtSub);
	}
	
	private function clickAddAnimation():Void
	{
		if(_skillPoints >= 1)
		{
			_skillPoints -= 1;
			Stats._animationSkill += 1;
		}
		
		updateText();
	}
	private function clickAddArt():Void
	{
		if(_skillPoints >= 1)
		{
			_skillPoints -= 1;
			Stats._artSkill += 1;
		}
		
		updateText();
	}
	
	private function clickSubAnimation():Void
	{
		if (Stats._animationSkill >= 1)
		{
			_skillPoints += 1;
			Stats._animationSkill -= 1;
		}
		updateText();
	}
	
	private function clickSubArt():Void
	{
		if (Stats._artSkill >= 1)
		{
			_skillPoints += 1;
			Stats._artSkill -= 1;
		}
		updateText();
	}
	
	private function updateText():Void
	{
		_animationSkillText.text = "Animation Skill: " + Stats._animationSkill;
		_artSkillText.text = "Art Skill: " + Stats._artSkill;
		
		_skillPointsText.text = "Points Left: " + _skillPoints;
	}
	
	private function clickNext():Void
	{
		Stats._username = _usernameInput.text;
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