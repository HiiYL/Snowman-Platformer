package  {
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	public class PlayButton extends SimpleButton {
		private var _root:Object;

		public function PlayButton() {
			addEventListener( MouseEvent.CLICK, onClickRestart );
			_root = MovieClip(root);
		}
		private function onClickRestart( mouseEvent:MouseEvent ):void 
		{
			this.parent.removeChild(this);
			_root.gotoAndStop('Play');
		}

	}
	
}
