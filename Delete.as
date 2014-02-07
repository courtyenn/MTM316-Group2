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
			var password1 = deleteUrl.username_txt.text;
			var password2 = deleteUrl.password_txt.text;

			if (password1 == password2) {
				trace("user deleted");
				url = path + "deleteuser.php";
				urlRequest = new URLRequest(url);

				var requestVars: URLVariables = new URLVariables();
				requestVars.id = manager.getUserID();

				trace(url);
				urlRequest.data = urlVariables;
				sendToURL(urlRequest);

			}
			else{
				trace("Passwords do not match.");
			}

		}

	}
}