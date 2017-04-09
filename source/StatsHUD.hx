package;

 import flixel.FlxBasic;
 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.group.FlxGroup.FlxTypedGroup;
 import flixel.text.FlxText;
 import flixel.tweens.FlxEase;
 import flixel.tweens.FlxTween;
 import flixel.util.FlxColor;
 import source.Stats;
 using flixel.util.FlxSpriteUtil;
 

 class StatsHUD extends FlxTypedGroup<FlxSprite>
 {
	private var bg:FlxSprite;
	private var bgOutline:FlxSprite;
	private var movieBG:FlxSprite;
	private var movieOutline:FlxSprite;
	
	private var _statsVisible:Bool = false;
	
	private var _hudTitle:FlxText;
	
	//BASE SKILLS TEXT
	private var _animationSkillText:FlxText;
	private var _artSkillText:FlxText;
	private var _flashSkillText:FlxText;
	private var _musicSkillText:FlxText;
	private var _programSkillText:FlxText;
	
	//LEVEL TEXT
	private var _animationLevelText:FlxText;
	private var _animationEXPText:FlxText;
	
	//QUALITY TEXT
	private var _animationQualityText:FlxText;
	private var _artQualityText:FlxText;
	
	private var _artPubbedText:FlxText;
	private var _artUnpubbedText:FlxText;
	
	
	//MISC STATS
	private var _fansText:FlxText;
	private var _blamText:FlxText;
	private var _protectText:FlxText;
	
	private var _moneyEarnedText:FlxText;
	private var _hoursWorkedText:FlxText;
	private var _daysPassedText:FlxText;
	
    public function new()
    {
        super();
		
		var outlineColor:FlxColor;
		outlineColor = new FlxColor();
		outlineColor.setRGB(0, 0, 0);
		
		var bgColor:FlxColor;
		bgColor = new FlxColor();
		bgColor.setRGB(76, 72, 72);
		
		bgOutline = new FlxSprite();
		bgOutline.makeGraphic(FlxG.width - 100, FlxG.height - 100, outlineColor);
		bgOutline.screenCenter();
		
		bg = new FlxSprite();
		bg.makeGraphic(FlxG.width - 105, FlxG.height - 105, bgColor);
		bg.screenCenter();
		
		movieOutline = new FlxSprite(FlxG.width - 1201, FlxG.height - 651);
		movieOutline.makeGraphic(277, 252);
		
		movieBG = new FlxSprite(FlxG.width - 1200, FlxG.height - 650);
		movieBG.makeGraphic(275, 250, FlxColor.RED);
		
		
		add(bgOutline);
		add(bg);
		add(movieOutline);
		add(movieBG);
		
		createText();
		
		//FlxTween.tween(this, { alpha: 1, y: 500 }, 0.33, { ease: FlxEase.circOut });
		
    }
	
	private function createText():Void
	{
		var textX:Int = FlxG.width - 1195;
		var textY:Int = 75;
		var textSize:Int = 15;
		var _animationEXP:Float = 100 - Stats._animationSkill;
		
		_hudTitle = new FlxText(FlxG.width / 2, FlxG.height / 2, 0, "Stats", 20);
		_hudTitle.screenCenter();
		_animationSkillText = new FlxText(textX, textY, 0, "Animation Skill:" + Stats._animationSkill, textSize);
		_artSkillText = new FlxText(textX, textY + 20, 0, "Art Skill:" + Stats._artSkill, textSize);
		_animationQualityText = new FlxText(textX, textY + 40, 0, "Animation Quality: " + Stats._animationQuality, textSize);
		_flashSkillText = new FlxText(textX, textY + 60, 0, "Flash Skill: " + Stats._flashSkill, textSize);
		_artPubbedText = new FlxText(FlxG.width / 2, FlxG.height - 670, 0, "Published art: " + Stats._artPubbed, textSize);
		_artUnpubbedText = new FlxText(FlxG.width / 2, FlxG.height - 655, 0, "Unpublished art: " + Stats._artUnpubbed, textSize);
		_musicSkillText = new FlxText(textX, textY + 80, 0, "Music Skill: " + Stats._musicSkill, textSize);
		_programSkillText = new FlxText(textX, textY + 100, 0, "Programming Skill: " + Stats._programSkill, textSize);
		
		_artQualityText = new FlxText(textX, textY + 220, 0, "Art Quality: " + Stats._artQuality, textSize);
		
		_animationLevelText = new FlxText(textX, textY + 180, 0, "Animation Level: " + Stats._animationLevel, textSize);
		_animationEXPText = new FlxText(textX, textY + 200, 0, "EXP until next level: " + _animationEXP);
		
		_moneyEarnedText = new FlxText(textX, textY + 120, 0, "Total Cash Earned: " + Stats._TotalCashEarned, textSize);
		_hoursWorkedText = new FlxText(textX, textY + 140, 0, "Total Hours Worked(At Job): " + Stats._TotalHoursWorked, textSize);
		_daysPassedText = new FlxText(textX, textY + 160, 0, "Total Days Passed: " + Stats._TotalDaysPassed, textSize);
		_fansText = new FlxText(textX, textY + 240, 0, "Fans: " + Stats._fans, textSize);
		_blamText = new FlxText(textX, textY + 260, 0, "Blams: " + Stats._blams, textSize);
		_protectText = new FlxText(textX, textY + 280, 0, "Protects: " + Stats._protects, textSize);
		
		
		add(_hudTitle);
		add(_animationSkillText);
		add(_artSkillText);
		add(_animationQualityText);
		add(_flashSkillText);
		add(_artPubbedText);
		add(_artUnpubbedText);
		add(_musicSkillText);
		add(_programSkillText);
		
		add(_artQualityText);
		
		add(_animationLevelText);
		add(_animationEXPText);
		
		add(_moneyEarnedText);
		add(_hoursWorkedText);
		add(_daysPassedText);
		
		
		add(_fansText);
		add(_blamText);
		add(_protectText);
		
	}
	
	public function updateHUD():Void
    {
		
    }
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (_statsVisible)
			updateText();
	}
	
	public function updateText():Void
	{
		var _animationEXP:Float = 100 - Stats._animationSkill;
		
		_animationSkillText.text = "Animation Skill: " + Stats._animationSkill;
		_artSkillText.text = "Art Skill: " + Stats._artSkill;
		_animationQualityText.text = "Animation Quality: " + Stats._animationQuality;
		_flashSkillText.text = "Flash Skill: " + Stats._flashSkill;
		_artPubbedText.text = "Published art: " + Stats._artPubbed;
		_artUnpubbedText.text = "Unpublished: " + Stats._artUnpubbed;
		_musicSkillText.text = "Music Skill: " + Stats._musicSkill;
		_programSkillText.text = "Programming Skill: " + Stats._programSkill;
		
		_artQualityText.text = "Art Quality: " + Stats._artQuality;
		
		_animationLevelText.text = "Animation Level: " + Stats._animationLevel;
		_animationEXPText.text = "EXP until next level: " + _animationEXP;
		
		_moneyEarnedText.text = "Total Cash Earned: " + Stats._TotalCashEarned;
		_hoursWorkedText.text = "Total Hours Worked(At Job): " + Stats._TotalHoursWorked;
		_daysPassedText.text = "Total Days Passed: " + Stats._TotalDaysPassed;
		_fansText.text = "Fans: " + Stats._fans;
		_blamText.text = "Blams: " + Stats._blams;
		_protectText.text = "Protects: " + Stats._protects;
	}
}