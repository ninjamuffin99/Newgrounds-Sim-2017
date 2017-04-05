package source;
import flixel.FlxG;

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
	public static var _username:String = "ninjamuffin99";
	public static var _forumPosts:Int = 0;
	public static var _cash:Int = 2000;
	
	
	//STYLE STATS
	public static var _artVectorSkill:Float;
	public static var _artPixelSkill:Float;
	
	public static var _animationVectorSkill:Float;
	public static var _animationPixelSkill:Float;
	
	//WHICH PROGRAMS USER OWNS
	public static var _hasFlash:Bool = false;
	public static var _hasClipStudio:Bool = false;
	public static var _hasFlashMX:Bool = false;
	
	
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
	public static var _animationQuality:Float = _animationSkill + _artSkill / _flashSkill; // change this to program of choice possibly have it change dependign on which program you're using
	public static var _artQuality:Float;
	public static var _gameQuality:Float;
	public static var _songQuality:Float;
	
	//add in more programs later such as unity or other art programs liek krita
	
	//PROGRESS OF PROJECTS
	public static var _artProgress:Float = 0;
	public static var _animationProgress:Float = 0;
	public static var _gameProgress:Float = 0;
	public static var _songProgress:Float = 0;
	
	public static var _artUnpubbed:Int = 0;
	public static var _artPubbed:Int = 0;
	
	//MISC STATS SUCH AS TOTALS
	public static var _TotalCashEarned:Int = 0;
	public static var _TotalHoursWorked:Int = 0;
	public static var _TotalDaysPassed:Int = 0;
	
	public function new() 
	{
		
	}
	
	public static function save():Void
	{
		FlxG.save.data._animationSkill = _animationSkill;
		
		//FlxG.save.data._animationSkill;
		
		FlxG.log.add("Saved animation Skill" + FlxG.save.data._animationSkill);
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
	
	public static function animationEXP(E:Float):Void
	{
		_animationSkill += E;
		
		if (_animationSkill >= 100)
		{
			_animationLevel += 1;
			_animationSkill -= 100;
		}
	}
}
