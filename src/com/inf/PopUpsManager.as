package com.inf
{
	import flash.display.Sprite;
	import flash.utils.Dictionary;

	public class PopUpsManager
	{
		private static var _popUps:Vector.<PopUp>;
		public static const OPEN_DEMO:String = "open_demo";
		public static const CLOSE_DEMO:String = "close_demo";
		public static const PRESS_RECORD:String = "press_record";
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
		
		public static function openPopUp(id:String):void{
			for each(var popUp:PopUp in _popUps){
				if(popUp.id == id){
					if(_popUp){
						_presenter.removeChild(_popUp);
					}
					_popUp = _presenter.addChild(popUp) as PopUp;
					_popUp.thumbNail = _thumbNail;
					_popUp.visible = true;
					_popUp.open();
				}
			}
			//return null;
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

