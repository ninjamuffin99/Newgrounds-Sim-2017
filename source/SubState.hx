package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.text.FlxTypeText;
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

	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		
	}
	
	override public function create():Void 
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/BBS.PNG");
		add(bg);
		
		_title = new FlxTypeText(220, 88, FlxG.width, "Who is the cutest NG user?", 10);
		_title.font = "assets/data/ARIALBD.TTF";
		_title.cursorCharacter = "|";
		_title.showCursor = true;
		_title.color = FlxColor.BLACK;
		add(_title);
		_title.start(0.025, false, false, ["SPACE"], finishTitle);
		
		_post = new FlxTypeText(220, 240, FlxG.width - 50, "I think Tom is a cutie pie #BringBackBeardFulp", 10);
		_post.cursorCharacter = "|";
		_post.color = FlxColor.BLACK;
		_post.font = "assets/data/ARIALBD.TTF";
		add(_post);
		
		super.create();
	}
	
	private function finishTitle():Void
	{
		_title.showCursor = false;
		_post.showCursor = true;
		_post.start(0.025, false, false, ["SPACE"]);
	}
}