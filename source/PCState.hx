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
import openfl.filters.ConvolutionFilter;
import source.Stats;

/**
 * ...
 * @author 
 */
class PCState extends FlxState 
{
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
	
	private var _statsSubState:StatsSubState;
	private var _hud:HUD;
	private var _statsHUD:StatsHUD;
	
	private var _notifacations:Notifacations;
	
	
	override public function create():Void 
	{
		_hud = new HUD();
		add(_hud);
		
		createButtons();
		createText();
		
		createBars();
		
		_statsHUD = new StatsHUD();
		_statsHUD.visible = false;
		add(_statsHUD);
		
		_statsSubState = new StatsSubState();
		
		_notifacations = new Notifacations();
		add(_notifacations);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.O)
		{
			_notifacations._animationSKillUp();
		}
		
		if (FlxG.keys.justPressed.S)
		{
			_statsHUD.visible = !_statsHUD.visible;
		}
		
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new PlayState());
		}
		
		
		if (Stats._artProgress >= 100)
		{
			Stats._artProgress = 0;
			Stats.artEXP(10);
			Stats._artUnpubbed += 1;
			updateText();
			Stats.artPost(0);
		}
		
		if (Stats._songProgress >= 100)
		{
			Stats.musicEXP(15);
			Stats._songProgress = 0;
			Stats.musicPost(0);
		}
		
		if (Stats._animationProgress >= 100)
		{
			Stats.animationEXP(20);
			Stats.artEXP(10);
			Stats._animationProgress = 0;
			Stats.animationPost(0);
		}
		
		if (Stats._gameProgress >= 100)
		{
			Stats.programEXP(50);
			Stats._gameProgress = 0;
			Stats.gamePost(0);
		}
		
		//PUBLISHED CHECKS
		if (Stats._animationUnpubbed >= 1)
		{
			_btnPostAnimation.visible = true;
		}
		else
		{
			_btnPostAnimation.visible = false;
		}
		
		if (Stats._artUnpubbed >= 1)
		{
			_btnPostArt.visible = true;
		}
		else
		{
			_btnPostArt.visible = false;
		}
		
		FlxG.watch.add(Stats, "_animationNames");
		
		super.update(elapsed);
	}
	
	private function createButtons():Void
	{
		var buttonX:Int = 30;
		
		_btnAnimate = new FlxButton(buttonX, 22, "Animate", clickAnimate);
		add(_btnAnimate);
		
		_btnForum = new FlxButton(buttonX, 40, "Shitpost", clickForum);
		add(_btnForum);
		
		_btnDraw = new FlxButton(buttonX, 60, "Draw", clickDraw);
		add(_btnDraw);
		
		_btnMusic = new FlxButton(buttonX, 600, "Make Music", clickMusic);
		add(_btnMusic);
		
		_btnProgram = new FlxButton(buttonX, 90, "Program", clickProgram);
		add(_btnProgram);
		
		_btnVoice = new FlxButton(buttonX, 120, "Voice Act", clickVoice);
		add(_btnVoice);
		
		_btnWrite = new FlxButton(buttonX, 150, "Write", clickWrite);
		add(_btnWrite);
		
		_btnPostAnimation = new FlxButton(buttonX + 190, 50, "Post Animation", clickPostAnimation);
		_btnPostAnimation.visible = false;
		add(_btnPostAnimation);
		
		_btnPostArt = new FlxButton(buttonX + 190, 60, "Post", clickPost);
		_btnPostArt.visible = false;
		add(_btnPostArt);
		
		_btnBaP = new FlxButton(buttonX, 300, "Blam and Protect", clickBap);
		add(_btnBaP);
		
		_btnBack = new FlxButton(buttonX, 500, "Back", clickBack);
		add(_btnBack);
		
		_btnNG = new FlxButton(buttonX, 450, "Newgrounds", clickNG);
		add(_btnNG);
	}
	
	private function createText():Void
	{
		var textX:Int = FlxG.width - 250;
		var textY:Int = 60;
		var textSize:Int = 15;
		
		_artProgressText = new FlxText(textX, textY + 80, 0, "Artwork Progress: " + Stats._artProgress + "%", textSize);
		
		
		add(_artProgressText);
		
	}
	
	private function createBars():Void
	{
		_animationProgressBar = new FlxBar(300, 50, LEFT_TO_RIGHT, 100, 10, Stats, "_animationProgress");
		add(_animationProgressBar);
		
		_artProgressBar = new FlxBar(300, 80, LEFT_TO_RIGHT, 100, 10, Stats, "_artProgress");
		add(_artProgressBar);
		
		_programProgressBar = new FlxBar(300, 100, LEFT_TO_RIGHT, 100, 10, Stats, "_gameProgress");
		add(_programProgressBar);
		
		_songProgressBar = new FlxBar(300, 150, LEFT_TO_RIGHT, 100, 10, Stats, "_songProgress");
		add(_songProgressBar);
	}
	
	private function updateText():Void
	{
		_artProgressText.text = "Artwork Progress: " + Stats._artProgress + "%";
	}
	
	private function clickAnimate():Void
	{
		if (Stats._animationProgress == 0)
		{
			_nameBox.visible = true;
			_animationName.visible = true;
			_btnAnimationBegin.visible = true;
		}
		
		if (Stats._stamina >= 1)
		{
			Stats.animationEXP(1);
			Stats.artEXP(0.5);
			Stats._stamina -= 1;
			Stats._flashSkill += 0.5;
			Stats.h += 1;
			Stats.animationProgress(2.5);
		}
		
		updateText();
		_hud.updateHUD();
		_statsHUD.updateText();
	}
	
	private function clickMusic():Void
	{
		if (Stats._stamina >= 1)
		{
			Stats.musicEXP(5);
			Stats._stamina -= 1;
			Stats.h += 1;
			Stats.songProgress(10);
		}
		
		updateText();
		_hud.updateHUD();
		_statsHUD.updateText();
	}
	
	private function clickForum():Void
	{
		var forumSubState:SubState = new SubState();
		forumSubState.persistentDraw = false;
		forumSubState.persistentUpdate = false;
		openSubState(forumSubState);
	}
	
	private function clickDraw():Void
	{
		if (Stats._stamina >= 1)
		{
			Stats.artEXP(1);
			Stats._artProgress += 20;
			Stats.h += 1;
			Stats._stamina -= 1;
		}
		
		
		if (Stats._stamina <= 0)
		{
			FlxG.log.add("You're too tired!");
		}
		
		_hud.updateHUD();
		updateText();
		_statsHUD.updateText();
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
		}
		
		
		FlxG.log.add("program skill = " + Stats._programSkill);
		
		if (Stats._stamina <= 0)
		{
			FlxG.log.add("You're too tired!");
		}
		
		_hud.updateHUD();
		updateText();
		_statsHUD.updateText();
	}
	
	private function clickVoice():Void
	{
		if (Stats._stamina >= 1)
		{
			Stats.voiceEXP(1);
			Stats.h += 1;
			Stats._stamina -= 1;
		}
		
		
		_hud.updateHUD();
		updateText();
		_statsHUD.updateText();
	}
	
	private function clickWrite():Void
	{
		if (Stats._stamina >= 1)
		{
			Stats.writingEXP(1);
			Stats.h += 1;
			Stats._stamina -= 1;
		}
		_hud.updateHUD();
		updateText();
		_statsHUD.updateText();
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
	
	private function clickBap():Void
	{
		Stats.BAP();
		Stats._stamina -= 1;
		Stats.h += 1;
		
		_hud.updateHUD();
		updateText();
		_statsHUD.updateText;
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