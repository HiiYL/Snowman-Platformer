package  {
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.Shape;
    import flash.display.DisplayObject;
    import flash.events.*;
	public class Lives extends Counter{
		private var _root:Object;
		private var livesHolder:Sprite;

		public function Lives() {
			// constructor code
			addEventListener(Event.ADDED, beginClass);
			super();
			addToValue(10);
		}
		
		private function beginClass(event:Event):void{
            //defining the root of the document
            _root = MovieClip(root);
		}
		override public function updateDisplay():void
		{
			super.updateDisplay();
			if(livesHolder != null) {
				for(i=0;i<livesHolder.numChildren;i++){
					livesHolder.removeChildAt(i);
				}
			}else {
				livesHolder = new Sprite();
			}

			trace("Drawn " + currentValue + " lives ");
			for(var i:int=0;i<currentValue;i++){
				var newPlacement;
				newPlacement = new Sprite();
				newPlacement.graphics.beginFill(0xFF0000,1);
				newPlacement.graphics.drawCircle(12.5,25,12.5);
				newPlacement.x = 120 + i * newPlacement.width;
				livesHolder.addChild(newPlacement);
				
			}
			_root.addChild(livesHolder);
		}
		public function decrement():void {
			currentValue = currentValue - 1;
			updateDisplay();
		}

	}
	
}
