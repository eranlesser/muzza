package com.constants {
	import com.model.FileProxy;
	import com.screens.model.RecordScreenModel;
	import com.screens.view.RecordScreen;
	
	import org.osflash.signals.Signal;

	/**
	 * @author eranlesser
	 */
	public class Session {
		//Determins folder location for saved output
		public static var SONG_NAME:String;
		private static var _session:Session;
		private var _score:int;
		public var goodScreensLength:uint;
		public static var inAppFullVersionId:String="allSongs_1_0";
		private static var _IMPROVISE_MODE:Boolean=false;
		public static const improviseSignal:Signal = new Signal();
		public static const fullVersionSignal:Signal = new Signal();
		public static var DeviceId:uint=2;
		private static var _fullVersionEnabled:Boolean=true;
		public function Session(enforcer:enforcer){
		}
		
		public static function set fullVersionEnabled(flag:Boolean):void{
			_fullVersionEnabled=flag;
			fullVersionSignal.dispatch();
		}
		public static function get fullVersionEnabled():Boolean{
		 return _fullVersionEnabled;	
		}
		
		public static function get IMPROVISE_MODE():Boolean
		{
			return _IMPROVISE_MODE;
		}

		public static function set IMPROVISE_MODE(value:Boolean):void
		{
			_IMPROVISE_MODE = value;
			improviseSignal.dispatch();
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
			FileProxy.setHighScore(scr);
		}
		
		
		
	}
}

class enforcer{};