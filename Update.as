package {

	public class Update : MovieClip {
		var url:String;
		var urlVariables:URLVariables = new URLVariables;
		var path: String = "http://localhost/MTM316-Group2/";
		var updateUrl:update_mc = new update_mc;
		var urlRequest: URLRequest; 
		
		public function Update() {
			deleteUser.y = 0;
			deleteUser.x = 0;
			addChild(updateUrl);
		}
		public function UpdateUser() {
			url = path + "Update.php";
			urlVariables.username = update_mc.username.text;
			urlVariables.fname = update_mc.fname.text;
			urlVariables.lname = update_mc.lname.text;
			urlVariables.password = update_mc.password.text;


			urlRequest.data = urlVariables;
			trace(urlRequest.data);
			sendToURL(urlRequest);
		}
		trace("Account updated");
	}

}