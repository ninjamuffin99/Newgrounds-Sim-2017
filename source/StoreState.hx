package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import source.Stats;

/**
 * ...
 * @author ninjaMuffin
 */
class StoreState extends FlxState 
{
	private var _hud:HUD;
	
	private var _btnBuyFlash:FlxButtonPlus;
	
	override public function create():Void 
	{
		_hud = new HUD();
		add(_hud);
		
		createButtons();
		
		super.create();
	}
	
	private function createButtons():Void
	{
		_btnBuyFlash = new FlxButtonPlus(20, 20, buyFlash, "Buy Flash CS6 $699");
		add(_btnBuyFlash);
	}
	
	private function buyFlash():Void
	{
		Stats._hasFlash = true;
		FlxG.log.add(_hasFlash);
	}
	
	public function new() 
	{
		
	}
	
}