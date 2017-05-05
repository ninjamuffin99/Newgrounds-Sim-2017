package;

 import flixel.FlxBasic;
 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.FlxState;
 import flixel.addons.ui.FlxUICheckBox;
 import flixel.group.FlxGroup.FlxTypedGroup;
 import flixel.text.FlxText;
 import flixel.ui.FlxBar;
 import flixel.ui.FlxButton;
 import flixel.util.FlxColor;
 import source.Stats;
 import com.newgrounds.*;
 import com.newgrounds.components.*;
 using flixel.util.FlxSpriteUtil;
 
/*
* The bar at the top of the screen, also manages time and date stuff.
*
*
*/

 class HUD extends FlxTypedGroup<FlxSprite>
 {
	
	private var _sprTime:FlxText;
	private var _textAMPM:FlxText;
	private var _usernameText:FlxText;
	private var _cashText:FlxText;
	
	private var _textDay:FlxText;
	private var _textMonth:FlxText;
	
	private var _healthBar:FlxBar;
	private var textColor:FlxColor;
	
	
	private var dim:FlxSprite;
	private var bg:FlxSprite;
	private var _txtSound:FlxText;
	private var _txtOldSound:FlxUICheckBox;
	private var _hints:FlxUICheckBox;
	private var _btnCred:FlxButton;
	
    public function new()
    {
        super();
		
		textColor = new FlxColor();
		textColor.setRGB(235, 117, 34);
		
		var barcolor:FlxColor;
		
		barcolor = new FlxColor();
		//235, 117, 34 is orange
		barcolor.setRGB(25, 21, 21);
		
		var _orangebar:FlxSprite;
		_orangebar = new FlxSprite();
		_orangebar.makeGraphic(FlxG.width, 24, barcolor);
		add(_orangebar);
		
		
		_healthBar = new FlxBar(FlxG.width / 2, 3, LEFT_TO_RIGHT, 100, 10, Stats, "_stamina", 0, 24);
		_healthBar.createColoredEmptyBar(0xFFA44F0F);
		_healthBar.createColoredFilledBar(textColor);
		add(_healthBar);
		
		var _whiteLine:FlxSprite;
		_whiteLine = new FlxSprite(0, 24);
		_whiteLine.makeGraphic(FlxG.width, 2, FlxColor.ORANGE);
		add(_whiteLine);
		
		var profile:FlxSprite;
		profile = new FlxSprite(FlxG.width * 0.28, 0);
		profile.loadGraphic("assets/images/defaultProfilePic.jpg", false, 356, 356);
		profile.setGraphicSize(20, 20);
		profile.updateHitbox();
		add(profile);
		
		var gear:FlxButton;
		gear = new FlxButton(FlxG.width * 0.9, 2, "", clickGear);
		gear.loadGraphic("assets/images/gear.png", false, 26, 20);
		add(gear);
		
		createText();
		
		createGearPopup();
    }
	
	private function createText():Void
	{
		var textFont:String = "assets/data/ARIALBD.TTF";
		
		_sprTime = new FlxText(0, 0, 0, Std.string(Stats.h), 15);
		_sprTime.font = textFont;
		add(_sprTime);
		
		_textDay = new FlxText(40, 0, 0, Stats.dd + "/", 15);
		_textDay.font = textFont;
		add(_textDay);
		
		_textMonth = new FlxText(65, 0, 0, Stats.mm + "/", 15);
		_textMonth.font = textFont;
		add(_textMonth);
		
		_textAMPM = new FlxText(15, 0, 0, Stats.AMPM, 15);
		_textAMPM.font = textFont;
		add(_textAMPM);
		
		var staminaText:FlxText;
		staminaText = new FlxText(577, 0, 0, "Stamina:", 12);
		staminaText.font = "assets/data/ARIALBD.TTF";
		staminaText.color = textColor;
		add(staminaText);
		
		_usernameText = new FlxText(FlxG.width * 0.3, 0, 0, Stats._username, 13);
		_usernameText.font = "assets/data/ARIALBD.TTF";
		_usernameText.color = textColor;
		add(_usernameText);
		
		_cashText = new FlxText(FlxG.width - 200, 0, 0, "Cash: " + Stats._cash, 13);
		_cashText.font = textFont;
		_cashText.color = textColor;
		add(_cashText);
		
	}
	
	public function updateHUD():Void
    {
		if (Stats.h >= 12)
		{
			if (Stats.h >= 13)
			{
				Stats.h -= 12;
			}
			
			if (Stats.PM)
			{
				Stats.AMPM = "AM";
				Stats.addDay(1);
				Stats.PM = false;
				Stats.updateSupporters(FlxG.random.int(2, 10));
				
			}
			else
			{
				Stats.AMPM = "PM";
				Stats.PM = true;
			}
		}
		
		if (Stats.dd >= 29)
		{
			Stats.dd = 1;
			Stats.mm += 1;
			Stats._cash -= 1400;
		}
		
		
		_sprTime.text = Std.string(Stats.h);
		_textAMPM.text = Stats.AMPM;
		_textDay.text = Stats.dd + " /";
		_textMonth.text = Stats.mm + " /";
		
		
		_cashText.text = "Cash: " + Stats._cash;
		
		_healthBar.value = Stats._stamina;
		
		
    }
	
	override public function update(elapsed:Float):Void 
	{
		/*if (FlxG.keys.justPressed.S)
		{
			var StatsState:SubState = new SubState();
			StatsState.persistentDraw = false;
			StatsState.persistentUpdate = false;
			openSubState(StatsState);
		}*/
		
		super.update(elapsed);
	}
	
	private function clickGear():Void
	{
		dim.visible = !dim.visible;
		bg.visible = !bg.visible;
		_txtSound.visible = !_txtSound.visible;
		_txtOldSound.visible = !_txtOldSound.visible;
		_btnCred.visible = !_btnCred.visible;
		_hints.visible = !_hints.visible;
	}
	
	private function createGearPopup():Void
	{
		
		dim = new FlxSprite();
		dim.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		dim.alpha = 0.35;
		//add(dim); 
		
		bg = new FlxSprite(1030, 30);
		bg.makeGraphic(180, 125, FlxColor.BLACK);
		add(bg);
		
		_txtSound = new FlxText(1050, 40, 170, "Use + and - to change volume!", 14);
		_txtSound.font = "assets/data/ARIALBD.TTF";
		add(_txtSound);
		
		_txtOldSound = new FlxUICheckBox(1050, 80, null, null, "Compressed sound(old school baby)", 100, null, clickOld);
		_txtOldSound.checked = Stats._shitLoop;
		add(_txtOldSound);
		
		_hints = new FlxUICheckBox(1050, 110, null, null, "Hints", 100, null, clickHints);
		_hints.checked = Stats._hintsON;
		add(_hints);
		
		_btnCred = new FlxButton(1050, 135, "Credits", clickCredits);
		add(_btnCred);
		
		
		dim.visible = false;
		bg.visible = false;
		_txtSound.visible = false;
		_txtOldSound.visible = false;
		_hints.visible = false;
		_btnCred.visible = false;
	}
	
	private function clickCredits():Void
	{
		FlxG.switchState(new CreditsState());
	}
	
	private function clickHints():Void
	{
		if (_hints.checked)
		{
			Stats._hintsON = true;
		}
		else
		{
			Stats._hintsON = false;
		}
	}
	
	private function clickOld():Void
	{
		if (_txtOldSound.checked)
		{
			
			FlxG.log.add("shitty");
			FlxG.sound.playMusic("assets/music/SHITLOOP.mp3");
			Stats._shitLoop = true;
		}
		else
		{
			
			FlxG.log.add("new song");
			FlxG.sound.playMusic("assets/music/1683_newgrounds_lhm__e.mp3");
			Stats._shitLoop = false;
		}
	}
}
