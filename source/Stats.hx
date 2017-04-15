package source;
import flash.display.Bitmap;
import flixel.FlxG;
import flixel.util.FlxSave;

/**
 * ...
 * @author 
 */
class Stats 
{
	
	//BASE STATS
	public static var _animationSkill:Float = 0;
	public static var _artSkill:Float = 0;
	public static var _musicSkill:Float = 0;
	public static var _programSkill:Float = 0;
	public static var _voiceSkill:Float = 0;
	public static var _writingSkill:Float = 0; //will use for quality of jokes in animations as well as forum stuff maybe
	
	//Leveling System
	public static var _animationLevel:Float = 1;
	public static var _artLevel:Float = 1;
	public static var _musicLevel:Float = 1;
	public static var _programLevel:Float = 1;
	public static var _voiceLevel:Float = 1;
	public static var _writingLevel:Float = 1;
	
	
	//DATE AND TIME STATS
	public static var yyyy:Int = 2017;
	public static var mm:Int = 1;
	public static var dd:Int = 26;
	public static var PM:Bool;
	public static var AMPM:String = "AM";
	public static var h:Int = 8;
	public static var m:Int;
	public static var _stamina:Float = 24;
	
	//PERSONAL STATS
	public static var _name:String = "Cameron";

	public static var _cash:Int = 2000;
	
	//Newgrounds Stuff
	public static var _username:String = "ninjamuffin99";
	public static var _fans:Int = 0;
	public static var _forumPosts:Int = 0;
	public static var _blams:Int = 0;
	public static var _protects:Int = 0;
	public static var _supporters:Int = 1700;
	public static var _ngCash:Int = 3900;
	
	//STYLE STATS will maybe use these but for now these will get cut
	/*public static var _artVectorSkill:Float;
	public static var _artPixelSkill:Float;
	
	public static var _animationVectorSkill:Float;
	public static var _animationPixelSkill:Float;*/
	
	//WHICH PROGRAMS USER OWNS
	public static var _hasFlash:Bool = false;
	public static var _hasFlashMX:Bool = false;
	
	public static var _hasClipStudio:Bool = false;
	
	//SPECIFIC PROGRAM STATS
	public static var _flashSkill:Float = 5;
	public static var _toonBoomSkill:Float;
	public static var _openToonzSkill:Float;
	public static var _photoshopSkill:Float;
	public static var _mspaintSkill:Float;
	public static var _flSkill:Float;
	public static var _blenderSkill:Float;
	public static var _mayaSkill:Float;
	public static var _unitySkill:Float;
	public static var _stencylSkill:Float;
	public static var _gamemakerSkill:Float;
	public static var _constructSkill:Float;
	public static var _kritaSkill:Float;
	public static var _gimpSkill:Float;
	public static var _asepriteSkill:Float;
	
	//QUALITY STATS
	public static var _animationQuality:Float;//= _animationSkill + _artSkill / _flashSkill; // change this to program of choice possibly have it change dependign on which program you're using
	public static var _artQuality:Float;
	public static var _gameQuality:Float;
	public static var _songQuality:Float;
	
	//add in more programs later such as unity or other art programs liek krita
	
	//PROGRESS OF PROJECTS
	public static var _artProgress:Float = 0;
	public static var _animationProgress:Float = 0;
	public static var _gameProgress:Float = 0;
	public static var _songProgress:Float = 0;
	
	public static var _animationUnpubbed:Int = 0;
	public static var _animationPubbed:Int = 0;
	
	public static var _artUnpubbed:Int = 0;
	public static var _artPubbed:Int = 0;
	
	//MISC STATS SUCH AS TOTALS
	public static var _TotalCashEarned:Int = 0;
	public static var _TotalHoursWorked:Int = 0;
	public static var _TotalDaysPassed:Int = 0;
	
	//SAVING LOADING
	public static var _gameSave:FlxSave;
	
	public static var _file1name:String;
	public static var _file2name:String;
	public static var _file3name:String;
	
	public function new() 
	{
		
	}
	
	public static function load():Void
	{
		_animationSkill = FlxG.save.data._animationSkill;
		_artSkill = FlxG.save.data._artSkill;
		_musicSkill = FlxG.save.data._musicSkill;
		_programSkill = FlxG.save.data._programSkill;
		_voiceSkill = FlxG.save.data._voiceSkill;
		_writingSkill = FlxG.save.data._writingSkill;
		
		_animationLevel = FlxG.save.data._animationLevel;
		_artLevel = FlxG.save.data._artLevel;
		_musicLevel = FlxG.save.data._musicLevel;
		_programLevel = FlxG.save.data._programLevel;
		_voiceLevel = FlxG.save.data._voiceLevel;
		_writingLevel = FlxG.save.data._writingLevel;
		
		yyyy = FlxG.save.data.yyyy;
		mm = FlxG.save.data.mm;
		dd = FlxG.save.data.dd;
		PM = FlxG.save.data.PM;
		AMPM = FlxG.save.data.AMPM;
		h = FlxG.save.data.h;
		m = FlxG.save.data.m;
		_stamina = FlxG.save.data._stamina;
		
		_name = FlxG.save.data._name;
		_cash = FlxG.save.data._cash;
		_username = FlxG.save.data._username;
		_fans = FlxG.save.data._fans;
		_forumPosts = FlxG.save.data._forumPosts;
		_blams = FlxG.save.data._blams;
		_protects = FlxG.save.data._protects;
		_supporters = FlxG.save.data._supporters;
		_ngCash = FlxG.save.data._ngCash;
		
		FlxG.log.add("Stats Loaded");
	}
	
	public static function save():Void
	{
		FlxG.save.data._animationSkill = _animationSkill;
		FlxG.save.data._artSkill = _artSkill;
		FlxG.save.data._musicSkill = _musicSkill;
		FlxG.save.data._programSkill = _programSkill;
		FlxG.save.data._voiceSkill = _voiceSkill;
		FlxG.save.data._writingSkill = _writingSkill;
		
		FlxG.save.data._animationLevel = _animationLevel;
		FlxG.save.data._artLevel = _artLevel;
		FlxG.save.data._musicLevel = _musicLevel;
		FlxG.save.data._programLevel = _programLevel;
		FlxG.save.data._voiceLevel = _voiceLevel;
		FlxG.save.data._writingLevel = _writingLevel;
		
		FlxG.save.data.yyyy = yyyy;
		FlxG.save.data.mm = mm;
		FlxG.save.data.dd = dd;
		FlxG.save.data.PM = PM;
		FlxG.save.data.AMPM = AMPM;
		FlxG.save.data.h = h;
		FlxG.save.data.m = m;
		FlxG.save.data._stamina = _stamina;
		
		FlxG.save.data._name = _name;
		
		FlxG.save.data._cash = _cash;
		
		FlxG.save.data._username = _username;
		FlxG.save.data._fans = _fans;
		FlxG.save.data._forumPosts = _forumPosts;
		FlxG.save.data._blams = _blams;
		FlxG.save.data._protects = _protects;
		FlxG.save.data._supporters = _supporters;
		FlxG.save.data._ngCash = _ngCash;
		
		FlxG.log.add("Stats Saved");
		
		FlxG.save.flush();
	}
	
	public static function addCash(C:Int):Void
	{
		_cash += C;
		_TotalCashEarned += C;
	}
	
	public static function addWorkHours(H:Int):Void
	{
		h += H;
		_TotalHoursWorked += H;
	}
	
	public static function addDay(D:Int):Void
	{
		dd += D;
		_TotalDaysPassed += D;
	}
	
	public static function forumPost(P:Int):Void
	{
		_forumPosts += P;
	}
	
	public static function animationPost(P:Int):Void
	{
		
		var quality:Float = _animationLevel += _artLevel;
		_animationQuality == quality;
		
		if (quality >= 10)
		{
			var FP:Float = FlxG.random.float(0, quality * 10);
			FlxG.log.add(FP);
			if (FP >= 120)
			{
				FlxG.log.add("Your animation was front paged!");
				_fans += Std.int(FlxG.random.float(0, quality));
			}
			else
			{
				FlxG.log.add("Your animation was not front paged");
			}
		}
		
		_fans += Std.int(FlxG.random.float(0, quality));
		//_animationPosts = P;
	}
	
	public static function artPost(P:Int):Void
	{
		var quality:Float = _artLevel; // += _whatever program skill and which tablet you have
		_artQuality == quality;
		
		if (quality >= 4)
		{
			var FP:Float = FlxG.random.float(0, quality * 10);
			if (FP >= 250)
			{
				_fans += Std.int(FlxG.random.float(0, quality));
			}
		}
		
		_fans += Std.int(FlxG.random.float(0, quality));
	}
	
	public static function musicPost(P:Int):Void
	{
		var quality:Float = _musicLevel;
		_songQuality == quality;
		
		if (quality >= 4)
		{
			var FP:Float = FlxG.random.float(0, quality * 10);
			if (FP >= 250)
			{
				_fans += Std.int(FlxG.random.float(0, quality));
			}
		}
		
		_fans += Std.int(FlxG.random.float(0, quality));
	}
	
	public static function gamePost(P:Int = 0):Void
	{
		var quality:Float = _programLevel;
		_gameQuality == quality;
		
		if (quality >= 4)
		{
			var FP:Float = FlxG.random.float(0, quality * 10);
			if (FP >= 250)
			{
				_fans += Std.int(FlxG.random.float(0, quality));
			}
		}
		
		_fans += Std.int(FlxG.random.float(0, quality));
	}
	
	//EXPERIENCE STUFF
	
	public static function animationEXP(E:Float):Void
	{
		if (_stamina <= 7)
		{
			E = E * 0.25;
		}
		if (_stamina <= 0)
		{
			E = 0;
		}
		
		_animationSkill += E;
		
		if (_animationSkill >= 100)
		{
			_animationLevel += 1;
			_animationSkill -= 100;
		}
	}
	
	public static function artEXP(E:Float):Void
	{
		if (_stamina <= 7)
		{
			E = E * 0.25;
		}
		if (_stamina <= 0)
		{
			E = 0;
		}
		
		_artSkill += E;
		
		if (_artSkill >= 100)
		{
			_artLevel += 1;
			_artSkill -= 100;
		}
	}
	
	public static function musicEXP(E:Float):Void
	{
		if (_stamina <= 7)
		{
			E = E * 0.25;
		}
		if (_stamina <= 0)
		{
			E = 0;
		}
		
		_musicSkill += E;
		
		if (_musicSkill >= 100)
		{
			_musicLevel += 1;
			_musicSkill -= 100;
		}
	}
	
	public static function programEXP(E:Float):Void
	{
		if (_stamina <= 7)
		{
			E = E * 0.25;
		}
		if (_stamina <= 0)
		{
			E = 0;
		}
		
		_programSkill += E;
		if (_programSkill >= 100)
		{
			_programSkill -= 100;
			_programLevel += 1;
		}
	}
	
	public static function voiceEXP(E:Float):Void
	{
		if (_stamina <= 7)
		{
			E = E * 0.25;
		}
		if (_stamina <= 0)
		{
			E = 0;
		}
		
		_voiceSkill += E;
		
		if (_voiceSkill >= 100)
		{
			_voiceSkill -= 100;
			_voiceLevel += 1;
		}
	}
	
	public static function writingEXP(E:Float):Void
	{
		if (_stamina <= 7)
		{
			E = E * 0.25;
		}
		if (_stamina <= 0)
		{
			E = 0;
		}
		
		_writingSkill += E;
		
		if (_writingSkill >= 100)
		{
			_writingSkill -= 100;
			_writingLevel += 1;
		}
	}
	
	//PROGRESS
	
	public static function animationProgress(P:Float):Void
	{
		if (_stamina <= 7)
		{
			P * 0.25;
		}
		if (_stamina <= 0)
		{
			P = 0;
		}
		_animationProgress += P;
	}
	
	public static function artProgress(P:Float):Void
	{
		if (_stamina <= 7)
		{
			P * 0.25;
		}
		if (_stamina <= 0)
		{
			P = 0;
		}
		_artProgress += P;
	}
	
	public static function gameProgress(P:Float):Void
	{
		if (_stamina <= 7)
		{
			P * 0.25;
		}
		if (_stamina <= 0)
		{
			P = 0;
		}
		_gameProgress += P;
	}
	
	public static function songProgress(P:Float):Void
	{
		if (_stamina <= 7)
		{
			P * 0.25;
		}
		if (_stamina <= 0)
		{
			P = 0;
		}
		_songProgress += P;
	}
	
	public static function BAP(B:Int = 7, P:Int = 5):Void
	{
		if (_stamina <= 7)
		{
			B = B - 4;
			P = P - 3;
		}
		if (_stamina <= 0)
		{
			B = 0;
			P = 0;
		}
		
		_blams += FlxG.random.int(0, B);
		_protects += FlxG.random.int(0, P);
	}
}
