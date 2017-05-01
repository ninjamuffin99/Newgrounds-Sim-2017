package;

 import flixel.FlxBasic;
 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.group.FlxGroup.FlxTypedGroup;
 import flixel.text.FlxText;
 import flixel.tweens.FlxEase;
 import flixel.tweens.FlxTween;
 import flixel.ui.FlxButton;
 import flixel.util.FlxColor;
 import source.Stats;
 using flixel.util.FlxSpriteUtil;
 

 class StatsHUD extends FlxTypedGroup<FlxSprite>
 {
	private var bg:FlxSprite;
	private var bgOutline:FlxSprite;
	private var movieBG:FlxSprite;
	private var movieOutline:FlxSprite;
	
	private var miscBG:FlxSprite;
	private var miscBG2:FlxSprite;
	
	private var _statsVisible:Bool = false;
	
	private var _hudTitle:FlxText;
	
	//BASE SKILLS TEXT
	private var _SkillText:FlxText;
	
	//LEVEL TEXT
	private var _LevelText:FlxText;
	private var _animationEXPText:FlxText;
	
	private var _artLevelText:FlxText;
	private var _artEXPText:FlxText;
	
	
	//QUALITY TEXT
	private var _animationQualityText:FlxText;
	private var _artQualityText:FlxText;
	
	private var _artPubbedText:FlxText;
	private var _artUnpubbedText:FlxText;
	
	
	//MISC STATS
	private var _ngStats:FlxText;
	private var _ngStatsString:String = "Fans: " + Stats._fans + "\n" + "Blams: " + Stats._blams + "\n" + "Protects: " + Stats._protects + "\n" + "Newgrounds Supporters: " + Stats._supporters + "\n" + "Newgrounds Supporter Earnings: " + Stats._ngCash;
	private var _miscStatsText:FlxText;
	
	//BUTTONS
	private var _reset:FlxButton;
	private var _myNG:FlxButton;
	private var _btnSource:FlxButton;
	
	//FOnt
	private var _font:String = "assets/data/ARIALBD.TTF";
	
    public function new()
    {
        super();
		
		var outlineColor:FlxColor;
		outlineColor = new FlxColor();
		outlineColor.setRGB(0, 0, 0);
		
		var bgColor:FlxColor;
		bgColor = new FlxColor();
		bgColor.setRGB(76, 72, 72);
		
		bgOutline = new FlxSprite(0, 50);
		bgOutline.makeGraphic(FlxG.width - 100, 354, outlineColor);
		bgOutline.screenCenter(X);
		
		bg = new FlxSprite(0, 52);
		bg.makeGraphic(FlxG.width - 105, 350, bgColor);
		bg.screenCenter(X);
		
		movieOutline = new FlxSprite(FlxG.width - 1201, FlxG.height - 651);
		movieOutline.makeGraphic(502, 157);
		
		movieBG = new FlxSprite(FlxG.width - 1200, FlxG.height - 650);
		movieBG.makeGraphic(500, 155, 0xFF9C3435);
		
		miscBG = new FlxSprite(FlxG.width - 1200, FlxG.height - 480);
		miscBG.makeGraphic(500, 140, 0xFFAB591F);
		
		miscBG2 = new FlxSprite(650, FlxG.height - 650);
		miscBG2.makeGraphic(500, 185, 0xFF9858AF);
		
		//BUTTONS
		createLinks();
		
		
		add(bgOutline);
		add(bg);
		add(movieOutline);
		add(movieBG);
		add(miscBG);
		add(miscBG2);
		add(_reset);
		add(_myNG);
		add(_btnSource);
		
		createText();
    }
	
	private function createText():Void
	{
		var textX:Int = FlxG.width - 1195;
		var textY:Int = 75;
		var textSize:Int = 20;
		var _animationEXP:Float = 100 - Stats._animationSkill;
		var _artEXP:Float = 100 - Stats._artSkill;
		var arialBLD:String = "assets/data/ARIALBD.TTF";
		
		_hudTitle = new FlxText(FlxG.width / 2, FlxG.height / 2, 0, "Stats", 20);
		_hudTitle.screenCenter();
		
		
		_SkillText = new FlxText(textX, textY, 0, "Animation Skill:" + Stats._animationSkill + "\n" + "Art Skill:" + Stats._artSkill + "\n" + "Music Skill: " + Stats._musicSkill + "\n" + "Programming Skill: " + Stats._programSkill + "\n" + "Voice Acting Skill: " + Stats._voiceSkill + "\n" + "Writing Skill: " + Stats._writingSkill, textSize);
		_SkillText.font = arialBLD;
		
		_animationQualityText = new FlxText(textX, textY + 80, 0, "Animation Quality: " + Stats._animationQuality, textSize);
		
		
		_artPubbedText = new FlxText(FlxG.width / 2, FlxG.height - 670, 0, "Published art: " + Stats._artPubbed, textSize);
		
		
		
		_artQualityText = new FlxText(textX, textY + 220, 0, "Art Quality: " + Stats._artQuality, textSize);
		
		_LevelText = new FlxText(textX + 275, textY, 0, "Animation Level: " + Stats._animationLevel + "\n" + "Art Level: " + Stats._artLevel + "\n" + "Music Level: " + Stats._musicLevel + "\n" + "Programming Level: " + Stats._programLevel + "\n" + "Voice Acting Level: " + Stats._voiceLevel + "\n" + "Writing Level: " + Stats._writingLevel, textSize);
		_LevelText.font = arialBLD;
		
		
		_ngStats = new FlxText(textX, 250, 0, _ngStatsString, textSize);
		_ngStats.font = arialBLD;
		
		_miscStatsText = new FlxText(660, 70, 0, "Total Cash Earned: " + Stats._TotalCashEarned + "\n" + "Total Days Passed: " + Stats._TotalDaysPassed + "\n" + "Total Hours:" + "\n" + " Animating: " + Stats._TotalHoursAnimating + "\n" + " Programming: " + Stats._TotalHoursProgramming + "\n" + " Making Music: " + Stats._TotalHoursMakingMusic + "\n" + " Drawing: " + Stats._TotalHoursDrawing + "\n" + " Worked(At Job): " + Stats._TotalHoursWorked, textSize);
		_miscStatsText.font = arialBLD;
		
		add(_hudTitle);
		add(_SkillText);
		//add(_artPubbedText);
		
		add(_LevelText);
		
		add(_miscStatsText);
		add(_ngStats);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.S)
		{
			this.visible = !this.visible;
			updateText();
		}
		
		super.update(elapsed);
	}
	
	public function updateText():Void
	{
		var _animationEXP:Float = 100 - Stats._animationSkill;
		var _artEXP:Float = 100 - Stats._artSkill;
		
		_SkillText.text = "Animation Skill:" + Stats._animationSkill + "\n" + "Art Skill:" + Stats._artSkill + "\n" + "Music Skill: " + Stats._musicSkill + "\n" + "Programming Skill: " + Stats._programSkill + "\n" + "Voice Acting Skill: " + Stats._voiceSkill + "\n" + "Writing Skill: " + Stats._writingSkill;
		_animationQualityText.text = "Animation Quality: " + Stats._animationQuality;
		_artPubbedText.text = "Published art: " + Stats._artPubbed;
		
		_animationQualityText.text = "Animation Quality: " + Stats._animationQuality;
		_artQualityText.text = "Art Quality: " + Stats._artQuality;
		
		_LevelText.text = "Animation Level: " + Stats._animationLevel + "\n" + "Art Level: " + Stats._artLevel + "\n" + "Music Level: " + Stats._musicLevel + "\n" + "Programming Level: " + Stats._programLevel + "\n" + "Voice Acting Level: " + Stats._voiceLevel + "\n" + "Writing Level: " + Stats._writingLevel;
		_animationEXPText.text = "EXP until next level: " + _animationEXP;
		
		_artLevelText.text = "Art Level: " + Stats._artLevel;
		_artEXPText.text = "EXP until next level: " + _artEXP;
		
		_miscStatsText.text = "Total Cash Earned: " + Stats._TotalCashEarned + "\n" + "Total Days Passed: " + Stats._TotalDaysPassed + "\n" + "Total Hours:" + "\n" + " Animating: " + Stats._TotalHoursAnimating + "\n" + " Programming: " + Stats._TotalHoursProgramming + "\n" + " Making Music: " + Stats._TotalHoursMakingMusic + "\n" + " Drawing: " + Stats._TotalHoursDrawing + "\n" + " Worked(At Job): " + Stats._TotalHoursWorked;
		_ngStats.text = _ngStatsString;
	}
	
	public function createLinks():Void
	{
		var X:Int = 680;
		var Y:Int = 300;
		
		_reset = new FlxButton(X, Y + 20, "Return To Title", clickReset);
		
		X += 95;
		
		_myNG = new FlxButton(X, Y, "", clickMyNG);
		_myNG.loadGraphic("assets/images/NG_LOGO.png", false, 64, 64);
		
		X += 85;
		
		_btnSource = new FlxButton(X, Y, "", clickSource);
		_btnSource.loadGraphic("assets/images/GitHub-Mark-Light-64px.png", false, 64, 64);
	}
	
	//BUTTON STUFF
	private function clickReset():Void
	{
		FlxG.resetGame();
	}
	
	private function clickMyNG():Void
	{
		FlxG.openURL("http://ninjamuffin99.newgrounds.com/");
	}
	
	private function clickSource():Void
	{
		FlxG.openURL("https://github.com/ninjamuffin99/Newgrounds-Sim-2017");
	}
}