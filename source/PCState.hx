package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
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
	
	private var _animationSkillText:FlxText;
	private var _artSkillText:FlxText;
	private var _flashSkillText:FlxText;
	private var _animationQualityText:FlxText;
	
	private var _statsSubState:StatsSubState;
	
	
	override public function create():Void 
	{
		createButtons();
		createText();
		
		_statsSubState = new StatsSubState();
		
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.S)
		{
			openSubState(_statsSubState);
		}
		
		super.update(elapsed);
	}
	
	private function createButtons():Void
	{
		_btnAnimate = new FlxButton(20, 22, "Animate", clickAnimate);
		add(_btnAnimate);
		
		_btnForum = new FlxButton(30, 40, "Shitpost", clickForum);
		add(_btnForum);
		
		_btnDraw = new FlxButton(30, 60, "Draw", clickDraw);
		add(_btnDraw);
	}
	
	private function createText():Void
	{
		var textX:Int = 80;
		var textY:Int = 60;
		
		_animationSkillText = new FlxText(textX, textY, 0, "Animation Skill:" + Stats._animationSkill, 20);
		add(_animationSkillText);
		
		_artSkillText = new FlxText(textX, textY + 20, 0, "Art Skill:" + Stats._artSkill, 20);
		add(_artSkillText);
		
		_animationQualityText = new FlxText(textX, textY + 40, 0, "Animation Quality: " + Stats._animationQuality, 15);
		add(_animationQualityText);
		
		_flashSkillText = new FlxText(textX, textY + 60, 0, "Flash Skill: " + Stats._flashSkill, 15);
		add(_flashSkillText);
	}
	
	private function clickAnimate():Void
	{
		Stats._animationSkill += 1;
		Stats._artSkill += 0.5;
		Stats._flashSkill += 1;
		FlxG.log.add("Animation SKill = " + Stats._animationSkill);
		updateText();
	}
	
	private function updateText():Void
	{
		_animationSkillText.text = "Animation Skill: " + Stats._animationSkill;
		_artSkillText.text = "Art Skill: " + Stats._artSkill;
		_animationQualityText.text = "Animation Quality: " + Stats._animationQuality;
		_flashSkillText.text = "Flash Skill: " + Stats._flashSkill;
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
		FlxG.log.add("Art skill = " + Stats._artSkill);
		updateText();
	}
}