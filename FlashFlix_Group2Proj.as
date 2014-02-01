package
{
	import flash.display.MovieClip;
	
	import FlashFlixBoxOffice;
	
	public class FlashFlix_Group2Proj extends MovieClip
	{
		var homestage:MovieClip = new homePage_mc;
		var login:Login;
		var signup:createuser;
		var lastmc:MovieClip;
		public function FlashFlix_Group2Proj()
		{
			homestage.x = 0;
			homestage.y = 0;
			addChild(homestage);
			
			signup = new createuser(this);
			signup.visible = false;
			homestage.addChild(signup);
			
			login = new Login(this);
			login.visible = true;
			homestage.addChild(login);
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
		
		public function comingSoon(){
			var cmgsoon:Homepage = new Homepage(this);
			homestage.addChild(cmgsoon);	
			
			var boxOffice:FlashFlixBoxOffice = new FlashFlixBoxOffice();
			homestage.addChild(boxOffice);
		}
	}
}