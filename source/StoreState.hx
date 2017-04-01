package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.ui.FlxButton;
import source.Stats;

/**
 * ...
 * @author ninjaMuffin
 */
class StoreState extends FlxState 
{
	private var _hud:HUD;
	
	private var _btnBuyFlash:FlxButtonPlus;
	private var _btnBuyClipStudio:FlxButtonPlus;
	
	private var _btnBack:FlxButton;
	
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
		
		_btnBuyClipStudio = new FlxButtonPlus(20, 50, clickBuyClipStudio, "Buy Clip Studio Paint $50", 100, 30);
		add(_btnBuyClipStudio);
		
		_btnBack = new FlxButton(20, 100, "Back", clickBack);
		add(_btnBack);
	}
	
	private function buyFlash():Void
	{
		if (Stats._cash >= 699)
		{
			Stats._cash -= 699;
			_hud.updateHUD();
			Stats._hasFlash = true;
		}
		
		FlxG.log.add(Stats._hasFlash);
	}
	
	private function clickBuyClipStudio():Void
	{
		if (Stats._cash >= 50)
		{
			Stats._cash -= 50;
			_hud.updateHUD();
			Stats._hasClipStudio = true;
		}
	}
	
	private function clickBack():Void
	{
		FlxG.switchState(new PlayState());
	}
}