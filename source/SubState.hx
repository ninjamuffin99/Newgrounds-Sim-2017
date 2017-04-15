package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import source.Stats;

/**
 * ...
 * @author 
 */
class SubState extends FlxSubState 
{
	private var bg:FlxSprite;
	
	private var _title:FlxTypeText;
	private var _post:FlxTypeText;
	
	private var _foundFlash:FlxText;
	
	private var _btnShitpost:FlxButton;
	private var _btnAdvice:FlxButton;
	private var _btnBrowse:FlxButton;
	private var _btnClose:FlxButton;
	
	private var _titleArray = ["Who is the cutest NG user?", "HELP ME", "Damn, I got Sat. detention AGAIN.", "GOD DAMNED SATURDAY DETENTION AGAIN"];
	private var	_postArray = ["I think Tom is a cutie pie #BringBackBeardFulp", "Haha you thought i needed help didnt you? XDD", "What is even the fucking point of school. You should only have to take it once. They just beat the same things into your head. And you have to know it by the end of the year. Then forget. They should teach things that are fun or new or things that interest you. They should teach you at home as individuals not as sheep. And who the fuck needs to know fucking calculus for making a damn pie. Or if you want to be a ditch digger. Or a computer programmer. Its all stupid. Thats why I'm homeschooled. Even though my mom trys to thrwart everything I do and thinks being a mindless sheep is best. The world sucks. Newgrounds is cool. People suck. I could go on forever but I don't want to get off the subject to far. I'm just saying if they made school more interesting kids wouldn't skip.", "I GOT ANOTHER ONE TODAY, BECAUSE I WAS BEING DISRUPTIVE IN CLASS! \n After taking 4 pages of notes, Ms. Videtich busts out another page and I say GAH. to myself, rather quiet, because, naturally, my hand is starting to hurt. She yells, YELLS, DO YOU HAVE A PROBLEM WITH MY NOTES, WILLIAM? And I said, No...why...what are you talking about, wha? You know, I didn't see it coming...and then she says If you dont like my notes, feel free to leave the class. I was silent...and so was everyone else, I just wanted her to continue and leave me alone...I thought it was over...and then she says Well, are you QUITE finished, Will? Hmmm? ANSWER ME. \n  I shook my head yes, and she was like I CANT HEAR YOU!!! She was YELLING...and I was really starting to get pissed off. All I said was, YES, YES MS. V, SHUT YOUR MOUTH...GET OFF MY CASE. \n My friend Darius (D) says Yeah yah fat bee-itch. And she didnt even pay attention to him. \n Anyway, she grabbed me by the arm like a little kid and took me to the door where she let go and told me to go to the office and explain myself. I started to walk down the hall and instead of going to the office I headed for the parking lot, and she yelled after YOU WILL HAVE SATURDAY DETENTION AGAIN NEXT WEEK, CONGRATULATIONS!!! In a deep evil bitch voice, so I hopped in my car and went home, got a hot pocket and some Pepsi, came upstairs, sat down, turned on the computer, went to Newgrounds and now, here I am. God damn, is that crazy or what? \n -Stamper"];
	
	private var _randomPost:Int;
	
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
	}
	
	override public function create():Void 
	{
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/BBSblurred.png");
		bg.setGraphicSize(FlxG.width, FlxG.height);
		add(bg);
		
		createButtons();
		
		var wordsX:Int = Std.int(FlxG.width * 0.1719);
		
		_foundFlash = new FlxText(200, 400, 0, "Someone found a way to get Flash MX for free! Thanks JessieJJones!", 12);
		_foundFlash.visible = false;
		add(_foundFlash);
		
		
		
		_title = new FlxTypeText(wordsX, Std.int(FlxG.height * 0.122), FlxG.width * 0.9, "", 12);
		_title.font = "assets/data/ARIALBD.TTF";
		_title.cursorCharacter = "|";
		_title.color = FlxColor.BLACK;
		add(_title);
		
		_post = new FlxTypeText(wordsX, Std.int(FlxG.height * 0.33), FlxG.width * 0.9, "", 12);
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
		
		_btnBrowse = new FlxButton(btnX, 75, "Lurk and browse", clickBrowse);
		add(_btnBrowse);
	}
	
	private function clickBrowse():Void
	{
		
		if (!Stats._hasFlashMX)
		{
			Stats._hasFlashMX = FlxG.random.bool(5);
			if (Stats._hasFlashMX)
			{
				_foundFlash.visible = true;
			}
			FlxG.log.add("DO NOT HAVE FLASH");
		}
		
		
		FlxG.log.add(Stats._hasFlashMX);
	}
	
	private function clickShitpost():Void
	{
		//TODO: instead of doing this, it'll change the title and post text to suit, and then call typingStart
		_randomPost = FlxG.random.int(0, 2);
		_title.resetText(_titleArray[_randomPost]);
		_post.resetText(_postArray[_randomPost]);
		
		Stats.forumPost(10);
		typingStart();
	}
	
	private function clickAdvice():Void
	{
		_randomPost = FlxG.random.int(0, 2);
		_title.resetText(_titleArray[_randomPost]);
		_post.resetText(_postArray[_randomPost]);
		Stats.forumPost(5);
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
		Stats.forumPost(FlxG.random.int(1, 3));
		FlxG.log.add("Forum Posts = " + Stats._forumPosts);
	}
	
	private function clickClose():Void
	{
		close();
	}
}