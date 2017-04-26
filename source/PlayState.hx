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
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import source.Stats;
import com.newgrounds.*;

class PlayState extends FlxState
{
	private var bg:FlxSprite;
	
	private var _btnPC:FlxButton;
	private var _btnSleep:FlxButton;
	private var _btnWork:FlxButton;
	private var _btnDraw:FlxButton;
	private var _btnStore:FlxButton;
	
	private var _hud:HUD;
	private var _statsHUD:StatsHUD;
	private var _notifacations:Notifacations;
	
	override public function create():Void
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/BG.png", false, 1280, 720);
		add(bg);
		
		createButtons();
		
		_hud = new HUD();
		add(_hud);
		
		_statsHUD = new StatsHUD();
		_statsHUD.visible = false;
		add(_statsHUD);
		
		_notifacations = new Notifacations();
		add(_notifacations);
		
		super.create();
	}
	
	private function createButtons():Void
	{
		var btnY:Int = 16;
		_btnPC = new FlxButton(340, 256, "Log on", clickPC);
		_btnPC.loadGraphic("assets/images/Desk.png", true, 512, 271);
		_btnPC.updateHitbox();
		add(_btnPC);
		
		_btnSleep = new FlxButton(118, 160, "", clickSleep);
		_btnSleep.loadGraphic("assets/images/BedDoor.png", false, 202, 524);
		_btnSleep.updateHitbox();
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
		FlxG.watch.addMouse();
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
		
		Stats.save();
		_notifacations._newText(40, 40, "Game Saved and slept for 8 hours", 10, FlxColor.BLACK, 0.25, "assets/sounds/save.wav");
		
		if (Stats._ngCash >= 7000 && Stats._animationLevel >= 20 && !Stats._sponsoredProject //also eventually make it so you have to have so many fans to get sponsored)
		{
			var _randomSponsor:Int;
			_randomSponsor = FlxG.random.int(0, Std.int(Stats._animationLevel * 1.3));
			if (_randomSponsor >= 20)
			{
				Stats._sponsoredProject = true;
				_notifacations._newText(400, 400, "Your animation has been Sponsored! \n Finish it to receive bonus money!", 20, FlxColor.BLACK, 2.25);
				API.unlockMedal("Basically working at Disney now");
			}
			else
			{
				FlxG.log.add("Your animation has not been sponsored yet");
			}
		}
		
		else if (Stats._sponsoredProject)
		{
			FlxG.log.add("already sponsored!");
		}
		
		else if (Stats._ngCash < 7000)
		{
			FlxG.log.add("no NG CASH");
		}
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