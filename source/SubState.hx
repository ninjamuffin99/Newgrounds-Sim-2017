package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.text.FlxTypeText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

/**
 * ...
 * @author 
 */
class SubState extends FlxSubState 
{
	private var bg:FlxSprite;
	
	private var _title:FlxTypeText;
	private var _post:FlxTypeText;
	
	private var _btnShitpost:FlxButton;
	private var _btnAdvice:FlxButton;
	private var _btnClose:FlxButton;

	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
	}
	
	override public function create():Void 
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/BBSblurred.png");
		add(bg);
		
		createButtons();
		
		var wordsX:Int = 220;
		
		_title = new FlxTypeText(wordsX, 88, FlxG.width, "Who is the cutest NG user?", 12);
		_title.font = "assets/data/ARIALBD.TTF";
		_title.cursorCharacter = "|";
		_title.color = FlxColor.BLACK;
		add(_title);
		
		_post = new FlxTypeText(wordsX, 240, FlxG.width - 50, "I think Tom is a cutie pie #BringBackBeardFulp", 12);
		_post.cursorCharacter = "|";
		_post.color = FlxColor.BLACK;
		_post.font = "assets/data/ARIALBD.TTF";
		add(_post);
		
		super.create();
	}
	
	private function createButtons():Void
	{
		var btnX:Int = 600;
		
		_btnShitpost = new FlxButton(btnX, 250, "Shitpost on the BBS", clickShitpost);
		_btnShitpost.scale.y = _btnShitpost.scale.x = 2.5;
		_btnShitpost.label.scale.x = _btnShitpost.label.scale.y = 1.5;
		add(_btnShitpost);
		
		_btnAdvice = new FlxButton(btnX, 100, "Ask for advice", clickAdvice);
		add(_btnAdvice);
		
		_btnClose = new FlxButton(100, 600, "Close", clickClose);
		add(_btnClose);
	}
	
	private function clickShitpost():Void
	{
		//TODO: instead of doing this, it'll change the title and post text to suit, and then call typingStart
		
		typingStart();
	}
	
	private function clickAdvice():Void
	{
		_title.resetText("HEEELPP!!!!");
		_post.resetText("I THINK NEWGROUNDS IS COMPLETLY BROKEN, I CANNOT BUY THE MERCH ANYMORE!!!! TOM PLEASE TAKE MY MONEYYYYYYYYYYY :(:(:( SAD FAAACE");
		
		typingStart();
	}
	
	private function typingStart():Void
	{
		bg.loadGraphic("assets/images/BBS.PNG");
		
		_btnShitpost.visible = false;
		_btnAdvice.visible = false;
		
		_title.showCursor = true;
		_title.setTypingVariation(0.5);
		_title.start(0.025, false, false, ["SPACE"], finishTitle);
	}
	
	private function finishTitle():Void
	{
		_title.showCursor = false;
		_post.showCursor = true;
		_post.start(0.025, false, false, ["SPACE"]);
	}
	
	private function clickClose():Void
	{
		close();
	}
}