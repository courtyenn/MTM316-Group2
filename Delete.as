package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*;

	public class Delete extends MovieClip {
		var url: String;
		var urlVariables: URLVariables = new URLVariables;
		var path: String = "http://localhost:1337/code/test/MTM316-Group2/";
		var urlRequest:URLRequest;
		var deleteUrl:delete_mc = new delete_mc;
		var manager:FlashFlix_Group2Proj;

		public function Delete(proj:FlashFlix_Group2Proj) {
			manager = proj;
			deleteUrl.y = 0;
			deleteUrl.x = 0;

			addChild(deleteUrl);
			deleteUrl.login_btn.addEventListener(MouseEvent.CLICK, deleteUser);
		}

		public function deleteUser(e: Event) {
			trace('get HERE NOW');
			var password1 = deleteUrl.password1.text;
			var password2 = deleteUrl.password2.text;

			if (password1 == password2) {
			
			trace("deleting...");
			
			url = path + "DeleteUser.php";

			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.GET;
			//var loader:URLLoader = new URLLoader();
			//loader.dataFormat = URLLoaderDataFormat.VARIABLES.toUpperCase();
			
			var requestVars:URLVariables = new URLVariables();
			requestVars.id = manager.getUserID();
			//requestVars.password = pass;
			
			request.data = requestVars;
			
			var loader:URLLoader = new URLLoader(request);
			
			//trace(url);
			
			
			loader.addEventListener(Event.COMPLETE, onDeleteComplete);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);

			}
			else{
				trace("Passwords do not match.");
			}

		}
		
		public function onDeleteComplete(e:Event){
			trace(e.target.data);
		}

	}
}