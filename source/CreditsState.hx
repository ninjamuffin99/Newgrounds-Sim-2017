package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import com.newgrounds.*;
import com.newgrounds.components.*;

/**
 * Simple credits state, makes one giant FlxText, and scrolls it upwards
 * @author ...
 */
class CreditsState extends FlxState 
{
	private var _creds:FlxText;
	
	private var _btnBack:FlxButton;
	
	override public function create():Void 
	{
		_btnBack = new FlxButton(20, 20, "Back", clickBack);
		_btnBack.scrollFactor.y = 0;
		add(_btnBack);
		
		var _NGUserName:String = "";
		_NGUserName = API.username;
		
		if (_NGUserName != null)
		{
			_NGUserName = _NGUserName + ", yea I guess you too...\n";
		}
		else
		{
			_NGUserName = "";
		}
		
		var stringcreds:String = "Newgrounds Sim 2017" + "\n\n" + "A remake of AfroNinja's 'Newgrounds SIM'" + "\n\n" + "Made by Cameron Taylor / NinjaMuffin" + "\n" + "For Pico Day 2017" + "\n" + "Using HaxeFlixel, a Haxe framework based off of Adam Saltsman's AS3 'Flixel' Framework" + "\n" + "Programs used"  + "\n" + "Adobe Photoshop CC" + "\n" + "Adobe Animate and Flash CS6"  + "\n" + "FlashDevelop"  + "\n" +  "Github" + "\n\n" + "Special Thanks to these people! (In no particualar order)"  + "\n" + "GamePopper, for the Preloader tutorial and NG API stuff"  + "\n\n" + "The HaxeFlixel Foundation, for having a nice community for open sourcing HaxeFlixel"  + "\n\n" + "Matt Watson and Ryan Mcgee from SuperMega, Dalton, Emi, Jess, and Doop from LazyCast, Nick Robinson and Griffin McElroy from CoolGames Inc., Raygan Kelly, Laura Nash, Shane Kelly, and Nate (something, dont know how to spell your name) from TheShortGame Podcast, and SiIvaGunner for pleasing my ears and making me laugh while I work"  + "\n"; 
		var stringCreds2:String = "\n\n" + "Tom Fulp, for creating Newgrounds.com" + "\n\n" + "Nicky Case" + "\n" + "Edmund McMillen" + "\n" + "Tommy Refenes"  + "\n" + "Eric Barone" + "\n" + "Phil Fish"  + "\n" + "Jonathan Blow"  + "\n" + "Davey Wreden" + "\n\n" + "Tanner Monkman/Dmazes5, for being a cool dude" + "\n\n" + "Brett Procee, for also being a cool friendo." + "\n\n" + "The HIRO NO HIRO Youtube channel" + "\n\n";
		var stringCreds3:String =  "\n" + "Some cool schmoes from Newgrounds" + "\n" + "LarryNachos" + "\n" + "TheOverGhoul/LuckyLightTitan/whatever your name is currrently" + "\n" + "RealFaction" + "\n" + "Troisnyx" + "\n" + "4cat" + "\n" + "Saminat" + "\n" + "Moawling/Moawko" + "\n" + "TylerNG" + "\n" + "JustinWolf" + "\n" + "GNoodle/Graeme/2LeftThumbs" + "\n" + "NightRaid/StaticSkull (RIP DUDE LOL)" + "\n" + "ChazDude"  + "\n" + "Template88" + "\n" + "LucidShadowDreamer" + "\n" + "Ljnd" + "\n" + "SeafoamPanda" + "\n" + "StuffedWombat" + "\n" + "Butzbo" + "\n" + "Stamper" + "\n" + "MarcM/Sick Animation/RomeoJr" + "\n" + "Finn M-K" + "\n" + _NGUserName + "The SleepyCabin Crew (where the heck are the last five episodes??)" + "\n" + "JK-FlipFlop";
		_creds = new FlxText(0, 700, FlxG.width * 0.8, stringcreds + stringCreds2 + stringCreds3, 30);
		_creds.font = "assets/data/OpenSans-CondLight.ttf";
		_creds.screenCenter(X);
		add(_creds);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		var scrollSpeed:Float = 0.8;
		if (FlxG.keys.pressed.SHIFT)
		{
			scrollSpeed = scrollSpeed * 2;
		}
		if (FlxG.keys.anyPressed([W, UP]))
		{
			scrollSpeed = scrollSpeed * -1.2;
		}
		
		if (FlxG.keys.anyPressed([S, SPACE, DOWN]))
		{
			scrollSpeed = scrollSpeed * 3;
		}
		
		_creds.y -= scrollSpeed;
		
		if(_creds.y <= -2700)
		{
			FlxG.switchState(new PlayState());
			API.unlockMedal("Credits watcher");
		}
		
		FlxG.watch.add(_creds, "y");
		
		super.update(elapsed);
	}
	
	private function clickBack():Void
	{
		FlxG.switchState(new PlayState());
	}
	
}
