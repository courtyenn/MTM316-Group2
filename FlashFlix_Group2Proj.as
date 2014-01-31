package
{
	import flash.display.MovieClip;
	
	import FlashFlixBoxOffice;
	
	public class FlashFlix_Group2Proj extends MovieClip
	{
		var homestage:MovieClip = new homePage_mc;
		
		public function FlashFlix_Group2Proj()
		{
			homestage.x = 0;
			homestage.y = 0;
			addChild(homestage);
			//var login:login_mc = new login_mc();
			//var boxOffice:FlashFlixBoxOffice = new FlashFlixBoxOffice();
			//addChild(boxOffice);
			
			/*var login:login_mc = new login_mc;
			login.x = 700;
			login.y = 500;*/
			
			var signup:createuser = new createuser();
			createuser.visible = false;
			signup.addChild(createuser);
			
			var login:Login = new Login();
			login.visible = true;
			homestage.addChild(login);
		}
	}
}