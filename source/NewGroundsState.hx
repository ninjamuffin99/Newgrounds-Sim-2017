package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUICheckBox;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import source.Stats;

/**
 * 
 * @author ...
 */
class NewGroundsState extends FlxState 
{
	private var bg:FlxSprite;
	private var _btnForum:FlxUIButton;
	private var _btnBaP:FlxUIButton;
	
	private var _supporterMonthly:FlxUICheckBox;
	private var _supporterYearly:FlxUICheckBox;
	
	private var _hud:HUD;
	private var _notif:Notifacations;
	
	override public function create():Void 
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/NGBG.png", false, 1280, 720);
		add(bg);
		
		_hud = new HUD();
		add(_hud);
		
		
		_supporterMonthly = new FlxUICheckBox(800, 616, null, null, "Monthly", 100, null, clickMonthly); 
		add(_supporterMonthly);
		
		_supporterYearly = new FlxUICheckBox(900, 616, null, null, "Yearly", 100, null, clickYearly);
		add(_supporterYearly);
		
		var featuredFont:String = "assets/data/FeaturedItem.ttf";
		
		var btnX:Int = 710;
		
		_btnForum = new FlxUIButton(btnX, 40, "BBS", clickForum);
		_btnForum.loadGraphic("assets/images/ButtonNoText.png", false, 342, 84);
		_btnForum.setLabelFormat(featuredFont, 60);
		add(_btnForum);
		
		_btnBaP = new FlxUIButton(btnX, 300, "Blam and Protect", clickBap);
		_btnBaP.loadGraphic("assets/images/ButtonNoText.png", false, 342, 84);
		_btnBaP.setAllLabelOffsets(0, 15);
		_btnBaP.setLabelFormat(featuredFont, 47);
		add(_btnBaP);
		
		_notif = new Notifacations();
		add(_notif);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.watch.addMouse();
		
		if (FlxG.keys.justPressed.S)
		{
			var StatsState:SubState = new SubState();
			StatsState.persistentDraw = false;
			StatsState.persistentUpdate = false;
			openSubState(StatsState);
		}
		
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new PCState());
		}
		
		Stats._isMonthly = _supporterMonthly.checked;
		Stats._isYearly = _supporterYearly.checked;
		
		super.update(elapsed);
	}
	
	private function clickMonthly():Void
	{
		if (_supporterMonthly.checked)
		{
			
			FlxG.log.add("you are a supporter");
			Stats._supporters += 1;
			_supporterYearly.checked = false;
			Stats._cash -= 3;
			Stats._supporterCountdown += 30;
		}
		else
		{
			
			FlxG.log.add("you are not a supporter");
			Stats._supporters -= 1;
		}
	}
	
	private function clickYearly():Void
	{
		if (_supporterYearly.checked)
		{
			
			FlxG.log.add("you are a supporter");
			Stats._supporters += 1;
			_supporterMonthly.checked = false;
			Stats._cash -= 25;
			Stats._supporterCountdown += 348;
		}
		else
		{
			
			FlxG.log.add("you are not a supporter");
			Stats._supporters -= 1;
		}
	}
	
	private function clickForum():Void
	{	
		FlxG.switchState(new ForumState());
	}

	private function clickBap():Void
	{
		//Stats.BAP();
		//carry overfrom Stats.hx so i can use the randomstuff
		var B:Int = 7;
		var P:Int = 5;
		
		if (Stats._stamina <= 7)
		{
			B = B - 4;
			P = P - 3;
		}
		if (Stats._stamina <= 0)
		{
			B = 0;
			P = 0;
		}
		
		B = FlxG.random.int(0, B);
		P = FlxG.random.int(0, P);
		
		_notif._newText(0, 0, "");
		_notif._newText(660, 270, "You blammed " + B + "flashes and protected " + P, 16, FlxColor.WHITE, 0.6);
		
		Stats._blams += B;
		Stats._protects += P;
		
		Stats._stamina -= 1;
		Stats.h += 1;
		
		_hud.updateHUD();
	}
	
}