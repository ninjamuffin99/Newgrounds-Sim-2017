package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUIDropDownMenu;
import source.Stats;

/**
 * ...
 * @author 
 */
class PCState extends FlxState 
{
	private var _btnAnimate:FlxButton;
	private var _btnDraw:FlxButton;
	private var _btnForum:FlxButton;
	private var _btnBack:FlxButton;
	
	private var _animationSkillText:FlxText;
	private var _artSkillText:FlxText;
	private var _flashSkillText:FlxText;
	private var _animationQualityText:FlxText;
	private var _artProgressText:FlxText;
	
	private var _animationUsingText:FlxText;
	private var _artUsingText:FlxText;
	
	private var _statsSubState:StatsSubState;
	private var _hud:HUD;
	
	override public function create():Void 
	{
		_hud = new HUD();
		add(_hud);
		
		createButtons();
		createText();
		createDropDowns();
		
		_statsSubState = new StatsSubState();
		
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.S)
		{
			openSubState(_statsSubState);
		}
		
		if (Stats._artProgress >= 100)
		{
			Stats._artProgress = 0;
			Stats._artSkill += 10;
			updateText();
		}
		
		super.update(elapsed);
	}
	
	private function createDropDowns():Void
	{
		var dropdownX:Int = 155;
		
		var _animationPrograms:Array<String> = 
				["Flash CS6", "Animate CC", "OpenToonz", "ToonBoom Harmony"];
				
		var _animationDropDown = new FlxUIDropDownMenu(dropdownX, 22, FlxUIDropDownMenu.makeStrIdLabelArray(_animationPrograms, true));
		
		var _artPrograms:Array<String> =
				["MS Paint", "Flash MX 2004", "Krita", "Photoshop CC", "Aseprite", "Gimp"];
		
		var _artDropDown = new FlxUIDropDownMenu(dropdownX, 60, FlxUIDropDownMenu.makeStrIdLabelArray(_artPrograms, true));
		
		_animationUsingText = new FlxText(dropdownX - 40, 22, 0, "Using:", 10);
		_artUsingText = new FlxText(dropdownX - 40, 64, 0, "Using:", 10);
		
		
		add(_animationUsingText);
		add(_artUsingText);
		
		
		add(_artDropDown);
		add(_animationDropDown);
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
		
		_btnBack = new FlxButton(buttonX, 500, "Back", clickBack);
		add(_btnBack);
	}
	
	private function createText():Void
	{
		var textX:Int = FlxG.width - 250;
		var textY:Int = 60;
		var textSize:Int = 15;
		
		_animationSkillText = new FlxText(textX, textY, 0, "Animation Skill:" + Stats._animationSkill, textSize);
		_artSkillText = new FlxText(textX, textY + 20, 0, "Art Skill:" + Stats._artSkill, textSize);
		_animationQualityText = new FlxText(textX, textY + 40, 0, "Animation Quality: " + Stats._animationQuality, textSize);
		_flashSkillText = new FlxText(textX, textY + 60, 0, "Flash Skill: " + Stats._flashSkill, textSize);
		_artProgressText = new FlxText(textX, textY + 80, 0, "Artwork Progress: " + Stats._artProgress + "%", textSize);
		
		add(_animationSkillText);
		add(_artSkillText);
		add(_animationQualityText);
		add(_flashSkillText);
		add(_artProgressText);
	}
	
	private function clickAnimate():Void
	{
		Stats._animationSkill += 1;
		Stats._artSkill += 0.5;
		Stats._flashSkill += 0.5;
		FlxG.log.add("Animation SKill = " + Stats._animationSkill);
		updateText();
	}
	
	private function updateText():Void
	{
		_animationSkillText.text = "Animation Skill: " + Stats._animationSkill;
		_artSkillText.text = "Art Skill: " + Stats._artSkill;
		_animationQualityText.text = "Animation Quality: " + Stats._animationQuality;
		_flashSkillText.text = "Flash Skill: " + Stats._flashSkill;
		_artProgressText.text = "Artwork Progress: " + Stats._artProgress + "%";
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
		Stats._artSkill += 1;
		Stats._artProgress += 20;
		Stats.h += 1;
		FlxG.log.add("Art skill = " + Stats._artSkill);
		_hud.updateHUD();
		updateText();
	}
	
	private function clickBack():Void
	{
		FlxG.switchState(new PlayState());
	}
	
	private function onAnimationChange():Void
	{
		
	}
	
	
}