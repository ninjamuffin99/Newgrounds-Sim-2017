package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.addons.ui.FlxUIButton;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import source.Stats;


/**
 * ...
 * @author ninjaMuffin
 */
class FileSelect extends FlxState 
{
	private var _file1:FlxUIButton;
	private var _file2:FlxUIButton;
	private var _file3:FlxUIButton;
	
	private var _delete:FlxUIButton;
	private var _delete2:FlxUIButton;
	private var _delete3:FlxUIButton;
	
	override public function create():Void 
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.5, true);
		
		var centerX:Float = FlxG.width / 2;
		
		_file1 = new FlxUIButton(centerX, 100, "File 1", load1);
		_file1.loadGraphic("assets/images/ButtonNoText.png", false, 342, 42);
		_file1.setLabelFormat("assets/data/FeaturedItem.ttf", 40);
		_file1.setGraphicSize(250);
		_file1.setAllLabelOffsets(0, 15);
		_file1.screenCenter(X);
		
		_file2 = new FlxUIButton(centerX, 200, "File 2", load2);
		_file2.loadGraphic("assets/images/ButtonNoText.png", false, 342, 42);
		_file2.setLabelFormat("assets/data/FeaturedItem.ttf", 40);
		_file2.setGraphicSize(250);
		_file2.setAllLabelOffsets(0, 15);
		_file2.screenCenter(X);
		
		_file3 = new FlxUIButton(centerX, 300, "File 3", load3);
		_file3.loadGraphic("assets/images/ButtonNoText.png", false, 342, 42);
		_file3.setLabelFormat("assets/data/FeaturedItem.ttf", 40);
		_file3.setGraphicSize(250);
		_file3.setAllLabelOffsets(0, 15);
		_file3.screenCenter(X);
		
		createDelete();
		
		
		
		add(_file1);
		add(_file2);
		add(_file3);
		
		add(_delete);
		add(_delete2);
		add(_delete3);
		
		Stats._loadFade = true;
		
		super.create();
	}
	
	private function createDelete()
	{
		var offset:Int = 700;
		
		_delete = new FlxUIButton(offset, 100, "Delete Data", delete1);
		_delete.loadGraphic("assets/images/ButtonNoText.png", false, 342, 42);
		_delete.setLabelFormat("assets/data/FeaturedItem.ttf", 30);
		_delete.setGraphicSize(200);
		_delete.setAllLabelOffsets(0, 15);
		
		_delete2 = new FlxUIButton(offset, 200, "Delete Data", delete2);
		_delete2.loadGraphic("assets/images/ButtonNoText.png", false, 342, 42);
		_delete2.setLabelFormat("assets/data/FeaturedItem.ttf", 30);
		_delete2.setGraphicSize(200);
		_delete2.setAllLabelOffsets(0, 15);
		
		
		_delete3 = new FlxUIButton(offset, 300, "Delete Data", delete3);
		_delete3.loadGraphic("assets/images/ButtonNoText.png", false, 342, 42);
		_delete3.setLabelFormat("assets/data/FeaturedItem.ttf", 30);
		_delete3.setGraphicSize(200);
		_delete3.setAllLabelOffsets(0, 15);
	}
	
	private function load1():Void
	{
		FlxG.save.bind("File1");
		loadGame();
	}
	
	private function load2():Void
	{
		FlxG.save.bind("File2");
		loadGame();
	}
	
	private function load3():Void
	{
		FlxG.save.bind("File3");
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
			
			FlxG.camera.fade(FlxColor.BLACK, 0.5, false, loadFade);
		}
	}
	
	private function delete1():Void
	{
		FlxG.save.bind("File1");
		FlxG.save.erase();
		
		if (FlxG.save.data._animationSkill == null)
		{
			FlxG.log.add("Data is null");
		}
	}
	
	private function delete2():Void
	{
		FlxG.save.bind("File2");
		FlxG.save.erase();
		
		if (FlxG.save.data._animationSkill == null)
		{
			FlxG.log.add("Data is null");
		}
	}
	
	private function delete3():Void
	{
		FlxG.save.bind("File3");
		FlxG.save.erase();
		
		if (FlxG.save.data._animationSkill == null)
		{
			FlxG.log.add("Data is null");
		}
	}
	
	private function loadFade():Void
	{
		Stats.load();
		FlxG.switchState(new PlayState());
	}
}