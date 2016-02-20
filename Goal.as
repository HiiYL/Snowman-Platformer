﻿package{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.Shape;
    import flash.display.DisplayObject;
    import flash.events.*;
    //sprites are just movieclips without any frames in them
    public class Goal extends Sprite{
        //_root will signify the root of the document
        private var _root:Object;
        public function Goal(){
            //this code will only be run once
            addEventListener(Event.ADDED, beginClass);
            //this code will constantly be run
            addEventListener(Event.ENTER_FRAME, eFrame);
        }
        private function beginClass(event:Event):void{
            //defining the root of the document
            _root = MovieClip(root);
            //making an invisible box that will help in placement
            this.graphics.beginFill(0x00FFFF);
            this.graphics.drawRect(0,0,25,25);
        }
        private function eFrame(event:Event):void{
            if(hitTestObject(_root.mcMain)){
                //advancing a level
                _root.lvlCurrent ++;
                _root.resetLvl();
            }
        }
    }
}