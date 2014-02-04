package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*;
	public class BrowsePage extends MovieClip{

		var url: String;
		var urlVariables:URLVariables = new URLVariables;
		var urlRequest:URLRequest;
		var path:String = "http://localhost:1337/code/test/MTM316-Group2/";
		var browse:infoPage_mc = new infoPage_mc;
		var register:SimpleButton;
		var manager:FlashFlix_Group2Proj;
		var userID:Number;
		
		public function BrowsePage(browser:infoPage_mc, userId:Number) {
			browse = browser;
			//manager = proj;
			userID = userId;
			
		}
		
		public function displayWatchedMovies(userId:Number){
			this.addChild(browse);
			browse.home_btn.addEventListener(MouseEvent.CLICK, goHome);
			
		
		}
		
		public function displayWantToWatchMovies(userId:Number){
			this.addChild(browse);
			browse.home_btn.addEventListener(MouseEvent.CLICK, goHome);
			
				url = path + "retrieveWantToWatch.php";

			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			//var loader:URLLoader = new URLLoader();
			//loader.dataFormat = URLLoaderDataFormat.VARIABLES.toUpperCase();
			
			var requestVars:URLVariables = new URLVariables();
			requestVars.userId = userId;
			
			request.data = requestVars;
			
			var loader:URLLoader = new URLLoader(request);
			
			trace(url);
			
			
			loader.addEventListener(Event.COMPLETE, onWantComplete);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
			
		}
		
		public function onWantComplete(e:Event){
			trace(e.target.data);
		}
		
		public function goHome(e:Event){
			manager.goHome(e);
		}

	}
	
}
