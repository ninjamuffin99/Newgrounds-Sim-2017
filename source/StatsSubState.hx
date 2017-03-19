package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.util.FlxColor;

/**
 * ...
 * @author NInjaMuffin99
 */
class StatsSubState extends FlxSubState 
{
	private var _boxSprite:FlxSprite;
	
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		
	}
	
	override public function create():Void 
	{
		_boxSprite.makeGraphic(600, 300);
		_boxSprite.screenCenter();
		add(_boxSprite);
		
		FlxG.log.add("StatsSUbState opened");
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.S)
		{
			close();
		}
		
		super.update(elapsed);
	}
	
}