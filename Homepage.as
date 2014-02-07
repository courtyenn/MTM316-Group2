package  {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*;
	public class Homepage extends MovieClip{

		var manager:FlashFlix_Group2Proj;
		var home:mainPage_mc = new mainPage_mc;
		var path:String = "http://localhost/GroupProject/";
		public function Homepage(proj:FlashFlix_Group2Proj) {
			manager = proj;
			
			this.addChild(home);
			home.alreadywatched_btn.addEventListener(MouseEvent.CLICK, onAlreadyWatched);
			home.wantwatch_btn.addEventListener(MouseEvent.CLICK, onWantToWatch);
			home.home_btn.addEventListener(MouseEvent.CLICK, goHome);
			home.settings_btn.addEventListener(MouseEvent.CLICK, switchToSettings);
			home.cmgsoon_btn.addEventListener(MouseEvent.CLICK, switchToComingSoon);
			//home.boxoffice_btn.addEventListener(MouseEvent.CLICK, switchToBoxOffice);
		}
		
		public function onAlreadyWatched(e:Event):void{
			
			manager.switchToAlreadyWatched(e);
		}
		
		public function onWantToWatch(e:Event):void{
			manager.switchToWantWatch(e);
		}
		
		public function goHome(e:Event){
			manager.goHome(e);
		}
		
		public function switchToSettings(e:Event){
			manager.switchToSettings(e);
		}
		
		public function switchToComingSoon(e:Event){
			manager.switchToComingSoon(e);
		}
		/*
		public function switchToBoxOffice(e:Event){
			manager.goHome(e);
		}*/
	

	}
	
}
