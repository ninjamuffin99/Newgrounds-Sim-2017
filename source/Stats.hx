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
	public static var _sleep:Float;
	
	public static var yyyy:Int;
	public static var mm:Int;
	public static var dd:Int;
	public static var h:Int;
	public static var m:Int;
	
	public static var _name:String = "Cameron";
	public static var _username:String = "ninjamuffin99";
	public static var _forumPosts:Int = 0;
	
	public static var _cash:Int = 0;
	
	public static var _flashSkill:Float = 1;
	public static var _photoshopSkill:Float;
	
	public static var _animationQuality:Float = _animationSkill + _artSkill / _flashSkill;
	//add in more programs later such as unity or other art programs liek krita
	
	public function new() 
	{
		
	}
	
}
