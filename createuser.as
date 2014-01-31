package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*;
	public class createuser extends MovieClip{

		var url: String;
		var urlVariables:URLVariables = new URLVariables;
		var urlRequest:URLRequest;
		var path:String = "http://localhost:1337/code/test/MTM316-Group2/";
		var register:register_mc = new register_mc;
		
		public function createuser() {
			
			
			this.addChild(register);
			register.goback_btn2.addEventListener(MouseEvent.CLICK, goBack);
			register.signup_btn.addEventListener(MouseEvent.CLICK, signup);
		}
		
		public function goBack(e:Event){
			register.visible = false;
		}
		
		public function signup(e:Event){
			
			trace('Signing up...');
			var pass1 = register.pass1_txt.text;
			var pass2 = register.pass2_txt.text;
			
			if(pass1 == pass2){
				
			var username = register.username_txt.text;
			var fname = register.fname_txt.text;
			var lname = register.lname_txt.text;
			url = path + "createuser2.php";
			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
				
			var requestVars:URLVariables = new URLVariables();
			requestVars.username = username;
			requestVars.password = pass1;
			requestVars.fname = fname;
			requestVars.lname = lname;
				
				request.data = requestVars;
				
				var loader:URLLoader = new URLLoader(request);
			
			trace(url);
			
			
			loader.addEventListener(Event.COMPLETE, onRegisterComplete);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
			}
		}
		
		public function onRegisterComplete(e:Event){
			//var responseVariables:URLVariables = new URLVariables(e.target.data);
			
			register.visible = false;
			trace(e.target.data);
		}

	}
	
}
