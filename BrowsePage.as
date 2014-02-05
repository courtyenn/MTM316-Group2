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
		var myLoader:URLLoader;
		var movieDisplay: MovieClip;
		var movieBio: MovieClip;
		var loadedData:Array = [];
		var movieArray:Array = [];
		var wantFile:String = "file.csv";
		
		public function BrowsePage(browser:infoPage_mc, userId:Number) {
			browse = browser;
			//manager = proj;
			userID = userId;
			
		}
		
		public function displayWatchedMovies(userId:Number){
			this.addChild(browse);
			//browse.home_btn.addEventListener(MouseEvent.CLICK, goHome);
			
		
		}
		
		public function displayWantToWatchMovies(userId:Number){
			this.addChild(browse);
			browse.home_btn.addEventListener(MouseEvent.CLICK, goHome);
			movieBio = new movieBio_mc;
			movieBio.x = 0;
			movieBio.y = 600;
			browse.addChild(movieBio);
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
			//loadedData:Array = []; NOT NEEDED cuz in global
			var myRequest:URLRequest = new URLRequest(wantFile);
			myLoader = new URLLoader();
			trace(url);
			
			myLoader.addEventListener(Event.COMPLETE, loadCSVMovies);
			//loader.dataFormat = URLLoaderDataFormat.TEXT;
			myLoader.load(myRequest);
		}
		
		public function goHome(e:Event){
			manager.goHome(e);
		}
		
		public function loadCSVMovies(e:Event):void{

			trace("full file:");
			trace(myLoader.data);
			displayMovies(myLoader.data);
			/*var myRequest:URLRequest = new URLRequest(url);
			var loadedData:Array = [];
			
			myLoader = new URLLoader();
			myLoader.addEventListener(Event.COMPLETE, onload);
			myLoader.load(myRequest);*/
			
		}
		
		public function displayMovies(data:String){
			//To load images
			var url:URLRequest;
			var loader:Loader;
			//To load info and placement
			var loadedData = myLoader.data.split("\n");
			var movieObject:test_mc;
			trace("First Line:" );
			trace(loadedData[1]);
			trace(loadedData.length);
			for(var i:Number = 0; i< loadedData.length; i++){
				loadedData[i] = loadedData[i].split("|");
			}
			//trace("Second line, second value:");
			//trace(loadedData[2][8]);
			movieDisplay = new movieDisplay_mc;
			movieDisplay.y = 300;
			movieDisplay.x = -200;
			
			//movieDisplay.height = 1000;
			//movieDisplay.width = 1400;
			this.addChild(movieDisplay);
			if(loadedData.length > 12){
				var rows:Number = (loadedData.length % 10);
				for(var j:Number = 0; j< rows; j++){
					var mDisplay2:movieDisplay_mc = new movieDisplay_mc;
					mDisplay2.x = -200;
					mDisplay2.y = (j * 200) +300;
					this.addChild(mDisplay2);
					for(var m:Number=1; m < loadedData.length-1; m++){
					loader = new Loader();
					url = new URLRequest(loadedData[m][12]); //small movie cover
					movieObject = new test_mc;
					movieObject.x = ((z*135)+85);
					
					loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event){
						
					});
					loader.load(url);
					
					loadImage(movieObject,loader);
					movieObject.title_txt.text = loadedData[m][8];
					mDisplay2.addChild(movieObject);
					}
					
				}
			}
			else{
				for(var z:Number = 1; z < loadedData.length-1; z++){
					loader = new Loader();
					url = new URLRequest(loadedData[z][12]); //small movie cover
					movieObject = new test_mc;
					movieObject.x = ((z*135)+85);
					
					loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event){
						
					});
					loader.load(url);
					
					loadImage(movieObject,loader);
					var tempMovie:MovieClip = new movieBio_mc;
					tempMovie.movieTitle.text = loadedData[z][8];
					tempMovie.criticsConsensus.text = loadedData[z][8];
					tempMovie.criticScore.text = "Critic Score: "+loadedData[z][8]+"%";
					tempMovie.audienceScore.text = "Audience Score: "+loadedData[z][8]+"%";
					tempMovie.mpaaRating.text = loadedData[z][8];
					tempMovie.runtime.text = loadedData[z][8]+" minutes";
			/*movieBio.releaseDate.text = "Release Date: "+e.target.releaseDate;
			movieBio.mpaaRating.text = "MPAA Rating: "+e.target.mpaaRating;
			movieBio.runtime.text = "Runtime: "+e.target.runtime+" minutes";*/
					movieObject.addEventListener(MouseEvent.CLICK, function(e:Event):void{
						
						movieBio.movieTitle.text = tempMovie.movieTitle.text;
						movieBio.movieTitle.text = tempMovie.movieTitle.text;
						movieBio.movieTitle.text = tempMovie.movieTitle.text;
					});
					//movieObject.title_txt.text = loadedData[z][8];
					
					movieDisplay.addChild(movieObject);
				}
			}
			
		}
		
		public function loadImage(movie:test_mc, pic:Loader){
			movie.addChild(pic);

		}
		
		public function movieClick(index:Number): void {
			//trace(loadedData2[index][8]);
			//trace(e.target.largeMovieCover);
			//MovieManager.getInstance();
			//my_loader.load(new URLRequest(e.target.largeMovieCover));
			
			/*movieBio.criticsConsensus.text = e.target.criticConsensus;
			movieBio.criticScore.text = "Critic Score: "+e.target.criticScore+"%";
			movieBio.audienceScore.text = "Audience Score: "+e.target.audienceScore+"%";
			movieBio.mpaaRating.text = e.target.mpaaRating;
			movieBio.runtime.text = e.target.runtime+" minutes";*/
			/*movieBio.releaseDate.text = "Release Date: "+e.target.releaseDate;
			movieBio.mpaaRating.text = "MPAA Rating: "+e.target.mpaaRating;
			movieBio.runtime.text = "Runtime: "+e.target.runtime+" minutes";*/
			//my_loader.x = 50;
			//my_loader.y = 20;
			//movieBio.addChild(my_loader);
		}

	}
	
}
