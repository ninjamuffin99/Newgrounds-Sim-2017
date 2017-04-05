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
	
	override public function create():Void 
	{
		var centerX:Float = FlxG.width / 2;
		
		_file1 = new FlxButtonPlus(centerX, 100, load1, "File 1");
		_file2 = new FlxButtonPlus(centerX, 200, load2, "File 2");
		_file3 = new FlxButtonPlus(centerX, 300, load3, "File3");
		Stats._gameSave = new FlxSave();
		
		add(_file1);
		add(_file2);
		add(_file3);
		
		super.create();
	}
	
	private function load1():Void
	{
		Stats._gameSave.bind("File1");
		FlxG.log.add("clickLoad1");
		loadGame();
	}
	
	private function load2():Void
	{
		Stats._gameSave.bind("File2");
		loadGame();
	}
	
	private function load3():Void
	{
		Stats._gameSave.bind("File3");
		loadGame();
	}
	
	private function loadGame():Void
	{
		FlxG.log.add("FileSelectLOadgame");
		//Stats.load();
		//TODO check if file exists then either load the file or create a new one
		FlxG.switchState(new NewGameState());
	}
}