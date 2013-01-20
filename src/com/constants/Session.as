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
		private var _demoClicked:Boolean=false;
		private var _recordClicked:Boolean=false;
		private static var _session:Session;
		private var _recordedScreensGood:Vector.<RecordScreenModel>;
		public function Session(enforcer:enforcer){
			_recordedScreensGood = new Vector.<RecordScreenModel>();
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

		public function get goodScreensLength():int{
			return _recordedScreensGood.length;
		}
		
		public function recordScreenGood(recordScreenModel:RecordScreenModel):Boolean{
			return _recordedScreensGood.indexOf(recordScreenModel)>-1;
		}
		
		public function registerGoodrecoredScreen(scr:RecordScreenModel):void{
			_recordedScreensGood.push(scr);
		}
		
		
		
	}
}

class enforcer{};