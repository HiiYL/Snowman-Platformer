﻿package{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.events.*;
    //sprites are just movieclips without any frames in them
    public class Block extends Sprite{
        //_root will signify the root of the document
        private var _root:Object;
        public function Block(){
            //this code will only be run once
            addEventListener(Event.ADDED, beginClass);
            //this code will constantly be run
            addEventListener(Event.ENTER_FRAME, eFrame);
        }
        private function beginClass(event:Event):void{
            //defining the root of the document
            _root = MovieClip(root);
        }
        private function eFrame(event:Event):void{
        }
    }
}