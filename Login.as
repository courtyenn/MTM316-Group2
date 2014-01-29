package  {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*;
	
	public class Login extends MovieClip{

		public function Login() {
			
			var login:login_mc = new login_mc;
			login.y = 500;
			login.x = 700;
			
			this.addChild(login);
		}

	}
	
}
