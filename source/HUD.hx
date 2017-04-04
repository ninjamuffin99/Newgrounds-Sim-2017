package;

 import flixel.FlxBasic;
 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.group.FlxGroup.FlxTypedGroup;
 import flixel.text.FlxText;
 import flixel.ui.FlxBar;
 import flixel.util.FlxColor;
 import source.Stats;
 using flixel.util.FlxSpriteUtil;
 

 class HUD extends FlxTypedGroup<FlxSprite>
 {
	 /*
    private var _sprBack:FlxSprite;
    private var _txtHealth:FlxText;
    private var _txtMoney:FlxText;
    private var _sprHealth:FlxSprite;
    private var _sprMoney:FlxSprite;
	*/
	private var _sprTime:FlxText;
	private var _textAMPM:FlxText;
	private var _usernameText:FlxText;
	private var _cashText:FlxText;
	
	private var _textDay:FlxText;
	private var _textMonth:FlxText;
	
	private var _healthBar:FlxBar;
	private var _healthBarText:FlxText;
	
    public function new()
    {
        super();
		
		var barcolor:FlxColor;
		
		barcolor = new FlxColor();
		barcolor.setRGB(235, 117, 34);
		
		var _orangebar:FlxSprite;
		_orangebar = new FlxSprite();
		_orangebar.makeGraphic(FlxG.width, 20, barcolor);
		add(_orangebar);
		
		
		_healthBar = new FlxBar(FlxG.width / 2, 3, LEFT_TO_RIGHT, 100, 10, Stats, "_stamina", 0, 24);
		add(_healthBar);
		
		
		_healthBarText = new FlxText(FlxG.width / 2, 20, 0);
		_healthBarText.text = _healthBar.percent + " Stamina";
		add(_healthBarText);
		
		var _whiteLine:FlxSprite;
		_whiteLine = new FlxSprite(0, 20);
		_whiteLine.makeGraphic(FlxG.width, 2, FlxColor.WHITE);
		add(_whiteLine);
		
		createText();
		
		/*
        _sprBack = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);
        _sprBack.drawRect(0, 19, FlxG.width, 1, FlxColor.WHITE);
        _txtHealth = new FlxText(16, 2, 0, "3 / 3", 8);
        _txtHealth.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
        _txtMoney = new FlxText(0, 2, 0, "0", 8);
        _txtMoney.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
        _sprHealth = new FlxSprite(4, _txtHealth.y + (_txtHealth.height/2)  - 4, AssetPaths.health__png);
        _sprMoney = new FlxSprite(FlxG.width - 12, _txtMoney.y + (_txtMoney.height/2)  - 4, AssetPaths.coin__png);
        _txtMoney.alignment = RIGHT;
        _txtMoney.x = _sprMoney.x - _txtMoney.width - 4;
        add(_sprBack);
        add(_sprHealth);
        add(_sprMoney);
        add(_txtHealth);
        add(_txtMoney);
		
		
        forEach(function(spr:FlxSprite)
        {
            spr.scrollFactor.set(0, 0);
        });
		*/
    }
	
	private function createText():Void
	{
		_sprTime = new FlxText(0, 0, 0, Std.string(Stats.h), 10);
		add(_sprTime);
		
		_textDay = new FlxText(40, 0, 0, Stats.dd + "/", 10);
		add(_textDay);
		
		_textMonth = new FlxText(60, 0, 0, Stats.mm + "/", 10);
		add(_textMonth);
		
		_textAMPM = new FlxText(12, 0, 0, Stats.AMPM, 10);
		add(_textAMPM);
		
		_usernameText = new FlxText(FlxG.width - 100, 0, 0, Stats._username, 10);
		add(_usernameText);
		
		_cashText = new FlxText(FlxG.width - 200, 0, 0, "Cash: " + Stats._cash, 10);
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
				FlxG.log.add("StatsAMPM = AM");
				Stats.dd += 1;
				Stats.PM = false;
			}
			else
			{
				Stats.AMPM = "PM";
				FlxG.log.add("StatsAMPM = PM");
				Stats.PM = true;
			}
		}
		
		if (Stats.dd >= 29)
		{
			Stats.dd = 1;
			Stats.mm += 1;
		}
		
		
		_sprTime.text = Std.string(Stats.h);
		_textAMPM.text = Stats.AMPM;
		_textDay.text = Stats.dd + "/";
		_textMonth.text = Stats.mm + "/";
		
		
		_cashText.text = "Cash: " + Stats._cash;
		
		_healthBar.value = Stats._stamina;
		_healthBarText.text = _healthBar.percent + " Stamina" ;
		
		/*
        _txtHealth.text = Std.string(Health) + " / 3";
        _txtMoney.text = Std.string(Money);
        _txtMoney.x = _sprMoney.x - _txtMoney.width - 4;
		*/
    }
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
}