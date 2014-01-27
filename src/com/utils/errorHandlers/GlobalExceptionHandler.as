package com.utils.errorHandlers
{
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.events.UncaughtErrorEvent;

	public class GlobalExceptionHandler
	{
		
		
		
		public function GlobalExceptionHandler(stg:DisplayObject)
		{
			var loaderInfo:LoaderInfo;
			loaderInfo = stg.loaderInfo;
			loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,
				uncaughtErrorHandler);
		}
		
		private function uncaughtErrorHandler(event:UncaughtErrorEvent):void
		{
			if(event.error is Error){
				trace(event.errorID,event.error.message,event.error.getStackTrace())
			}
			event.preventDefault();
		}
	}
}
