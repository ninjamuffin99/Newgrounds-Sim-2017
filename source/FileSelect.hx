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
	
	private var _delete:FlxUIButton;
	
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
		
		_delete = new FlxUIButton(centerX, 400, "Delete Data", delete);
		_delete.loadGraphic("assets/images/ButtonNoText.png", false, 342, 42);
		_delete.setLabelFormat("assets/data/FeaturedItem.ttf", 30);
		_delete.setGraphicSize(200);
		_delete.setAllLabelOffsets(0, 15);
		_delete.screenCenter(X);
		
		add(_file1);
		
		add(_delete);
		
		Stats._loadFade = true;
		
		super.create();
	}
	
	private function load1():Void
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
			
			FlxG.camera.fade(FlxColor.BLACK, 0.5, false, loadFade);
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
	
	private function loadFade():Void
	{
		Stats.load();
		FlxG.switchState(new PlayState());
	}
}