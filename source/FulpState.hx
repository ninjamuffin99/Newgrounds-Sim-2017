package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import com.newgrounds.*;

/**
 * ...
 * @author ninjaMuffin
 */
class FulpState extends FlxState 
{
	private var Timer:Float = 27;

	override public function create():Void 
	{
		var BG:FlxSprite;
		BG = new FlxSprite(0, 0);
		BG.loadGraphic("assets/images/tomfulpcoe.jpg", false, 630, 1200);
		add(BG);
		
		FlxG.sound.playMusic("assets/music/mynamatom.mp3");
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		Timer -= elapsed;
		
		if (Timer <= 0)
		{
			API.unlockMedal("Fulp'd");
			FlxG.sound.playMusic("assets/music/1683_newgrounds_lhm__e.mp3");
			FlxG.switchState(new PlayState());
		}
	}
}