package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.ui.FlxInputText;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUIDropDownMenu;
import flixel.util.FlxColor;
import openfl.filters.ConvolutionFilter;
import source.Stats;

/**
 * ...
 * @author 
 */
class PCState extends FlxState 
{
	private var _bg:FlxSprite;
	
	private var _btnAnimate:FlxButton;
	private var _btnDraw:FlxButton;
	private var _btnMusic:FlxButton;
	private var _btnForum:FlxButton;
	private var _btnProgram:FlxButton;
	private var _btnVoice:FlxButton;
	private var _btnWrite:FlxButton;
	private var _btnBack:FlxButton;
	private var _btnNG:FlxButton;
	
	
	private var _btnPostAnimation:FlxButton;
	private var _btnPostArt:FlxButton;
	
	private var _btnBaP:FlxButton;
	
	//Progress things
	private var _artProgressText:FlxText;
	private var _animationProgressBar:FlxBar;
	private var _artProgressBar:FlxBar;
	private var _programProgressBar:FlxBar;
	private var _songProgressBar:FlxBar;
	
	private var _nameBox:FlxSprite;
	private var _animationName:FlxInputText;
	private var _btnAnimationBegin:FlxButton;
	
	private var _usingText:FlxText;
	
	private var _hud:HUD;
	
	private var _notifacations:Notifacations;
	
	
	override public function create():Void 
	{
		_bg = new FlxSprite(0, 0);
		_bg.loadGraphic("assets/images/PCBG.png", false, 1280, 720);
		add(_bg);
		
		_hud = new HUD();
		add(_hud);
		
		createButtons();
		createText();
		
		createBars();
		
		_notifacations = new Notifacations();
		add(_notifacations);
		
		
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.watch.add(Stats, "h");
		
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new PlayState());
		}
		
		if (FlxG.keys.justPressed.S)
		{
			var StatsState:SubState = new SubState();
			StatsState.persistentDraw = false;
			StatsState.persistentUpdate = false;
			openSubState(StatsState);
		}
		
		
		if (Stats._artProgress >= 100)
		{
			Stats._artProgress = 0;
			Stats.artEXP(10);
			Stats._artUnpubbed += 1;
			updateText();
			Stats.artPost(0);
			
			_notifacations._newText(320, 50, "Your artwork has been posted to Newgrounds!", 10, FlxColor.ORANGE, 0.7);
		}
		
		if (Stats._songProgress >= 100)
		{
			Stats.musicEXP(15);
			Stats._songProgress = 0;
			Stats.musicPost(0);
			
			
			if (Stats._sponsoredSong)
			{
				Stats._cash += 100;
				Stats._soundTrackAmount -= 1;
				
				if (Stats._soundTrackAmount == 0)
				{
					Stats._fans += FlxG.random.int(30, 70);
					
					Stats._sponsoredSong = false;
				}
			}
			
			_notifacations._newText(120, 140, "Your song has been posted to Newgrounds!");
			
		}
		
		if (Stats._animationProgress >= 100)
		{
			Stats.animationEXP(20);
			Stats.artEXP(10);
			Stats._animationProgress = 0;
			Stats.animationPost(0);
			
			if (Stats._sponsoredAnimation)
			{
				var sponsoredCash:Int;
				sponsoredCash = Stats._ngCash - 5000;
				sponsoredCash = Std.int(sponsoredCash / 2);
				
				FlxG.log.add(sponsoredCash);
				Stats._cash += sponsoredCash;
				Stats._fans += FlxG.random.int(30, 70);
				
				Stats._sponsoredAnimation = false;
				
				_hud.updateHUD();
			}
			
			_notifacations._newText(120, 40, "Your animation has been posted to Newgrounds!");
		}
		
		if (Stats._gameProgress >= 100)
		{
			Stats.programEXP(50);
			Stats._gameProgress = 0;
			Stats.gamePost(0);
			
			if (Stats._sponsoredGame)
			{
				var sponsoredCash:Int;
				sponsoredCash = Stats._ngCash - 5000;
				sponsoredCash = Std.int(sponsoredCash / 2);
				
				FlxG.log.add(sponsoredCash);
				Stats._cash += sponsoredCash;
				Stats._fans += FlxG.random.int(30, 70);
				
				Stats._sponsoredGame = false;
				
				_hud.updateHUD();
			}
			
			_notifacations._newText(320, 150, "Your game has been posted to Newgrounds!");
		}
		
		FlxG.watch.add(Stats, "_animationNames");
		FlxG.watch.addMouse();
		
		super.update(elapsed);
	}
	
	private function createButtons():Void
	{
		var buttonX:Int = 35;
		var buttonY:Int = 35;
		
		_btnAnimate = new FlxButton(buttonX, buttonY, "", clickAnimate);
		_btnAnimate.loadGraphic("assets/images/animate.png", false, 89, 93);
		add(_btnAnimate);
		
		buttonX += 200;
		
		_btnDraw = new FlxButton(buttonX, buttonY, "", clickDraw);
		_btnDraw.loadGraphic("assets/images/PS.png", false, 78, 108);
		add(_btnDraw);
		
		buttonX -= 200;
		buttonY += 100;
		
		_btnMusic = new FlxButton(buttonX, buttonY, "", clickMusic);
		_btnMusic.loadGraphic("assets/images/fl.png", false, 96, 94);
		add(_btnMusic);
		
		buttonX += 200;
		
		
		_btnProgram = new FlxButton(buttonX, buttonY, "", clickProgram);
		_btnProgram.loadGraphic("assets/images/fd.png", false, 71, 93);
		add(_btnProgram);
		
		buttonX += 80;
		
		_btnVoice = new FlxButton(buttonX, 120, "Voice Act", clickVoice);
		//add(_btnVoice);
		
		_btnWrite = new FlxButton(buttonX, 150, "Write", clickWrite);
		//add(_btnWrite);
		
		_btnBack = new FlxButton(buttonX, 500, "Back", clickBack);
		add(_btnBack);
		
		_btnNG = new FlxButton(buttonX, 300, "", clickNG);
		_btnNG.loadGraphic("assets/images/internet.png", false, 82, 93);
		add(_btnNG);
	}
	
	private function createText():Void
	{
		
	}
	
	private function createBars():Void
	{
		var barX:Int = 120;
		var barY:Int = 60;
		
		_animationProgressBar = new FlxBar(barX, barY, LEFT_TO_RIGHT, 100, 10, Stats, "_animationProgress");
		_animationProgressBar.createColoredEmptyBar(0xff222020, true, FlxColor.BLACK);
		_animationProgressBar.createColoredFilledBar(0xFF9C3435);
		add(_animationProgressBar);
		
		_artProgressBar = new FlxBar(barX + 200, barY, LEFT_TO_RIGHT, 100, 10, Stats, "_artProgress");
		_artProgressBar.createColoredEmptyBar(0xff222020, true, FlxColor.BLACK);
		_artProgressBar.createColoredFilledBar(0xFFA84178);
		add(_artProgressBar);
		
		barY += 100;
		
		_programProgressBar = new FlxBar(barX + 200, barY, LEFT_TO_RIGHT, 100, 10, Stats, "_gameProgress");
		_programProgressBar.createColoredFilledBar(0xff275D8B);
		_programProgressBar.createColoredEmptyBar(0xff222020, true, FlxColor.BLACK);
		add(_programProgressBar);
		
		_songProgressBar = new FlxBar(barX, barY, LEFT_TO_RIGHT, 100, 10, Stats, "_songProgress");
		_songProgressBar.createColoredEmptyBar(0xff222020, true, FlxColor.BLACK);
		_songProgressBar.createColoredFilledBar(0xFF406B23);
		add(_songProgressBar);
		
		//COLORS
		/*
		 grey: 34, 32, 32 0x222020
		 bklue: 39, 93, 139
		 red: 156, 52, 53
		 green: 64, 107, 35
		 pink/art : 168, 65, 120
		 
		 0x275D8B
		  
		*/
	}
	
	private function updateText():Void
	{
		_artProgressText.text = "Artwork Progress: " + Stats._artProgress + "%";
	}
	
	private function clickAnimate():Void
	{
		if (Stats._stamina >= 1)
		{
			Stats.animationEXP(1);
			Stats.artEXP(0.5);
			Stats._stamina -= 1;
			Stats._flashSkill += 0.5;
			Stats.h += 1;
			Stats.animationProgress(2.5);
			
			updateText();
			_hud.updateHUD();
		}
		
		
	}
	
	private function clickMusic():Void
	{
		if (Stats._stamina >= 1)
		{
			Stats.musicEXP(5);
			Stats._stamina -= 1;
			Stats.h += 1;
			Stats.songProgress(7);
			
			updateText();
			_hud.updateHUD();
		}
	}
	
	
	
	private function clickDraw():Void
	{
		if (Stats._stamina >= 1)
		{
			Stats.artEXP(1);
			Stats._artProgress += 20;
			Stats.h += 1;
			Stats._stamina -= 1;
			
			_hud.updateHUD();
			updateText();
		}
		
		
		if (Stats._stamina <= 0)
		{
			FlxG.log.add("You're too tired!");
		}
		
		
	}
	
	private function clickProgram():Void
	{
		if (Stats._stamina >= 1)
		{
			Stats.programEXP(1);
			Stats.gameProgress(5);
			//Stats._artProgress += 20;
			Stats.h += 1;
			Stats._stamina -= 1;
			
			_hud.updateHUD();
			updateText();
		}
		
		
		FlxG.log.add("program skill = " + Stats._programSkill);
		
		if (Stats._stamina <= 0)
		{
			FlxG.log.add("You're too tired!");
		}
		
		
	}
	
	private function clickVoice():Void
	{
		if (Stats._stamina >= 1)
		{
			Stats.voiceEXP(1);
			Stats.h += 1;
			Stats._stamina -= 1;
			
			_hud.updateHUD();
			updateText();
		}
	}
	
	private function clickWrite():Void
	{
		if (Stats._stamina >= 1)
		{
			Stats.writingEXP(1);
			Stats.h += 1;
			Stats._stamina -= 1;
			
			
			_hud.updateHUD();
			updateText();
		}
		
	}
	
	private function clickPostAnimation():Void
	{
		Stats.animationPost(0);
		
		Stats._animationPubbed += Stats._animationUnpubbed;
		Stats._animationUnpubbed = 0;
	}
	
	//posts art
	private function clickPost():Void
	{
		
		Stats.artPost(0);
		
		Stats._artPubbed += Stats._artUnpubbed;
		Stats._artUnpubbed = 0;
	}
	
	private function clickBack():Void
	{
		FlxG.switchState(new PlayState());
	}
	
	private function clickNG():Void
	{
		FlxG.switchState(new NewGroundsState());
	}
	
	private function beginAnimation():Void
	{
		Stats._animationNames.push(_animationName.text);
		_nameBox.visible = false;
		_animationName.visible = false;
		_btnAnimationBegin.visible = false;
		FlxG.log.add("press begin");
	}
}