package  {
	import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.Shape;
    import flash.display.DisplayObject;
    import flash.events.*;
	
	public class mcMain {
		

		public function mcMain() {
			// constructor code
		}

	}
	private function removedFromStage(event:Event):void{
		this.removeEventListener(Event.ENTER_FRAME, moveChar);
	}
	
}
