package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.text.FlxText;
import flash.net.FileReference;

class ST_Demo1Menu extends FlxState
{
    //-----------------------------------------Vars------------------------------------------

    var keyboardOn:Bool = true;
    var text_Controll:FlxText;
    var file_Option:FileReference;

    //---------------------------------------------------------------------------------------

	override public function create():Void
	{
        //-----------------------------------Play Button-------------------------------------

        var button_Menu:FlxButton = new FlxButton(0, 0, "Play", funcClick_button_Menu);
        button_Menu.screenCenter();
        add(button_Menu);

        //-----------------------------------------------------------------------------------

        //--------------------------------Controll Button------------------------------------

        var button_Controll:FlxButton = new FlxButton(0, 0, "        ", funcClick_button_Controll);
        file_Option = new FileReference();
        button_Controll.screenCenter();
        button_Controll.y += 20;
        add(button_Controll);

        //-----------------------------------------------------------------------------------

        //-------------------------------Controll Button Text--------------------------------

        text_Controll = new FlxText(0, 0, 80, "Keyboard");
        text_Controll.screenCenter();
        text_Controll.y += 20;
        text_Controll.x += 13;
        text_Controll.color = 0x505050;
        add(text_Controll);

        //-----------------------------------------------------------------------------------

        super.create();

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

    function funcClick_button_Menu():Void
    {
        FlxG.switchState(new ST_Demo1());
    }

    function funcClick_button_Controll():Void
    {
        
        if(keyboardOn)
        {
            file_Option.save(true, "options.txt");
            text_Controll.text = "Gamepad";
            text_Controll.x += 2;
            add(text_Controll);
        }
        else
        {
            file_Option.save(false, "options.txt");
            text_Controll.text = "Keyboard";
            text_Controll.x -= 2;
            add(text_Controll);
        }
    }
}