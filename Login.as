﻿package  {
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
		public function Login() {
			
			login.y = 0;
			login.x = 0;
			
			this.addChild(login);
			login.login_btn2.addEventListener(MouseEvent.CLICK, loginUser);
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
			}
			else{
				trace('fail');
			}
		}

	}
	
}
