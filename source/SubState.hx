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
	
	private var _btnshitpost:FlxButton;

	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		
	}
	
	override public function create():Void 
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/BBSblurred.png");
		add(bg);
		
		_btnshitpost = new FlxButton(600, 250, "Shitpost on the forums", clickShitpost);
		_btnshitpost.scale.y = _btnshitpost.scale.x = 2.5;
		_btnshitpost.label.scale.x = _btnshitpost.label.scale.y = 1.5;
		add(_btnshitpost);
		
		_title = new FlxTypeText(220, 88, FlxG.width, "Who is the cutest NG user?", 12);
		_title.font = "assets/data/ARIALBD.TTF";
		_title.cursorCharacter = "|";
		_title.color = FlxColor.BLACK;
		add(_title);
		
		_post = new FlxTypeText(220, 240, FlxG.width - 50, "I think Tom is a cutie pie #BringBackBeardFulp", 12);
		_post.cursorCharacter = "|";
		_post.color = FlxColor.BLACK;
		_post.font = "assets/data/ARIALBD.TTF";
		add(_post);
		
		super.create();
	}
	
	private function clickShitpost():Void
	{
		bg.loadGraphic("assets/images/BBS.PNG");
		
		_btnshitpost.visible = false;
		
		_title.showCursor = true;
		_title.start(0.025, false, false, ["SPACE"], finishTitle);
	}
	
	private function finishTitle():Void
	{
		_title.showCursor = false;
		_post.showCursor = true;
		_post.start(0.025, false, false, ["SPACE"]);
	}
}