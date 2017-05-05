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
	
	private var _hud:HUD;
	private var _notifacations:Notifacations;
	
	private var _hints:FlxText;
	
	override public function create():Void
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/BG.png", false, 1280, 720);
		add(bg);
		
		createButtons();
		
		_hud = new HUD();
		add(_hud);
		
		_notifacations = new Notifacations();
		add(_notifacations);
		
		
		_hints = new FlxText(1000, 600, 0, "Press S to bring up stats\nEscape to return to the previous screen\nEvery month you'll lose 1400$ \nfor monthly bills and whatnot\nThese hints can be turned of in the options", 14);
		_hints.font = "assets/data/ARIALBD.TTF";
		_hints.color = FlxColor.BLACK;
		add(_hints);
		
		
		if (Stats._loadFade)
		{
			FlxG.camera.fade(FlxColor.BLACK, 0.5, true);
			Stats._loadFade = false;
		}
		
		super.create();
	}
	
	private function createButtons():Void
	{
		var btnY:Int = 16;
		_btnPC = new FlxButton(340, 235, "", clickPC);
		_btnPC.loadGraphic("assets/images/Desk.png", true, 512, 302);
		_btnPC.updateHitbox();
		add(_btnPC);
		
		_btnSleep = new FlxButton(118, 160, "", clickSleep);
		_btnSleep.loadGraphic("assets/images/BedDoor.png", false, 202, 525);
		_btnSleep.updateHitbox();
		add(_btnSleep);
		
		_btnWork = new FlxButton(973, 157, "", clickWork);
		_btnWork.loadGraphic("assets/images/WorkDoor.png", false, 258, 329);
		add(_btnWork);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		
		if (FlxG.keys.justPressed.S)
		{
			var StatsState:SubState = new SubState();
			StatsState.persistentDraw = false;
			StatsState.persistentUpdate = false;
			openSubState(StatsState);
		}
		
		_hints.visible = Stats._hintsON;
		
		FlxG.watch.addMouse();
		FlxG.watch.add(Stats, "h");
		FlxG.watch.add(Stats, "AMPM");
		
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
		_notifacations._newText(110, 150, "Game Saved and slept for 8 hours", 15, FlxColor.BLACK, 0.25, "assets/sounds/save.wav");
		
		sponsoredStuff();
		
		API.postScore("Rankings: Fans", Stats._fans);
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
		if (Stats.h == 12 && Stats.PM)
		{
			_workable = true;
		}
		
		if (Stats._stamina >= 10 && _workable)
		{
			Stats.addCash(65);
			Stats.addWorkHours(6);
			Stats._stamina -= 7;
			
			_notifacations._newText(1000, 130, "You earned 65 dollars!", 15, FlxColor.BLACK, 0.5);
		}
		if (Stats._stamina <= 9 && _workable)
		{
			_notifacations._newText(1000, 130, "You're too tired to work!", 15, FlxColor.BLACK, 0.5);
		}
		
		if (!_workable)
		{
			_notifacations._newText(1000, 130, "You only work between 8AM and 5PM", 15, FlxColor.BLACK, 0.5);
		}
		
		_hud.updateHUD();
	}
	
	private function sponsoredStuff():Void
	{
		if (Stats._ngCash >= 7000 && Stats._fans >= 50) //also eventually make it so you have to have so many fans to get sponsored)
		{
			var _randomSponsor:Int;
			
			var notifX:Int = 400;
			var notifY:Int = 600;
			
			if (Stats._animationLevel >= 20)
			{
				_randomSponsor = FlxG.random.int(0, Std.int(Stats._animationLevel * 1.3));
				if (_randomSponsor >= 20 && !Stats._sponsoredAnimation)
				{
					Stats._sponsoredAnimation = true;
					_notifacations._newText(notifX, notifY, "Your animation has been Sponsored! \n Finish it to receive bonus money!", 20, FlxColor.BLACK, 2.25);
					API.unlockMedal("Basically working at Disney now");
				}
				else
				{
					FlxG.log.add("Your animation has not been sponsored yet");
				}
			}
			
			if (Stats._programLevel >= 15 && !Stats._sponsoredGame)
			{
				_randomSponsor = FlxG.random.int(0, Std.int(Stats._programLevel * 1.3));
				
				if (_randomSponsor >= 20)
				{
					Stats._sponsoredGame = true;
					_notifacations._newText(notifX, notifY, "Your game has been Sponsored! \n Finish it to receive bonus money!", 20, FlxColor.BLACK, 2.25);
					//API.unlockMedal("Basically working at Disney now");
				}
				else
				{
					FlxG.log.add("Your game has not been sponsored yet");
				}
			}
			
			if (Stats._musicLevel >= 15 && !Stats._sponsoredSong)
			{
				_randomSponsor = FlxG.random.int(0, Std.int(Stats._musicLevel * 1.3));
				
				if (_randomSponsor >= 15)
				{
					Stats._sponsoredSong = true;
					Stats._soundTrackAmount = FlxG.random.int(5, 10);
					
					_notifacations._newText(notifX, notifY, "You have been commisioned to do a soundtrack for a game \nfinish " + Stats._soundTrackAmount + " songs to recieve money!", 20, FlxColor.BLACK, 2.25);
					API.unlockMedal("Fire mixtape");
				}
				else
				{
					FlxG.log.add("Your song has not been sponsored yet");
				}
			}
			
		}
		
		else if (Stats._ngCash < 7000)
		{
			FlxG.log.add("no NG CASH");
		}
	}
}