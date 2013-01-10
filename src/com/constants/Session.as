package com.constants {
	import com.model.FileProxy;
	/**
	 * @author eranlesser
	 */
	public class Session {
		//Determins folder location for saved output
		public static var SONG_NAME:String;
		private var _demoClicked:Boolean=false;
		private var _recordClicked:Boolean=false;
		private static var _session:Session;
		
		public function Session(enforcer:enforcer){
		}
		
		public static function get instance():Session{
			if(!_session){
				_session = new Session(new enforcer());
			}
			return _session;
		}

		public function get demoClicked():Boolean
		{
			return _demoClicked;
		}

		public function set demoClicked(value:Boolean):void
		{
			_demoClicked = value;
		}

		public function get recordClicked():Boolean
		{
			return _recordClicked;
		}

		public function set recordClicked(value:Boolean):void
		{
			_recordClicked = value;
		}
		
		
		
	}
}

class enforcer{};