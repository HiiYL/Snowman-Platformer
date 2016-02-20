﻿package{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.Shape;
    import flash.display.DisplayObject;
    import flash.events.*;
    //sprites are just movieclips without any frames in them
    public class Coin extends Sprite{
        //_root will signify the root of the document
        private var _root:Object;
        public function Coin(){
            //this code will only be run once
            addEventListener(Event.ADDED, beginClass);
            //this code will constantly be run
            addEventListener(Event.ENTER_FRAME, eFrame);
        }
        private function beginClass(event:Event):void{
            //defining the root of the document
            _root = MovieClip(root);
            //making an invisible box that will help in placement
            this.graphics.beginFill(0x000000,0);
            this.graphics.drawRect(0,0,25,25);
            //then adding a shape within it that will show the coin
            this.graphics.beginFill(0xFF0000,1);
            this.graphics.drawCircle(12.5,12.5,2.5);
        }
        private function eFrame(event:Event):void{
            //hit testing with the coin and the main guy
            //we'll use math for this!
            if(_root.mcMain.x <= this.x + _root.lvlHolder.x + 10
            && _root.mcMain.x >= this.x + _root.lvlHolder.x - 10
            && _root.mcMain.y <= this.y + 10
            && _root.mcMain.y >= this.y - 10){
				_root.gameScore.addToValue(1);
                this.parent.removeChild(this);
                this.removeEventListener(Event.ENTER_FRAME, eFrame);
            }
        }
    }
}