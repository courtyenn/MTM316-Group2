package
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*;
	
	public class FlashFlixBoxOffice extends MovieClip
	{
		public static const NUMBER_OF_MOVIES: int = 18;
		
		//var url: String;
		//var urlLoader: URLLoader = new URLLoader();
		var my_loader: Loader = new Loader();
		
		var homePage: MovieClip;
		var movieArray: Array = [];
		var loadedArray: Array = new Array();
		var counter: int = 0;
		var movieObject: MovieClip;
		var startNumber:int = 4;
		
		
		public function FlashFlixBoxOffice()
		{
			homePage = new homePage_mc;
			homePage.x = 0;
			homePage.y = 0;
			addChild(homePage);
			loadConfigFromUrl();
		}
		
		
				
		public function loadConfigFromUrl(): void {
			var urlRequest: URLRequest = new URLRequest("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=6psypq3q5u3wf9f2be38t5fd&limit=" + NUMBER_OF_MOVIES);
			
			var urlLoader: URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, completeHandler);
			
			try {
				urlLoader.load(urlRequest);
			} catch (error: Error) {
				trace("Cannot load : " + error.message);
			}
		}
		
		public function completeHandler(event: Event): void {
			var stringJSON: String;
			stringJSON = String(event.target.data);
			//trace(stringJSON);
			
			//var loader: URLLoader = URLLoader(event.target);
			//trace("completeHandler: " + loader.data);
			
			var data: Object = JSON.parse(stringJSON);
			//trace(data);
			trace("The movie title is: " + data.movies[0].title + ", Rated: " + data.movies[0].mpaa_rating + " Critic's Score: " + data.movies[0].ratings.critics_score + " Audience Score: " + data.movies[0].ratings.audience_score + ", Image: " + data.movies[0].posters.profile);
			//trace("The movie title is: " + data.movies[1].title + ", Rated: " + data.movies[0].mpaa_rating + " Critic's Score: " + data.movies[1].ratings.critics_score + ", Image: " + data.movies[0].posters.profile);
			//All fields from JSON are accessible by theit property names here/
			
			
			for (var i: int = 0; i < NUMBER_OF_MOVIES; i++) {
				movieObject = new movieObject_mc;
				movieArray[i] = movieObject;
				movieArray[i].movieTitle = data.movies[i].title;
				movieArray[i].smallMovieCover = data.movies[i].posters.profile;
				movieArray[i].largeMovieCover = data.movies[i].posters.detailed;
				movieArray[i].criticScore = data.movies[i].ratings.critics_score;
				movieArray[i].criticConsensus = data.movies[i].critics_consensus;
				movieArray[i].audienceScore = data.movies[i].ratings.audience_score;
				movieArray[i].releaseDate = data.movies[i].release_dates.theater;
				movieArray[i].mpaaRating = data.movies[i].mpaa_rating;
				movieArray[i].runtime = data.movies[i].runtime;
				movieObject.x = 10+(10 + movieObject.width) * i;
				movieObject.y = 70;
				my_loader.load(new URLRequest(movieArray[i].smallMovieCover));
				addChild(movieObject);
				movieArray[i].addEventListener(MouseEvent.CLICK, movieClick);
				//movieObject.addChild(my_loader);
			}
			
			
			loadImage();
			/*my_loader.load(new URLRequest(movieArray[0].poster));
			my_loader2.load(new URLRequest(movieArray[1].poster));
			homePage.addChild(my_loader);
			homePage.addChild(my_loader2);*/
		}
		
		function loadImage(): void {
			var loader: Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
			loader.load(new URLRequest(movieArray[counter].smallMovieCover));
		}
		
		function loaded(e: Event): void {
			
			loadedArray.push(e.target.content);
			
			if (counter == movieArray.length - 1) {
				
				for (var i: uint = 0; i < loadedArray.length; i++) {
					loadedArray[i].x = 0;
					movieArray[i].addChild(loadedArray[i]);
				}
			} else {
				counter++;
				loadImage();
			}
		}
		
		public function movieClick(e: MouseEvent): void {
			//trace(e.target.movieTitle);
			my_loader.load(new URLRequest(e.target.largeMovieCover));
			homePage.movieBio.movieTitle.text = e.target.movieTitle;
			homePage.movieBio.criticsConsensus.text = e.target.criticConsensus;
			homePage.movieBio.criticScore.text = "Critic Score: "+e.target.criticScore+"%";
			homePage.movieBio.audienceScore.text = "Audience Score: "+e.target.audienceScore+"%";
			homePage.movieBio.releaseDate.text = "Release Date: "+e.target.releaseDate;
			homePage.movieBio.mpaaRating.text = "MPAA Rating: "+e.target.mpaaRating;
			homePage.movieBio.runtime.text = "Runtime: "+e.target.runtime+" minutes";
			my_loader.x = 50;
			my_loader.y = 20;
			homePage.movieBio.addChild(my_loader);
		}
	}
}