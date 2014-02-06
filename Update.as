package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*; 
	public class Update extends MovieClip {
		var url:String;
		var urlVariables:URLVariables = new URLVariables;
		var path: String = "http://localhost:1337/code/test/MTM316-Group2/";
		var updateUrl = new update_mc;
		var urlRequest: URLRequest; 
		
		public function Update() {
			updateUrl.y = 0;
			updateUrl.x = 0;
			addChild(updateUrl);
		}
		public function UpdateUser() {
			url = path + "Update.php";
			urlVariables.username = updateUrl.username.text;
			urlVariables.fname = updateUrl.fname.text;
			urlVariables.lname = updateUrl.lname.text;
			urlVariables.password = updateUrl.password.text;


			urlRequest.data = urlVariables;
			trace(urlRequest.data);
			sendToURL(urlRequest);
		}
		trace("Account updated");
	}

}