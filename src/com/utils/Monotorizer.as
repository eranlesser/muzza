package com.utils
{
	import com.constants.Session;
	import com.sticksports.nativeExtensions.flurry.Flurry;

	public class Monotorizer
	{
		private static var _inited:Boolean = false;
		public function Monotorizer()
		{
			
		}
		
		private static function init():void{
			if(!_inited){
				Flurry.startSession(Session.flurryId);
			}
			_inited = true;
		}
		
		public static function logEvent(category:String,action:String,value:int=-100):void{
			init();
			try{
				Flurry.logEvent(category+"_"+action,{param:value});
			}catch(e:Error){}
		}
		
		public static function logError(errorId:String,description:String,critical:Boolean=true):void{
			
			init();
			try{
				Flurry.logError(errorId,description);
			}catch(e:Error){}
		}
		
		
		
	}
}