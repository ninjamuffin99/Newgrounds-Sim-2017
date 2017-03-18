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
	
	private var Stats:Stats;
	
	private var _animationSkillText:FlxText;
	
	override public function create():Void 
	{
		_btnAnimate = new FlxButton(20, 22, "Animate", clickAnimate);
		add(_btnAnimate);
		
		_btnForum = new FlxButton(30, 40, "Shitpost", clickForum);
		add(_btnForum);
		
		_animationSkillText = new FlxText(10, 20, 0, "Animation Skill:" + Stats._animationSkill, 20);
		add(_animationSkillText);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
	private function clickAnimate():Void
	{
		Stats._animationSkill += 1;
		FlxG.log.add(Stats._animationSkill);
		updateText();
	}
	
	private function updateText():Void
	{
		_animationSkillText.text = "Animation Skill:" + Std.string(Stats._animationSkill);
	}
	
	private function clickForum():Void
	{
		var forumSubState:SubState = new SubState();
		forumSubState.persistentDraw = false;
		forumSubState.persistentUpdate = false;
		openSubState(forumSubState);
	}
}