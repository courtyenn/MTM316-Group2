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
		
		public function addMWatched(userId:Number,movie:movieObject_mc){			
			addMovie(movie);
			updateWantToWatch(userId, movie.movieid, 'hasWatched');
		}
		
		public function addMWantWatch(userId:Number, movie:movieObject_mc){
			//trace(movie.movieTitle);
			addMovie(movie);
			updateWantToWatch(userId, movie.movieid, 'wantToWatch');
		}
		
		public function addMovie(movie:movieObject_mc){
			url = path + "addmovie.php";

			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			//var loader:URLLoader = new URLLoader();
			//loader.dataFormat = URLLoaderDataFormat.VARIABLES.toUpperCase();
			//trace(movie.runtime + " look here");
			var requestVars:URLVariables = new URLVariables();
			requestVars.movieId = movie.movieid;
			requestVars.mpaaRating = movie.mpaaRating;
			requestVars.movieTitle = movie.movieTitle;
			requestVars.criticScore = movie.criticScore;
			requestVars.audienceScore = movie.criticConsensus;
			requestVars.runtime = movie.runtime;
			requestVars.releaseDate = movie.releaseDate;
			requestVars.smallMovieCover = movie.smallMovieCover;
			requestVars.largeMovieCover = movie.largeMovieCover;
			requestVars.audienceScore = movie.audienceScore;
			requestVars.consensus = movie.criticConsensus;
			//requestVars.hasWatched = true;
			
			
			request.data = requestVars;
			
			var loader:URLLoader = new URLLoader(request);
			
			//trace(url);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
		}
		
		public function updateWantToWatch(userId:Number, movieId:Number, boolVariable:String){
			url = path + "updateusersmovie.php";
			
			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			
			var requestVars:URLVariables = new URLVariables();
			requestVars.movieId = movieId;
			requestVars.userId = userId;
			//requestVars.wantToWatch = 1;
			requestVars[boolVariable] = 1;
			
			request.data = requestVars;
			
			var loader:URLLoader = new URLLoader(request);
			//trace(url);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
		}
		
		public function deleteMovie(deleteVar:String, movieId:Number){
			url = path + "deletemovie.php";
			
			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			
			var requestVars:URLVariables = new URLVariables();
			requestVars.movieId = movieId;
			requestVars[deleteVar] = 1;
			
			request.data = requestVars;
			
			var loader:URLLoader = new URLLoader(request);
			//trace(url);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
		}
	}
	
}
