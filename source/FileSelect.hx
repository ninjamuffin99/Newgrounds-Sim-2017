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
	private var _gameSave:FlxSave;
	
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
		//FlxG.save.bind("File1");
		//FlxG.log.add("clickLoad1");
		loadGame();
	}
	
	private function load2():Void
	{
		_gameSave.bind("File2");
		loadGame();
	}
	
	private function load3():Void
	{
		_gameSave.bind("File3");
		loadGame();
	}
	
	private function loadGame():Void
	{
		FlxG.log.add("FileSelectLOadgame");
		
		Stats._skillArray = FlxG.save.data.skillArray;
		Stats._levelArray = FlxG.save.data.levelArray;
		
		Stats._animationSkill = FlxG.save.data._animationSkill;
		
		//TODO check if file exists then either load the file or create a new one
		if (FlxG.save.data == null)
		{
			Stats.load();
			FlxG.log.add("data was null");
			FlxG.switchState(new NewGameState());
		}
		if (FlxG.save.data != null)
		{
			FlxG.log.add("savegamefound");
			FlxG.switchState(new PlayState());
		}
		
	}
	private function delete():Void
	{
		/*if (FlxG.save.data != null)
		{
			FlxG.log.add("erased");
			FlxG.save.erase();
		}
		
		if (FlxG.save.data == null)
		{
			FlxG.log.add("Data is null");
		}*/
	}
}