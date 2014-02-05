package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.xml.*;
	import flash.display.*;

	public class Delete extends MovieClip {
		var url: String;
		var urlVariables: URLVariables = new URLVariables;
		var path: String = "http://localhost/MTM316-Group2/";
		var urlRequest: URLRequest;
		var deleteUr1: delete_mc = new delete_mc;

		public function Delete() {
			deleteUser.y = 0;
			deleteUser.x = 0;

			addChild(deleteUr1);
			deleteUr1.delete_Btn1.addEventListener(MouseEvent.CLICK, deleteUser);
		}

		public function deleteUser(e: Event) {
			var password1 = deleteUr1.username_txt.text;
			var password2 = deleteUr1.password_txt.text;

			if (password1 == password2) {
				trace(user deleted);
				url = path + "deleteuser.php";


				var requestVars: URLVariables = new URLVariables();
				requestVars.username = username;
				requestVars.password = pass;

				var loader: URLLoader = new URLLoader(request);

				trace(url);
				urlRequest.data = urlVariables;
				sendToURL(urlRequest);

			}

		}

	}
}