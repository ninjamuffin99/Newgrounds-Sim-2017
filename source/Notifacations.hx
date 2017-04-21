package;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author ...
 */
class Notifacations extends FlxTypedGroup<FlxSprite>
{
	private var _animationSkillUp:FlxText;
	
	public function new() 
	{
		super();
		
		_animationSkillUp = new FlxText(0, 0, 0, "Animation Skill Increased", 10);
		
	}
	
	public function _animationSKillUp():Void
	{
		add(_animationSkillUp);
		FlxTween.tween(this, { alpha: 0}, .33, { ease: FlxEase.circOut});
	}
}