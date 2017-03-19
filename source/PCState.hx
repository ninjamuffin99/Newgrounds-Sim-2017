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
	private var _btnForum:FlxButton;
	
	private var _animationSkillText:FlxText;
	
	private var _statsSubState:StatsSubState;
	
	
	override public function create():Void 
	{
		createButtons();

		_statsSubState = new StatsSubState();
		
		_animationSkillText = new FlxText(40, 60, 0, "Animation Skill:" + Stats._animationSkill, 20);
		add(_animationSkillText);
		
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
	}
	
	private function clickAnimate():Void
	{
		Stats._animationSkill += 1;
		FlxG.log.add("Animation SKill = " + Stats._animationSkill);
		updateText();
	}
	
	private function updateText():Void
	{
		_animationSkillText.text = "Animation Skill: " + Std.string(Stats._animationSkill);
	}
	
	private function clickForum():Void
	{
		var forumSubState:SubState = new SubState();
		forumSubState.persistentDraw = false;
		forumSubState.persistentUpdate = false;
		openSubState(forumSubState);
	}
}