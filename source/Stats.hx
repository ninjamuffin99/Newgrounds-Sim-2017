package source;
import flash.display.Bitmap;
import flixel.FlxG;
import flixel.input.FlxAccelerometer;
import flixel.util.FlxSave;
import com.newgrounds.*;

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
	
	public static var _animationLevelUp:Float = 15;
	public static var _artLevelUp:Float = 15;
	public static var _musicLevelUp:Float = 15;
	public static var _programLevelUp:Float = 15;
	public static var _voiceLevelUp:Float = 15;
	public static var _writingLevelUp:Float = 15;
	
	
	//DATE AND TIME STATS
	public static var yyyy:Int = 2017;
	public static var mm:Int = 1;
	public static var dd:Int = 4;
	public static var PM:Bool;
	public static var AMPM:String = "AM";
	public static var h:Int = 8;
	public static var m:Int;
	public static var _stamina:Float = 24;
	
	//PERSONAL STATS
	public static var _name:String = "Cameron";
	public static var _cash:Int = 1000;
	
	//Newgrounds Stuff
	public static var _username:String = "ninjamuffin99";
	public static var _fans:Int = 0;
	public static var _forumPosts:Int = 0;
	public static var _blams:Int = 0;
	public static var _protects:Int = 0;
	public static var _supporters:Int = 1669;
	public static var _ngCash:Int = 2733;
	public static var _banned:Bool;
	public static var _timesBanned:Int = 0;
	public static var _timeOfBan:Int;
	
	public static var _isMonthly:Bool;
	public static var _isYearly:Bool;
	public static var _supporterCountdown:Int = 0; //in months
	
	public static var _sponsoredAnimation:Bool = false;
	public static var _sponsoredGame:Bool = false;
	public static var _sponsoredSong:Bool = false;
	public static var _soundTrackAmount:Int;
	
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
	public static var _TotalHoursAnimating:Int = 0;
	public static var _TotalHoursProgramming:Int = 0;
	public static var _TotalHoursMakingMusic:Int = 0;
	public static var _TotalHoursDrawing:Int = 0;
	public static var _shitLoop:Bool = false;
	public static var _hintsON:Bool = true;
	
	//SAVING LOADING
	public static var _gameSave:FlxSave;
	
	public static var _file1name:String;
	public static var _file2name:String;
	public static var _file3name:String;
	
	//NAMES ARRAYS
	public static var _animationNames:Array<String>;
	
	public static var _loadFade:Bool = false;
	
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
		
		_animationLevelUp = FlxG.save.data._animationLevelUp;
		_artLevelUp = FlxG.save.data._artLevelUp;
		_musicLevelUp = FlxG.save.data._musicLevelUp;
		_programLevelUp = FlxG.save.data._programLevelUp;
		_voiceLevelUp = FlxG.save.data._voiceLevelUp;
		_writingLevelUp = FlxG.save.data._writingLevelUp;
		
		
		
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
		_banned = FlxG.save.data._banned;
		_timesBanned = FlxG.save.data._timesBanned;
		_timeOfBan = FlxG.save.data._timeOfBan;
		
		_isMonthly = FlxG.save.data._isMonthly;
		_isYearly = FlxG.save.data._isYearly;
		_supporterCountdown = FlxG.save.data._supporterCountdown;
		
		
		_sponsoredAnimation = FlxG.save.data._sponsoredAnimation;
		_sponsoredGame = FlxG.save.data._sponsoredGame;
		_sponsoredSong = FlxG.save.data._sponsoredSong;
		_soundTrackAmount = FlxG.save.data._sponsoredTrackAmount;
		
		
		_animationQuality = FlxG.save.data._animationQuality;
		_artQuality = FlxG.save.data._artQuality;
		_gameQuality = FlxG.save.data._gameQuality;
		_songQuality = FlxG.save.data._songQuality;
		
		_artProgress = FlxG.save.data._artProgress;
		_animationProgress = FlxG.save.data._animationProgress;
		_gameProgress = FlxG.save.data._gameProgress;
		_songProgress = FlxG.save.data._songProgress;
		
		_TotalCashEarned = FlxG.save.data._TotalCashEarned;
		_TotalDaysPassed = FlxG.save.data._TotalDaysPassed;
		_TotalHoursAnimating = 	FlxG.save.data._TotalHoursAnimating;
		_TotalHoursProgramming = FlxG.save.data._TotalHoursProgramming;
		_TotalHoursMakingMusic = FlxG.save.data._TotalHoursMakingMusic;
		_TotalHoursDrawing = FlxG.save.data._TotalHoursDrawing;
		
		
		
		_hintsON = FlxG.save.data._hintsON;
		_shitLoop = FlxG.save.data._shitLoop;
		
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
		
		FlxG.save.data._animationLevelUp = _animationLevelUp;
		FlxG.save.data._artLevelUp = _artLevelUp;
		FlxG.save.data._musicLevelUp = _musicLevelUp;
		FlxG.save.data._programLevelUp = _programLevelUp;
		FlxG.save.data._voiceLevelUp = _voiceLevelUp;
		FlxG.save.data._writingLevelUp = _writingLevelUp;
		
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
		FlxG.save.data._banned = _banned;
		FlxG.save.data._timesBanned = _timesBanned;
		FlxG.save.data._timeOfBan = _timeOfBan;
		
		FlxG.save.data._isMonthly = _isMonthly;
		FlxG.save.data._isYearly = _isYearly;
		
		FlxG.save.data._supporterCountdown = _supporterCountdown;
		
		FlxG.save.data._animationQuality = _animationQuality;
		FlxG.save.data._artQuality = _artQuality;
		FlxG.save.data._gameQuality = _gameQuality;
		FlxG.save.data._songQuality = _songQuality;
		
		FlxG.save.data._artProgress = _artProgress;
		FlxG.save.data._animationProgress = _animationProgress;
		FlxG.save.data._gameProgress = _gameProgress;
		FlxG.save.data._songProgress = _songProgress;
		
		FlxG.save.data._shitLoop = _shitLoop;
		FlxG.save.data._hintsON = _hintsON;
		
		FlxG.save.data._TotalCashEarned = _TotalCashEarned;
		FlxG.save.data._TotalDaysPassed = _TotalDaysPassed;
		FlxG.save.data._TotalHoursAnimating = _TotalHoursAnimating;
		FlxG.save.data._TotalHoursProgramming = _TotalHoursProgramming;
		FlxG.save.data._TotalHoursMakingMusic = _TotalHoursMakingMusic;
		FlxG.save.data._TotalHoursDrawing = _TotalHoursDrawing;
		
		
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
	
	public static function addHours(Htype:String, H:Int = 1):Void
	{
		h += H;
		
		if (Htype == "program")
		{
			_TotalHoursProgramming += H;
		}
		
		if (Htype == "animate")
		{
			_TotalHoursAnimating += H;
		}
		
		if (Htype == "draw")
		{
			_TotalHoursDrawing += H;
		}
		
		if (Htype == "music")
		{
			_TotalHoursMakingMusic += H;
		}
		
		if (Htype == "voice")
		{
			//total hours voice acting get it done
		}
	}
	
	public static function addDay(D:Int):Void
	{
		dd += D;
		_TotalDaysPassed += D;
		
		if (_isMonthly || _isYearly)
		{
			_supporterCountdown -= 1;
			FlxG.log.add("Days until renew supporter" + _supporterCountdown);
			if (_supporterCountdown < 0)
			{
				_supporterCountdown = 30;
				_cash -= 3;
			}
		}
	}
	
	public static function forumPost(P:Int):Void
	{
		_forumPosts += P;
		if (P >= 11)
		{
			_banned = true;
			_timesBanned += 1;
			_timeOfBan = h;
			if (_timesBanned >= 10)
			{
				API.unlockMedal("Shitposter Extraordinaire");
			}
			h += 1;
		}
	}
	
	public static function animationPost(P:Int):Void
	{
		
		var quality:Float = _animationLevel += _artLevel;
		quality += _writingLevel;
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
		quality += _writingLevel;
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
		
		if (_animationSkill >= _animationLevelUp)
		{
			_animationLevel += 1;
			_animationSkill -= _animationLevelUp;
			
			_animationLevelUp = _animationLevelUp * 1.3;
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
		
		if (_artSkill >= _artLevelUp)
		{
			_artLevel += 1;
			_artSkill -= _artLevelUp;
			_artLevelUp = _artLevelUp * 1.2;
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
		
		if (_musicSkill >= _musicLevelUp)
		{
			_musicLevel += 1;
			_musicSkill -= _musicLevelUp;
			
			_musicLevelUp = _musicLevelUp * 1.2;
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
		if (_programSkill >= _programLevelUp)
		{
			_programSkill -= _programLevelUp;
			_programLevel += 1;
			
			_programLevelUp = _programLevelUp * 1.2;
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
		
		if (_voiceSkill >= _voiceLevelUp)
		{
			_voiceSkill -= _voiceLevelUp;
			_voiceLevel += 1;
			
			_voiceLevelUp = _voiceLevelUp * 1.2;
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
		
		if (_writingSkill >= _writingLevelUp)
		{
			_writingSkill -= _writingLevelUp;
			_writingLevel += 1;
			
			_writingLevelUp = _writingLevelUp * 1.2;
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
	
	public static function updateSupporters(supporters:Int):Void
	{
		_supporters += supporters;
		_ngCash += Std.int(FlxG.random.float(3, 25) * supporters);
	}
}
