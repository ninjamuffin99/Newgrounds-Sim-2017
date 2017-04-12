package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxUICheckBox;
import flixel.ui.FlxButton;
import source.Stats;

/**
 * ...
 * @author ...
 */
class NewGroundsState extends FlxState 
{
	private var _supporterMonthly:FlxUICheckBox;
	
	override public function create():Void 
	{
		_supporterMonthly = new FlxUICheckBox(FlxG.width * 0.3, FlxG.height * 0.3, null, null, "Monthly", 100, null, clickMonthly); 
		add(_supporterMonthly);
		
		super.create();
	}
	
	private function clickMonthly():Void
	{
		if (_supporterMonthly.checked)
		{
			
			FlxG.log.add("you are a supporter");
			Stats._supporters += 1;
		}
		else
		{
			
			FlxG.log.add("you are not a supporter");
			Stats._supporters -= 1;
		}
	}
	
}