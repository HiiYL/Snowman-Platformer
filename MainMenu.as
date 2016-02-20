package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class MainMenu extends Sprite
	{

		public function MainMenu() 
		{
			var playButton:Sprite = new Sprite();
			playButton.graphics.beginFill(0x666666);
			playButton.graphics.drawRect(300, 300, 100, 100);
			playButton.graphics.endFill();

			addChild(playButton);

			playButton.addEventListener(MouseEvent.CLICK, clickedPlayButton);
		}

		public function  clickedPlayButton():void 
		{
			trace("Clickity Click");
			dispatchEvent(new Event("PLAY_CLICKED"));
		}
	}
	
}
