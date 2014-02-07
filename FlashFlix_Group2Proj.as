package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.*;
	import flash.net.*;
	import FlashFlixBoxOffice;
	
	public class FlashFlix_Group2Proj extends MovieClip
	{
		var homestage:MovieClip = new homePage_mc;
		var login:Login;
		var signup:createuser;
		var lastmc:MovieClip;
		var userId:Number;
		var boxOffice:FlashFlixBoxOffice;
		var moviesComingSoon:ComingSoon;
		var cmgsoon:Homepage;
		var browsepage:BrowsePage;
		var settings:settingsmenu_mc;
		var deleteUser:Delete;
		var updateUser:Update;
		var deletePage:delete_mc;
		var updatePage:update_mc;
		var browse:infoPage_mc = new infoPage_mc;
		var browse2:infoPage_mc = new infoPage_mc;
		var browsePage2:BrowsePage;
		
		public function FlashFlix_Group2Proj()
		{
		    
			
			
			boxOffice = new FlashFlixBoxOffice(this);
			homestage.x = 0;
			homestage.y = 0;
			//homestage.settingsmenu_mc.visible = false;
			addChild(homestage);
			
			moviesComingSoon = new ComingSoon(this);
			
			//moviesComingSoon.visible = false;
			
			signup = new createuser(this);
			signup.visible = false;
			homestage.addChild(signup);
			
			login = new Login(this);
			login.visible = true;
			homestage.addChild(login);
			
			cmgsoon = new Homepage(this);
			
			deleteUser = new Delete(this);
			deleteUser.visible = false;
			homestage.addChild(deleteUser);
			
			updateUser = new Update();
			updateUser.visible = false;
			homestage.addChild(updateUser);
			
			browse.visible =false;
			homestage.addChild(browse);
			//browse.alreadywatched_btn.addEventListener(MouseEvent.CLICK, switchToAlreadyWatched);
			browse.wantwatch_btn.addEventListener(MouseEvent.CLICK, switchToWantWatch);
			browse.alreadywatched_btn.addEventListener(MouseEvent.CLICK, switchToAlreadyWatched);
			browsepage = new BrowsePage(browse);
			homestage.addChild(browsepage);
			
			browse2.visible = false;
			browsePage2 = new BrowsePage(browse2);
			browsePage2.visible = false;
			homestage.addChild(browse2);
			browse2.alreadywatched_btn.addEventListener(MouseEvent.CLICK, switchToAlreadyWatched);
			browse2.wantwatch_btn.addEventListener(MouseEvent.CLICK, switchToWantWatch);
			homestage.addChild(browsePage2);
			
			
			
			var boundary:MovieClip = new boundary_mc;
			boundary.x = -1430;
			boundary.y = -1005;
			addChild(boundary);
			
		}
	
		
		public function register(){
			lastmc = login;
			login.visible =false;
			signup.visible =true;
		}
		
		public function goback(){
			login.visible =false;
			signup.visible = false;
			lastmc.visible = true;
		}
		
		public function switchToLogin(){
			signup.visible = false;
			login.visible = true;
		}
		
		public function comingSoon(userid:Number){
			userId = userid;
			//browsepage = new BrowsePage(this, userid);
			//browsepage.visible = false;
			homestage.addChild(cmgsoon);	
			homestage.addChild(moviesComingSoon);
			moviesComingSoon.visible = false;
			moviesComingSoon.movieBio.criticStars.visible = false;
			moviesComingSoon.movieBio.audiStars.visible = false;
			homestage.addChild(boxOffice);
			
			
			settings = new settingsmenu_mc;
			settings.x = 460;
			settings.y = 90;
			settings.width = 500;
			settings.height = 800;
			settings.visible = false;
			settings.exit_btn.addEventListener(MouseEvent.CLICK, function(e:Event):void{
				settings.visible =false;
			});
			settings.delete_btn.addEventListener(MouseEvent.CLICK, switchToDeleteUser);
			settings.update_btn.addEventListener(MouseEvent.CLICK, switchToUpdateUser);
			homestage.addChild(settings);
			homestage.settings_btn.addEventListener(MouseEvent.CLICK, switchToSettings);
			browse.addChild(settings);
			
		}
		

		
		public function getUserID():Number{
			return userId;
		}
		
		public function switchToAlreadyWatched(e:Event){
			
			browse.visible = false;
			browsepage.visible = false;
			cmgsoon.visible =false;
			boxOffice.visible = false;
			moviesComingSoon.visible = false;
			browse2.visible = true;
			browsePage2.visible =true;
			
			browse2.infoTitle_txt.text = "Browse Movies Already Watched";
			
			browsePage2.displayWatchedMovies(getUserID());
			browse2.home_btn.addEventListener(MouseEvent.CLICK, goHome);
			browse2.settings_btn.addEventListener(MouseEvent.CLICK, switchToSettings);
			browse2.cmgsoon_btn.addEventListener(MouseEvent.CLICK, switchToComingSoon);
			//browsepage = new BrowsePage(browse, getUserID());
			//homestage.addChild(browsepage);
			
		}
		
		public function switchToWantWatch(e:Event){
			
			browse2.visible = false;
			browsePage2.visible =false;
			browse.visible=true;
			browse.infoTitle_txt.text = "Browse Movies Want To Watch";
			cmgsoon.visible =false;
			boxOffice.visible = false;
			moviesComingSoon.visible = false;
			browsepage.visible = true;
			//browsepage = new BrowsePage(browse);
			//homestage.addChild(browsepage);
			browsepage.displayWantToWatchMovies(getUserID());
			browse.settings_btn.addEventListener(MouseEvent.CLICK, switchToSettings);
			browse.cmgsoon_btn.addEventListener(MouseEvent.CLICK, switchToComingSoon);
			browse.home_btn.addEventListener(MouseEvent.CLICK, goHome);
		}
		
		public function goHome(e:Event){
			//trace('hello?');
			browsepage.visible = false;
			browsePage2.visible = false;
			cmgsoon.visible = true;
			boxOffice.visible = true;
			moviesComingSoon.visible = false;
		}
		
		public function switchToComingSoon(e:Event){
			
			//home_btn.addEventListener(MouseEvent.CLICK, goHome);
			
			browsepage.visible = false;
			browsePage2.visible =false;
			boxOffice.visible = false;
			cmgsoon.visible = true;
			
			moviesComingSoon.visible = true;
			//homestage.cmgsoon.home_btn.addEventListener(MouseEvent.CLICK, goHome);
		}
		
		public function switchToSettings(e:Event){
			settings.visible = true;
		}
		
		public function switchToDeleteUser(e:Event){
			trace('get HERE');
			deleteUser.visible = true;
			//deletePage = new delete_mc;
			homestage.addChild(deleteUser);
			
		}
		
		public function switchToUpdateUser(e:Event){
			updatePage = new update_mc;
			homestage.addChild(updatePage);
		}

	}
}