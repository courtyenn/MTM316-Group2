package  {

	import flash.utils.Dictionary;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*;

	public class MovieManager {

		private static var instance:MovieManager;
		private static var allowInstantiation:Boolean;
		
		var comingSoon = [];
		var dictionary:Dictionary = new Dictionary();
		var url: String;
		//var urlVariables:URLVariables = new URLVariables;
		var urlRequest:URLRequest;
		var path:String = "http://localhost:1337/code/test/MTM316-Group2/";
		var register:register_mc = new register_mc;
		var manager:FlashFlix_Group2Proj;
		var myLoader:URLLoader = new URLLoader();
		
		public static function getInstance():MovieManager{
			if (instance == null) {
			allowInstantiation = true;
			instance = new MovieManager();
			allowInstantiation = false;
			}
			return instance;
		}
		public function MovieManager() {
			
			if(!allowInstantiation){
				throw new Error("Error: Use MovieManager.getInstance() instead of new.");
			}
		}
		
		public function addComingSoonCache(id:Number, movie:movieObject_mc){
			dictionary[id] = movie;
			//trace(dictionary[id].movieTitle);
			/*if(dictionary[id] == null){
			dictionary[id] = movie;
			}
			else{
				trace('That id is already in the dictionary');
			}*/
		}
		
		public function addMFavorites(id:Number){
			
		}
		
		public function addMWatched(userId:Number,id:Number){
			//trace("ALREADY WATCHED");
			//trace(id);
			//trace(dictionary[id]);
			
			addMovie(id);
			updateMovieWatched(userId, id);
			
			
		}
		
		public function addMWantWatch(userId:Number, id:Number){
			addMovie(id);
			updateWantToWatch(userId, id);
		}
		
		public function onAddMovieComplete(e:Event){
			trace(e.target.data);
		}
		
		public function addMovie(id:Number){
			url = path + "addmovie.php";

			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			//var loader:URLLoader = new URLLoader();
			//loader.dataFormat = URLLoaderDataFormat.VARIABLES.toUpperCase();
			
			var requestVars:URLVariables = new URLVariables();
			requestVars.movieId = id;
			requestVars.mpaaRating = dictionary[id].mpaaRating;
			requestVars.movieTitle = dictionary[id].movieTitle;
			requestVars.criticScore = dictionary[id].criticScore;
			requestVars.audienceScore = dictionary[id].audienceScore;
			requestVars.runtime = dictionary[id].runtime;
			requestVars.releaseDate = dictionary[id].releaseDate;
			requestVars.smallMovieCover = dictionary[id].smallMovieCover;
			requestVars.largeMovieCover = dictionary[id].largeMovieCover;
			requestVars.hasWatched = true;
			
			
			request.data = requestVars;
			
			var loader:URLLoader = new URLLoader(request);
			
			trace(url);
			
			loader.addEventListener(Event.COMPLETE, onAddMovieComplete);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
		}
		
		public function updateMovieWatched(userId:Number, movieId:Number){
			url = path + "updateusersmovie.php";
			
			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			
			var requestVars:URLVariables = new URLVariables();
			requestVars.movieId = movieId;
			requestVars.userId = userId;
			requestVars.hasWatched = 1;
			//requestVars['watchedMovie'] = true;
			
			request.data = requestVars;
			
			var loader:URLLoader = new URLLoader(request);
			trace(url);
			
			loader.addEventListener(Event.COMPLETE, onMovieWatchedCompleted);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
		}
		
		public function updateWantToWatch(userId:Number, movieId:Number){
			url = path + "updateusersmovie.php";
			
			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			
			var requestVars:URLVariables = new URLVariables();
			requestVars.movieId = movieId;
			requestVars.userId = userId;
			requestVars.wantToWatch = 1;
			//requestVars['watchedMovie'] = true;
			
			request.data = requestVars;
			
			var loader:URLLoader = new URLLoader(request);
			trace(url);
			
			loader.addEventListener(Event.COMPLETE, function(e:Event):void{
				trace('done loading want to watch movies');
			});
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
		}
		
		public function onMovieWatchedCompleted(e:Event){
		trace(e.target.data);
		}
		
		public function onMovieWantWatchCompleted(e:Event){
			trace(e.target.data);
		}
	}
	
}
