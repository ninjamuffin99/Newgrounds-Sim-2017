package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.addons.ui.FlxInputText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxSave;
import source.Stats;

class PlayState extends FlxState
{
	
	private var _btnPC:FlxButton;
	private var _btnSleep:FlxButton;
	private var _btnWork:FlxButton;
	private var _btnDraw:FlxButton;
	private var _btnStore:FlxButton;
	
	private var _hud:HUD;
	private var _statsHUD:StatsHUD;
	
	override public function create():Void
	{
		createButtons();
		
		_hud = new HUD();
		add(_hud);
		
		_statsHUD = new StatsHUD();
		_statsHUD.visible = false;
		add(_statsHUD);
		
		super.create();
	}
	
	private function createButtons():Void
	{
		var btnY:Int = 16;
		_btnPC = new FlxButton(0, btnY, "Log on", clickPC);
		add(_btnPC);
		
		_btnSleep = new FlxButton(20, btnY + 20, "Go to sleep", clickSleep);
		add(_btnSleep);
		
		_btnWork = new FlxButton(20, btnY + 40, "Work", clickWork);
		add(_btnWork);
		
		_btnDraw = new FlxButton(20, btnY + 60, "Draw", clickDraw);
		add(_btnDraw);
		
		_btnStore = new FlxButton(20, btnY + 85, "Store", clickStore);
		add(_btnStore);
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.S)
		{
			_statsHUD.visible = !_statsHUD.visible;
		}
		
		super.update(elapsed);
	}
	
	private function clickPC():Void
	{
		FlxG.switchState(new PCState());
	}
	
	private function clickSleep():Void
	{
		Stats.h += 8;
		Stats._stamina = 24;
		_hud.updateHUD();
		
		FlxG.save.data._animationSkill = Stats._animationSkill;
		FlxG.save.flush();
	}
	
	
	private function clickWork():Void
	{
		var _workable:Bool = false;
		if (Stats.h >= 8 && !Stats.PM)
		{
			_workable = true;
		}
		if (Stats.h >= 1 && Stats.h <= 5 && Stats.PM)
		{
			_workable = true;
		}
		
		if (Stats._stamina >= 10 && _workable)
		{
			Stats.addCash(65);
			Stats.addWorkHours(6);
			Stats._stamina -= 7;
			FlxG.log.add("Cash = " + Stats._cash);
		}
		if (Stats._stamina <= 9)
		{
			FlxG.log.add("You're too tired to work!");
		}
		
		_hud.updateHUD();
	}
	
	private function clickDraw():Void
	{
		Stats._artSkill += 1;
		FlxG.log.add("Art Skill = " + Stats._artSkill);
	}
	
	private function clickStore():Void
	{
		FlxG.switchState(new StoreState());
	}
}