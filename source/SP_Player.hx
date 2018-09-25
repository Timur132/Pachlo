 package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.math.FlxPoint;
 import flixel.FlxG;
 import flixel.FlxObject;
 

 class SP_Player extends FlxSprite
 {
     //--------------------------------Vars----------------------------------

     var speed:Float = 100;
     var keyboardOn:Bool = true;
     var Mfacing:String = "d";

     //----------------------------------------------------------------------

     public function new(?X:Float=0, ?Y:Float=0)
     {
        //------------------------Something----------------------------------

        super(X, Y);
        setSize(19, 30);
        offset.set(19, 30);

        //-------------------------------------------------------------------

        //-------------------------"Animation"-------------------------------

        loadGraphic(AssetPaths.AS_Demo1Player__png, true, 19, 30);
        animation.add("d", [0], 0, false);
        animation.add("r", [1], 1, false);
        animation.add("l", [2], 2, false);
        animation.add("u", [3], 3, false);

        //-------------------------------------------------------------------
     }

    override public function update(elapsed:Float):Void
    {
        movement();
        super.update(elapsed);
    }

     function movement():Void
     {
        //---------------------------------Vars------------------------------

        var up:Bool = false;
        var down:Bool = false;
        var left:Bool = false;
        var right:Bool = false;

        //-------------------------------------------------------------------

        //-----------------------------Keys----------------------------------

        if(keyboardOn)
        {
            up = FlxG.keys.anyPressed([UP, W]);
            down = FlxG.keys.anyPressed([DOWN, S]);
            left = FlxG.keys.anyPressed([LEFT, A]);
            right = FlxG.keys.anyPressed([RIGHT, D]);
        }

        //-------------------------------------------------------------------

        //-------------------------Angle-------------------------------------

         if (up && down)
            up = down = false;
        if (left && right)
            left = right = false;

        var angle:Float = 0;
        if (up)
        {
            Mfacing = "u";
            angle = -90;
            if (left)
                angle -= 45;
            else if (right)
                angle += 45;
        }
        else if (down)
        {
            Mfacing = "d";
            angle = 90;
            if (left)
                angle += 45;
            else if (right)
                angle -= 45;
        }
        else if (left){
            Mfacing = "l";
            angle = 180;
        }
        else if (right){
            Mfacing = "r";
            angle = 0;
        }
        else angle = 181;

        //-------------------------------------------------------------------

        //-------------------Movement It Self--------------------------------

        if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE) animation.play(Mfacing);
        if(angle <= 180){
            velocity.set(speed, 0);
            velocity.rotate(FlxPoint.weak(0, 0), angle);
        }
        else velocity.set(0, 0);

        //-------------------------------------------------------------------
     }
 }