package  {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*;
	
	public class Login extends MovieClip{

		var url: String;
		var urlVariables:URLVariables = new URLVariables;
		var urlRequest:URLRequest;
		var path:String = "http://localhost/MTM316-Group2/";
		var login:login_mc = new login_mc;
		var register:SimpleButton;
		var manager:FlashFlix_Group2Proj;
		public function Login(proj:FlashFlix_Group2Proj){
			manager = proj;
			login.y = 0;
			login.x = 0;
			
			this.addChild(login);
			register = login.register_btn;
			login.login_btn2.addEventListener(MouseEvent.CLICK, loginUser);
			register.addEventListener(MouseEvent.CLICK, registerUser);
		}
		
		public function loginUser(e:Event){
			var username = login.username_txt.text;
			var pass = login.password_txt.text;
			
			trace("Checking login...");
			
			url = path + "loginuser.php";

			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			//var loader:URLLoader = new URLLoader();
			//loader.dataFormat = URLLoaderDataFormat.VARIABLES.toUpperCase();
			
			var requestVars:URLVariables = new URLVariables();
			requestVars.username = username;
			requestVars.password = pass;
			
			request.data = requestVars;
			
			var loader:URLLoader = new URLLoader(request);
			
			trace(url);
			
			
			loader.addEventListener(Event.COMPLETE, onLoginComplete);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
		}
		
		public function onLoginComplete(e:Event){
			
			//trace(e.target.data);
			var responseVariables:URLVariables = new URLVariables(e.target.data);
			//trace(responseVariables.success);
			
			if(responseVariables.success == "true"){
				trace("Login Complete");
				this.visible = false;
				manager.comingSoon(responseVariables.userId);
			}
			else{
				trace('fail');
			}
		}
		
		public function registerUser(e:Event){
			manager.register();
		}

	}
	
}
