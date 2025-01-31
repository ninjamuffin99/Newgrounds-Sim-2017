package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.addons.ui.FlxUIButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import source.Stats;

/**
 * ...
 * @author 
 */
class ForumState extends FlxState 
{
	private var bg:FlxSprite;
	
	private var _title:FlxTypeText;
	private var _post:FlxTypeText;
	
	private var _notifacations:Notifacations;
	
	private var _foundFlash:FlxText;
	
	private var _btnShitpost:FlxUIButton;
	private var _btnAdvice:FlxUIButton;
	private var _btnBrowse:FlxUIButton;
	private var _btnClose:FlxUIButton;
	
	private var _titleArray = ["Who is the cutest NG user?", "HELP ME", "Damn, I got Sat. detention AGAIN.", "GOD DAMNED SATURDAY DETENTION AGAIN", "GOD DAMNED SATURDAY DETENTION AGAIN"];
	private var	_postArray = ["I think Tom is a cutie pie #BringBackBeardFulp", 
			"Haha you thought i needed help didnt you? XDD", 
			"What is even the fucking point of school. You should only have to take it once. They just beat the same things into your head. And you have to know it by the end of the year. Then forget. They should teach things that are fun or new or things that interest you. They should teach you at home as individuals not as sheep. And who the fuck needs to know fucking calculus for making a damn pie. Or if you want to be a ditch digger. Or a computer programmer. Its all stupid. Thats why I'm homeschooled. Even though my mom trys to thrwart everything I do and thinks being a mindless sheep is best. The world sucks. Newgrounds is cool. People suck. I could go on forever but I don't want to get off the subject to far. I'm just saying if they made school more interesting kids wouldn't skip.", 
			"I GOT ANOTHER ONE TODAY, BECAUSE I WAS BEING DISRUPTIVE IN CLASS! \n After taking 4 pages of notes, Ms. Videtich busts out another page and I say GAH. to myself, rather quiet, because, naturally, my hand is starting to hurt. She yells, YELLS, DO YOU HAVE A PROBLEM WITH MY NOTES, WILLIAM? And I said, No...why...what are you talking about, wha? You know, I didn't see it coming...and then she says If you dont like my notes, feel free to leave the class. I was silent...and so was everyone else, I just wanted her to continue and leave me alone...I thought it was over...and then she says Well, are you QUITE finished, Will? Hmmm? ANSWER ME. \nI shook my head yes, and she was like I CANT HEAR YOU!!! She was YELLING...and I was really starting to get pissed off. All I said was, YES, YES MS. V, SHUT YOUR MOUTH...GET OFF MY CASE. \n My friend Darius (D) says Yeah yah fat bee-itch. And she didnt even pay attention to him. \n Anyway, she grabbed me by the arm like a little kid and took me to the door where she let go and told me to go to the office and explain myself. I started to walk down the hall and instead of going to the office I headed for the parking lot, and she yelled after YOU WILL HAVE SATURDAY DETENTION AGAIN NEXT WEEK, CONGRATULATIONS!!! "];
	
	private var _randomPost:Int;
	
	
	override public function create():Void 
	{
		bg = new FlxSprite(312 / 2, 152 / 2);
		bg.loadGraphic("assets/images/BBSblurred.png");
		bg.setGraphicSize(1280, 720);
		add(bg);
		
		createButtons();
		
		var wordsX:Int = 290;
		
		_foundFlash = new FlxText(200, 400, 0, "Someone found a way to get Flash MX for free! Thanks JessieJJones!", 12);
		_foundFlash.visible = false;
		//add(_foundFlash);
		
		_title = new FlxTypeText(wordsX, 110, Std.int(FlxG.width * 0.95) - 290, "", 16);
		_title.font = "assets/data/ARIALBD.TTF";
		_title.cursorCharacter = "|";
		_title.color = FlxColor.BLACK;
		add(_title);
		
		_post = new FlxTypeText(wordsX, 300, Std.int(FlxG.width * 0.95) - 290, "", 16);
		_post.cursorCharacter = "|";
		_post.color = FlxColor.BLACK;
		_post.font = "assets/data/ARIALBD.TTF";
		add(_post);
		
		_notifacations = new Notifacations();
		add(_notifacations);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.watch.addMouse();
		
		super.update(elapsed);
	}
	
	private function createButtons():Void
	{
		var btnX:Int = 600;
		
		var featuredFont:String = "assets/data/FeaturedItem.ttf";
		
		_btnShitpost = new FlxUIButton(btnX, 250, "Shitpost on the BBS", clickShitpost);
		_btnShitpost.loadGraphic("assets/images/ButtonNoText.png", false, 342, 84);
		_btnShitpost.setAllLabelOffsets(0, 8);
		_btnShitpost.setLabelFormat(featuredFont, 40);
		_btnShitpost.screenCenter(X);
		add(_btnShitpost);
		
		_btnAdvice = new FlxUIButton(btnX, 100, "Ask for advice", clickAdvice);
		_btnAdvice.loadGraphic("assets/images/ButtonNoText.png", false, 342, 84);
		_btnAdvice.setLabelFormat(featuredFont, 40);
		_btnAdvice.screenCenter(X);
		//add(_btnAdvice);
		
		_btnClose = new FlxUIButton(100, 600, "Close", clickClose);
		add(_btnClose);
		
		_btnBrowse = new FlxUIButton(btnX, 75, "Lurk and browse", clickBrowse);
		//add(_btnBrowse);
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
		var banTimer:Int;
		banTimer = Stats.h - Stats._timeOfBan;
		banTimer = 12 - banTimer;
		if (banTimer == 0)
			Stats._banned = false;
		
		if (!Stats._banned)
		{
			//TODO: instead of doing this, it'll change the title and post text to suit, and then call typingStart
			_randomPost = FlxG.random.int(0, 3);
			_title.resetText(_titleArray[_randomPost]);
			_post.resetText(_postArray[_randomPost]);
			
			Stats.forumPost(FlxG.random.int(2, 12));
			typingStart();
		}
		else
		{
			_notifacations._newText(250, 500, "You're still banned for " + banTimer + " more hours!", 20, FlxColor.WHITE, 1.2);
		}
	}
	
	private function clickAdvice():Void
	{
		_randomPost = FlxG.random.int(0, 3);
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
		
		if (_randomPost >= 1)
			_post.start(0.015, false, false, ["SPACE"]);
		_post.start(0.025, false, false, ["SPACE"]);
		FlxG.log.add("Forum Posts = " + Stats._forumPosts);
		if (Stats._banned)
		{
			_notifacations._newText(250, 500, "You have been temp banned from the forums! Quit shitposting so much!", 20, FlxColor.WHITE, 1.3);
		}
	}
	
	private function clickClose():Void
	{
		FlxG.switchState(new NewGroundsState());
	}
}