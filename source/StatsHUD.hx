package;

 import flixel.FlxBasic;
 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.group.FlxGroup.FlxTypedGroup;
 import flixel.text.FlxText;
 import flixel.util.FlxColor;
 import source.Stats;
 using flixel.util.FlxSpriteUtil;
 

 class StatsHUD extends FlxTypedGroup<FlxSprite>
 {
	private var bg:FlxSprite;
	private var bgOutline:FlxSprite;
	private var _statsVisible:Bool = false;
	
	private var _animationSkillText:FlxText;
	private var _artSkillText:FlxText;
	private var _flashSkillText:FlxText;
	private var _animationQualityText:FlxText;
	
    public function new()
    {
        super();
		
		var outlineColor:FlxColor;
		outlineColor = new FlxColor();
		outlineColor.setRGB(79, 40, 14);
		
		var bgColor:FlxColor;
		bgColor = new FlxColor();
		bgColor.setRGB(157, 79, 24);
		
		bgOutline = new FlxSprite();
		bgOutline.makeGraphic(FlxG.width - 100, FlxG.height - 100, outlineColor);
		bgOutline.screenCenter();
		bgOutline.visible = false;
		
		bg = new FlxSprite();
		bg.makeGraphic(FlxG.width - 105, FlxG.height - 105, bgColor);
		bg.screenCenter();
		bg.visible = false;
		
		add(bgOutline);
		add(bg);
		
		createText();
		
    }
	
	private function createText():Void
	{
		var textX:Int = FlxG.width - 250;
		var textY:Int = 60;
		var textSize:Int = 15;
		
		_animationSkillText = new FlxText(textX, textY, 0, "Animation Skill:" + Stats._animationSkill, textSize);
		_artSkillText = new FlxText(textX, textY + 20, 0, "Art Skill:" + Stats._artSkill, textSize);
		_animationQualityText = new FlxText(textX, textY + 40, 0, "Animation Quality: " + Stats._animationQuality, textSize);
		_flashSkillText = new FlxText(textX, textY + 60, 0, "Flash Skill: " + Stats._flashSkill, textSize);
		_artProgressText = new FlxText(textX, textY + 80, 0, "Artwork Progress: " + Stats._artProgress + "%", textSize);
		
		_animationSkillText.visible = false;
		_artSkillText.visible = false;
		
		add(_animationSkillText);
		add(_artSkillText);
		add(_animationQualityText);
		add(_flashSkillText);
	}
	
	public function updateHUD():Void
    {
		
    }
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		
		
		if (FlxG.keys.justPressed.S)
		{
			bg.visible = !bg.visible;
			bgOutline.visible = !bgOutline.visible;
			
			_statsVisible = !_statsVisible;
			FlxG.log.add(_statsVisible);
		}
	}
}