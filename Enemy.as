package{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.Shape;
    import flash.display.DisplayObject;
    import flash.events.*;
    //sprites are just movieclips without any frames in them
    public class Enemy extends Sprite{
        //_root will signify the root of the document
        private var _root:Object;
        //how quickly the enemy can move
        public var speed:Number;
        //-1 is left, 1 is right
        private var direction:int;
        public function Enemy(){
            //this code will only be run once
            addEventListener(Event.ADDED, beginClass);
            //this code will constantly be run
            addEventListener(Event.ENTER_FRAME, eFrame);
        }
        private function beginClass(event:Event):void{
            //defining the root of the document
            _root = MovieClip(root);
            //defining the movement variables of the enemy
            speed = 5;
            direction = 1;
            //drawing the enemy (it'll be a red circle)
            this.graphics.beginFill(0xFF0000,1);
            this.graphics.drawCircle(12.5,12.5,12.5);
        }
        private function eFrame(event:Event):void{
            //MOVING THE ENEMY
            this.x += speed * direction;
            //checking if touching any invisible markers
            for(var i:int=0;i<_root.invisMarkerHolder.numChildren;i++){
                //the process is very similar to the main guy's testing with other elements
                var targetMarker:DisplayObject = _root.invisMarkerHolder.getChildAt(i);
                if(hitTestObject(targetMarker)){
                    direction *= -1;
                    this.x += speed * direction;
                }
            }
            //TOUCHING THE MAIN CHARACTER
            if(this.hitTestObject(_root.mcMain)){
                //if it touches the main guy while he's jumping
                //and the guy is falling down, not jumping up
                if(_root.mainJumping && _root.jumpSpeed > 0){
					
					_root.gameScore.addToValue(10);
                    //kill this guy
                    this.parent.removeChild(this);
                    //and remove listners
                    this.removeEventListener(Event.ENTER_FRAME, eFrame);
                    } else {
						if(_root.lives.currentValue > 0 ) {
							_root.lives.decrement();
							_root.resetLvl();
						}else {
							_root.gotoAndStop('GameOver');
						}
                    //otherwise, kill the main character
                    
                }
            }
        }
    }
}