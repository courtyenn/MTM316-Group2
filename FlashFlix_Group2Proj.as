package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.*;
	import FlashFlixBoxOffice;
	
	public class FlashFlix_Group2Proj extends MovieClip
	{
		var homestage:MovieClip = new homePage_mc;
		var login:Login;
		var signup:createuser;
		var lastmc:MovieClip;
		var userId:Number;
		var boxOffice:FlashFlixBoxOffice;
		var cmgsoon:Homepage;
		var browsepage:BrowsePage;
		var settings:settingsmenu_mc;
		
		var browse:infoPage_mc = new infoPage_mc;
		public function FlashFlix_Group2Proj()
		{
		    
			boxOffice = new FlashFlixBoxOffice(this);
			homestage.x = 0;
			homestage.y = 0;
			//homestage.settingsmenu_mc.visible = false;
			addChild(homestage);
			
			signup = new createuser(this);
			signup.visible = false;
			homestage.addChild(signup);
			
			login = new Login(this);
			login.visible = true;
			homestage.addChild(login);
			
			cmgsoon = new Homepage(this);
			
			browse.visible =false;
			//browse.alreadywatched_btn.addEventListener(MouseEvent.CLICK, switchToAlreadyWatched);
			//browse.wantwatch_btn.addEventListener(MouseEvent.CLICK, switchToWantWatch);
			browse.home_btn.addEventListener(MouseEvent.CLICK, goHome);
			
			homestage.addChild(browse);
			
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
		
		public function comingSoon(userid:Number){
			userId = userid;
			//browsepage = new BrowsePage(this, userid);
			//browsepage.visible = false;
			homestage.addChild(cmgsoon);	
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
			homestage.addChild(settings);
			homestage.settings_btn.addEventListener(MouseEvent.CLICK, switchToSettings);
			browse.settings_btn.addEventListener(MouseEvent.CLICK, switchToSettings);
			
		}
		
		public function getUserID():Number{
			return userId;
		}
		
		public function switchToAlreadyWatched(e:Event){
			
			browse.visible = true;
			//browsepage.displayWatchedMovies(userId);
			browse.infoTitle_txt.text = "Browse Movies Already Watched";
			cmgsoon.visible =false;
			boxOffice.visible = false;
			browsepage = new BrowsePage(browse, getUserID());
			homestage.addChild(browsepage);
			
		}
		
		public function switchToWantWatch(e:Event){
			
			browse.visible=true;
			browse.infoTitle_txt.text = "Browse Movies Want To Watch";
			cmgsoon.visible =false;
			boxOffice.visible = false;
			browsepage = new BrowsePage(browse, getUserID());
			homestage.addChild(browsepage);
			browsepage.displayWantToWatchMovies(getUserID());
		}
		
		public function goHome(e:Event){
			browsepage.visible = false;
			cmgsoon.visible = true;
			boxOffice.visible = true;
		}
		
		public function switchToSettings(e:Event){
			trace('get here?');
			settings.visible = true;
		}
		

	}
}