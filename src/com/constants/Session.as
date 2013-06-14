package com.constants {
	import com.model.FileProxy;
	import com.screens.model.RecordScreenModel;
	import com.screens.view.RecordScreen;

	/**
	 * @author eranlesser
	 */
	public class Session {
		//Determins folder location for saved output
		public static var SONG_NAME:String;
		private static var _session:Session;
		private var _score:int;
		
		public function Session(enforcer:enforcer){
		}
		
		public static function get instance():Session{
			if(!_session){
				_session = new Session(new enforcer());
			}
			return _session;
		}

		public function get score():int{
			return _score;
		}
		public function set score(scr:int):void{
			_score = scr;
		}
		
		
		
	}
}

class enforcer{};