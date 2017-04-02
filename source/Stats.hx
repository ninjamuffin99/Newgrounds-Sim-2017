package source;

/**
 * ...
 * @author 
 */
class Stats 
{
	public static var _animationSkill:Float = 3;
	public static var _artSkill:Float = 0;
	public static var _musicSkill:Float;
	public static var _programSkill:Float;
	public static var _voiceSkill:Float;
	public static var _writingSkill:Float; //will use for quality of jokes in animations as well as forum stuff maybe
	public static var _sleep:Float;
	
	public static var yyyy:Int;
	public static var mm:Int;
	public static var dd:Int;
	public static var PM:Bool;
	public static var AMPM:String = "AM";
	public static var h:Int = 8;
	public static var m:Int;
	public static var _stamina:Int = 100;
	
	public static var _name:String = "Cameron";
	public static var _username:String = "ninjamuffin99";
	public static var _forumPosts:Int = 0;
	
	public static var _cash:Int = 0;
	
	public static var _artVectorSkill:Float;
	public static var _artPixelSkill:Float;
	
	public static var _animationVectorSkill:Float;
	public static var _animationPixelSkill:Float;
	
	public static var _hasFlash:Bool = false;
	public static var _hasClipStudio:Bool = false;
	public static var _hasFlashMX:Bool = false;
	
	public static var _flashSkill:Float = 1;
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
	
	public static var _animationQuality:Float = _animationSkill + _artSkill / _flashSkill; // change this to program of choice possibly have it change dependign on which program you're using
	public static var _artQuality:Float;
	public static var _gameQuality:Float;
	public static var _songQuality:Float;
	
	//add in more programs later such as unity or other art programs liek krita
	
	public static var _artProgress:Float = 0;
	public static var _animationProgress:Float = 0;
	public static var _gameProgress:Float = 0;
	public static var _songProgress:Float = 0;
	
	public function new() 
	{
		
	}
	
}
