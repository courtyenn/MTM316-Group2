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
		var movieBio: movieBio_mc;
		var loadedData:Array = [];
		var movieArray:Array = [];
		var wantFile:String = "file.csv";
		var alreadyFile:String = "already.csv";
		
		public function BrowsePage(browser:infoPage_mc) {
			browse = browser;
			//manager = proj;
			movieBio = new movieBio_mc;
			movieBio.x = 0;
			movieBio.y = 600;
			browse.addChild(movieBio);
			movieBio.criticStars.visible = false;
			movieBio.audiStars.visible = false;
			
		}
		
		public function displayWatchedMovies(userId:Number){
			this.addChild(browse);
			//browse.home_btn.addEventListener(MouseEvent.CLICK, goHome);
			browse.home_btn.addEventListener(MouseEvent.CLICK, goHome);
			url = path + "receiveAlreadyWatched.php";

			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			
			var requestVars:URLVariables = new URLVariables();
			requestVars.userId = userId;
			
			request.data = requestVars;
			
			var loader:URLLoader = new URLLoader(request);
			
			trace(url);
			
			loader.addEventListener(Event.COMPLETE, onWatchedComplete);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
		
		}
		
		public function displayWantToWatchMovies(userId:Number){
			this.addChild(browse);
			browse.home_btn.addEventListener(MouseEvent.CLICK, goHome);
			url = path + "retrieveWantToWatch.php";

			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			
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
			//trace(url);
			
			myLoader.addEventListener(Event.COMPLETE, loadCSVMovies);
			//loader.dataFormat = URLLoaderDataFormat.TEXT;
			myLoader.load(myRequest);
		}
		
		public function onWatchedComplete(e:Event){
			//loadedData:Array = []; NOT NEEDED cuz in global
			var myRequest:URLRequest = new URLRequest(alreadyFile);
			myLoader = new URLLoader();
			//trace(url);
			trace('about to load csv...');
			myLoader.addEventListener(Event.COMPLETE, loadCSVMovies);
			//loader.dataFormat = URLLoaderDataFormat.TEXT;
			myLoader.load(myRequest);
		}
		
		public function goHome(e:Event){
			//trace('hello browser');
			manager.goHome(e);
		}
		
		public function loadCSVMovies(e:Event):void{

			trace("full file:");
			trace(myLoader.data);
			displayMovies(myLoader.data);
			
		}
		
		public function displayMovies(data:String){
			//To load images
			var url:URLRequest;
			var loader:Loader;
			//To load info and placement
			var loadedData = myLoader.data.split("\n");
			var movieObject:test_mc;
			trace("First Line:" );
		
			//trace(loadedData.length);
			for(var i:Number = 0; i< loadedData.length; i++){
				loadedData[i] = loadedData[i].split("|");
			}	
			trace(loadedData[1][16]);
			//trace("Second line, second value:");
			//trace(loadedData[2][8]);
			movieDisplay = new test_mc;
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
					
		
					loader.load(url);
					
					loadImage(movieObject,loader);
					movieObject.title_txt.text = loadedData[m][8];
					mDisplay2.addChild(movieObject);
					}
					
				}
			}
			else{
				for(var z:Number = 1; z < loadedData.length-1; z++){
					movieObject = new test_mc;
					loader = new Loader();
					url = new URLRequest(loadedData[z][12]); //small movie cover
					trace(loadedData[z][12]);
					
					movieObject.x = ((z*135)+85);
					loader.load(url);

					loadImage(movieObject,loader);
				
				movieArray[z] = movieObject;
				movieArray[z].movieid = loadedData[z][1];
				movieArray[z].movieTitle = loadedData[z][8];
				movieArray[z].smallMovieCover = loadedData[z][11];
				movieArray[z].largeMovieCover = loadedData[z][12];
				movieArray[z].criticScore = loadedData[z][24];
				movieArray[z].criticConsensus = loadedData[z][16];
				movieArray[z].audienceScore = loadedData[z][25];
				movieArray[z].releaseDate = loadedData[z][19];
				movieArray[z].mpaaRating = loadedData[z][11];
				movieArray[z].runtime = loadedData[z][29];

				movieDisplay.addChild(movieObject);
				movieArray[z].addEventListener(MouseEvent.CLICK, movieClick);
					
					movieDisplay.addChild(movieObject);
				}
			}
			
		}
		
		public function loadImage(movie:test_mc, pic:Loader){
			movie.addChild(pic);

		}
		
		public function movieClick(e:Event): void {
			trace(e.target.parent.runtime + " looook");
			
			movieBio.movieTitle.text = e.target.parent.movieTitle;
			movieBio.criticConsensus.text = e.target.parent.criticConsensus;
			movieBio.criticScore.text = "Critic Score: "+e.target.parent.criticScore+"%";
			movieBio.audienceScore.text = "Audience Score: "+e.target.parent.audienceScore+"%";
			movieBio.mpaaRating.text = e.target.parent.mpaaRating;
			movieBio.runtime.text = e.target.parent.runtime+" minutes";
			movieBio.releaseDate.text = "Release Date: "+e.target.parent.releaseDate;

		}

	}
	
}
