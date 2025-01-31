package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * A simple class that makes a  little popup text (NOTE: There seems to be a bug when you call _newText() for the first time
 * to fix it I just call _newtext() in create, with no words
 * @author ...
 */
class Notifacations extends FlxTypedGroup<FlxSprite>
{
	private var _animationSkillUp:FlxText;
	
	public function new() 
	{
		super();
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.watch.add(Notifacations, "_numOfTExts");
		
		super.update(elapsed);
	}
	
	public function _newText(X:Int = 40, Y:Int = 40, Text:String = "Placeholder", Size:Int = 10, color:FlxColor = FlxColor.BLACK, delay:Float = 0.5, sound:String = null, formating:Bool = true):Void
	{
		var _notif:FlxText;
		_notif = new FlxText(X, Y, 0, Text, Size);
		_notif.color = color;
		_notif.font = "assets/data/ARIALBD.TTF";
		add(_notif);
		/*
		if (formating)
		{
			var format = new FlxTextFormat(0x000000, false, false, 0x9B6900);
			_notif.addFormat(format);
		}
		*/
		
		//Plays a sound if defined in parameters
		FlxG.sound.play(sound);
		
		//This is the tween that fades it out and up
		FlxTween.tween(_notif, { alpha: 0, y: _notif.y - 16}, 0.66, { ease:FlxEase.circOut, startDelay: delay}); 
	}
}
