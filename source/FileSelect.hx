package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.util.FlxSave;
import source.Stats;


/**
 * ...
 * @author ninjaMuffin
 */
class FileSelect extends FlxState 
{
	
	private var _file1:FlxButtonPlus;
	private var _file2:FlxButtonPlus;
	private var _file3:FlxButtonPlus;
	
	private var _delete:FlxButtonPlus;
	
	override public function create():Void 
	{
		
		var centerX:Float = FlxG.width / 2;
		
		_file1 = new FlxButtonPlus(centerX, 100, load1, "File 1");
		_file2 = new FlxButtonPlus(centerX, 200, load2, "File 2");
		_file3 = new FlxButtonPlus(centerX, 300, load3, "File3");
		_delete = new FlxButtonPlus(centerX, 400, delete, "delet this");
		
		add(_file1);
		add(_file2);
		add(_file3);
		
		add(_delete);
		
		super.create();
	}
	
	private function load1():Void
	{
		loadGame();
	}
	
	private function load2():Void
	{
		loadGame();
	}
	
	private function load3():Void
	{
		loadGame();
	}
	
	private function loadGame():Void
	{
		FlxG.log.add("FileSelectLOadgame");
		
		//TODO check if file exists then either load the file or create a new one
		
		
		if (FlxG.save.data._animationSkill == null)
		{
			FlxG.switchState(new NewGameState());
		}
		else
		{
			Stats._animationSkill = FlxG.save.data._animationSkill;
			FlxG.log.add("Animation SKill" + Stats._animationSkill);
			FlxG.log.add("Saved Data " + FlxG.save.data._animationSkill);
			FlxG.switchState(new PlayState());
		}
	}
	private function delete():Void
	{
		FlxG.save.erase();
		
		if (FlxG.save.data._animationSkill == null)
		{
			FlxG.log.add("Data is null");
		}
	}
}