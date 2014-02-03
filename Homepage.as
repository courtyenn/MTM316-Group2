package  {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*;
	public class Homepage extends MovieClip{

		var manager:FlashFlix_Group2Proj;
		var home:mainPage_mc = new mainPage_mc;
		var path:String = "http://localhost:1337/code/test/MTM316-Group2/";
		public function Homepage(proj:FlashFlix_Group2Proj) {
			manager = proj;
			
			this.addChild(home);
			home.alreadywatched_btn.addEventListener(MouseEvent.CLICK, onAlreadyWatched);
		}
		
		public function onAlreadyWatched(e:Event):void{
			manager.switchToAlreadyWatched();
		}

	}
	
}
