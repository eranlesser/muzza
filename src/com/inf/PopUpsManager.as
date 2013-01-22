package com.inf
{
	import com.freshplanet.nativeExtensions.Flurry;
	import com.testflightapp.sdk.TestFlight;
	
	import flash.display.Sprite;
	import flash.utils.Dictionary;

	public class PopUpsManager
	{
		private static var _popUps:Vector.<PopUp>;
		public static const OPEN_DEMO:String = "open_demo";
		public static const CLOSE_DEMO:String = "close_demo";
		public static const PRESS_RECORD:String = "press_record";
		public static const END_RECORD:String = "end_record";
		public static const LISTEN:String = "listen";
		public static const TRY_AGAIN:String = "try_again";
		public static const DRUMS:String = "drums";
		public static const BASS:String = "bass";
		public static const DONE:String = "done";
		private static var _presenter:Sprite;
		private static var _popUp:PopUp;
		private static var _thumbNail:String;
		
		public function PopUpsManager(xml:XML,presenter:Sprite)
		{
			_presenter=presenter;
			parse(xml);
		}
		
		private function parse(xml:XML):void{
			_popUps =new Vector.<PopUp>();
			for each(var popup:XML in (xml.popups.popup)){
				_popUps.push(new PopUp(new PopUpModel(popup),this));
			}
		}
		
		public static function getPopUpModel(id:String):PopUpModel{
			for each(var popUp:PopUp in _popUps){
				if(popUp.id == id){
					return popUp.model;
				}
			}
		return null;
		}
		private static var _visitedPopUps:Vector.<PopUp> = new Vector.<PopUp>();
		public static function openPopUp(id:String,title:String="",content:String=""):PopUp{
			for each(var popUp:PopUp in _popUps){
				if(popUp.id == id){
					if(_popUp){
						_presenter.removeChild(_popUp);
					}
					_popUp = _presenter.addChild(popUp) as PopUp;
					_popUp.thumbNail = _thumbNail;
					if(title!=""){
						_popUp.title=title;
					}
					if(content!=""){
						_popUp.content=content;
					}
					_popUp.visible = true;
					_popUp.open();
					if(_visitedPopUps.indexOf(_popUp)>-1 && id!=END_RECORD && id!= LISTEN && id != TRY_AGAIN&& id != CLOSE_DEMO&& id != PRESS_RECORD){
						closePopUp();
					}else{
						_visitedPopUps.push(_popUp);
					}
				}
			}
			TestFlight.submitFeedback("open popup "+id+" , "+_thumbNail);
			Flurry.getInstance().logEvent("open popup "+id+" , "+_thumbNail);
			return _popUp;
		}
		
		public static function closePopUp(hide:Boolean=false):void{
			_popUp.close();
			if(hide){
				_popUp.visible=false;
			}
		}

		public static function set thumbNail(value:String):void
		{
			_thumbNail = value;
		}

	}
}

