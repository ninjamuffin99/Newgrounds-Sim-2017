package;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Notifacations extends FlxTypedGroup<FlxSprite>
{
	private var _animationSkillUp:FlxText;
	private var _savedGame:FlxText;
	
	public function new() 
	{
		super();
		
		//SKiills
		_animationSkillUp = new FlxText(0, 0, 0, "Animation Skill Increased", 10);
		
		//GameSaves
		_savedGame = new FlxText(0, 200, 0, "Game Saved", 15);
		_savedGame.alpha = 0;
		_savedGame.color = FlxColor.BLACK;
		add(_savedGame);
	}
	
	public function _animationSKillUp():Void
	{
		add(_animationSkillUp);
		FlxTween.tween(_animationSkillUp, { alpha: 0}, .66, { ease: FlxEase.circOut, startDelay: 1});
	}
	
	public function _saveText():Void
	{
		_savedGame.alpha = 1;
		FlxTween.tween(_savedGame, { alpha: 0, y: _savedGame.y - 16}, 0.66, { ease:FlxEase.circOut, startDelay: 0.3});
	}
}