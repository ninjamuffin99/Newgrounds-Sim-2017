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
	
	private var _animationSkillText:FlxText;
	private var _artSkillText:FlxText;
	private var _flashSkillText:FlxText;
	private var _musicSkillText:FlxText;
	private var _programSkillText:FlxText;
	
	private var _animationQualityText:FlxText;
	
	
	
	private var _artPubbedText:FlxText;
	private var _artUnpubbedText:FlxText;
	
    public function new()
    {
        super();
		
		var outlineColor:FlxColor;
		outlineColor = new FlxColor();
		outlineColor.setRGB(90, 84, 84);
		
		var bgColor:FlxColor;
		bgColor = new FlxColor();
		bgColor.setRGB(54, 50, 50);
		
		bgOutline = new FlxSprite();
		bgOutline.makeGraphic(FlxG.width - 100, FlxG.height - 100, outlineColor);
		bgOutline.screenCenter();
		bgOutline.visible = false;
		
		bg = new FlxSprite();
		bg.makeGraphic(FlxG.width - 105, FlxG.height - 105, bgColor);
		bg.screenCenter();
		bg.visible = false;
		
		movieOutline = new FlxSprite(FlxG.width - 1201, FlxG.height - 651);
		movieOutline.makeGraphic(277, 252);
		movieOutline.visible = false;
		
		movieBG = new FlxSprite(FlxG.width - 1200, FlxG.height - 650);
		movieBG.makeGraphic(275, 250, FlxColor.RED);
		movieBG.visible = false;
		
		
		
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
		
		_hudTitle.visible = false;
		_animationSkillText.visible = false;
		_artSkillText.visible = false;
		_animationQualityText.visible = false;
		_flashSkillText.visible = false;
		_artPubbedText.visible = false;
		_artUnpubbedText.visible = false;
		_musicSkillText.visible = false;
		_programSkillText.visible = false;
		
		
		add(_hudTitle);
		add(_animationSkillText);
		add(_artSkillText);
		add(_animationQualityText);
		add(_flashSkillText);
		add(_artPubbedText);
		add(_artUnpubbedText);
		add(_musicSkillText);
		add(_programSkillText);
	}
	
	public function updateHUD():Void
    {
		
    }
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.justReleased.S)
		{
			bg.visible = !bg.visible;
			bgOutline.visible = !bgOutline.visible;
			movieBG.visible = !movieBG.visible;
			movieOutline.visible = !movieOutline.visible;
			
			_hudTitle.visible = !_hudTitle.visible;
			_animationQualityText.visible = !_animationQualityText.visible;
			_artSkillText.visible = !_artSkillText.visible;
			_animationSkillText.visible = !_animationSkillText.visible;
			_flashSkillText.visible = !_flashSkillText.visible;
			_artPubbedText.visible = !_artPubbedText.visible;
			_artUnpubbedText.visible = !_artUnpubbedText.visible;
			_musicSkillText.visible = !_musicSkillText.visible;
			_programSkillText.visible = !_programSkillText.visible;
			
			_statsVisible = !_statsVisible;
			FlxG.log.add(_statsVisible);
		}
	}
	
	public function updateText():Void
	{
		_animationSkillText.text = "Animation Skill: " + Stats._animationSkill;
		_artSkillText.text = "Art Skill: " + Stats._artSkill;
		_animationQualityText.text = "Animation Quality: " + Stats._animationQuality;
		_flashSkillText.text = "Flash Skill: " + Stats._flashSkill;
		_artPubbedText.text = "Published art: " + Stats._artPubbed;
		_artUnpubbedText.text = "Unpublished: " + Stats._artUnpubbed;
		_musicSkillText.text = "Music Skill: " + Stats._musicSkill;
	}
}