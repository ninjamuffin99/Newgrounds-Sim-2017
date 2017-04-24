package;

import flixel.FlxG;
import flixel.FlxSprite;
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
	private var bg:FlxSprite;
	
	private var _btnForum:FlxButton;
	private var _btnBaP:FlxButton;
	
	private var _supporterMonthly:FlxUICheckBox;
	
	private var _hud:HUD;
	private var _statsHUD:StatsHUD;
	
	override public function create():Void 
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/NGBG.png", false, 1280, 720);
		add(bg);
		
		_hud = new HUD();
		add(_hud);
		
		_statsHUD = new StatsHUD();
		_statsHUD.visible = false;
		add(_statsHUD);
		
		_supporterMonthly = new FlxUICheckBox(FlxG.width * 0.3, FlxG.height * 0.3, null, null, "Monthly", 100, null, clickMonthly); 
		add(_supporterMonthly);
		
		_btnForum = new FlxButton(700, 40, "Shitpost", clickForum);
		add(_btnForum);
		
		_btnBaP = new FlxButton(700, 300, "Blam and Protect", clickBap);
		add(_btnBaP);
		
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
	
	private function clickForum():Void
	{
		var forumSubState:SubState = new SubState();
		forumSubState.persistentDraw = false;
		forumSubState.persistentUpdate = false;
		openSubState(forumSubState);
	}
	
	
	private function clickBap():Void
	{
		Stats.BAP();
		Stats._stamina -= 1;
		Stats.h += 1;
		
		_hud.updateHUD();
		_statsHUD.updateText;
	}
	
	
}