package;

import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.FlxG;

class ST_Demo1 extends FlxState
{
	//---------------------------Vars----------------------------------------

	var SPV_Player:SP_Player;
	var OL_Map:FlxOgmoLoader;
	var TM_Walls:FlxTilemap;
	var TM_Background:FlxTilemap;

	//-----------------------------------------------------------------------

	override public function create():Void
	{
		//----------------------------Map------------------------------------
		
		OL_Map = new FlxOgmoLoader(AssetPaths.TM_Demo1__oel);
 		TM_Walls = OL_Map.loadTilemap(AssetPaths.TS_Walls__png, 16, 16, "Walls");
		TM_Background = OL_Map.loadTilemap(AssetPaths.BG_Demo1__png, 2048, 2048, "Background");
		TM_Walls.setTileProperties(0, FlxObject.NONE);
 		TM_Walls.setTileProperties(1, FlxObject.ANY);
		TM_Walls.setTileProperties(2, FlxObject.
		TM_Walls.setTileProperties(3, FlxObject.ANY);
		TM_Walls.setTileProperties(4, FlxObject.ANY);
 		add(TM_Walls);
		add(TM_Background);

		//-------------------------------------------------------------------

		//----------------------Player---------------------------------------

		SPV_Player = new SP_Player();
		OL_Map.loadEntities(placeEntities, "Entities");
		add(SPV_Player);

		//-------------------------------------------------------------------

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(SPV_Player, TM_Walls);
	}

	function placeEntities(entityName:String, entityData:Xml):Void
 	{
    	var x:Int = Std.parseInt(entityData.get("x"));
    	var y:Int = Std.parseInt(entityData.get("y"));
    	if (entityName == "Player")
    	{
        	SPV_Player.x = x;
        	SPV_Player.y = y;
    	}
 	}
}