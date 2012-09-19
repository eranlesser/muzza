package com.notes
{
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class BigNote extends Sprite{
		
		private var _idleAsset:DisplayObject;
		private var _selectedAsset:DisplayObject;
		private var _location:uint;
		private var _value:uint;
		
		public function BigNote(noteValue:uint,soundLength:uint,channelType:String,loc:uint,channel:String,isFlatOrSharp:String=""){
			_idleAsset = AssetsManager.getAssetByName(getPrefix(channel)+"_IDLE_"+noteValue+".png");
			_selectedAsset = AssetsManager.getAssetByName(getPrefix(channel)+"_SELECTED_"+noteValue+".png");
			_location=loc;
			_value=noteValue;
			init();
		}
		
		private function init():void{
			addChild(_idleAsset);
		}
		
		private function getPrefix(tmbNail:String):String{
			var prefix:String;
			switch(tmbNail){
				case "bottles.png":
					prefix =  "BOTTLES";
					break;
				case "drum.png":
					prefix =  "DRUMS";
					break;
				case "bass_flash.jpg":
					prefix =  "BASS";
					break;
			}
			return prefix;
		}
		
		public function get location():uint{
			return _location;
		}
		
		public function get value():uint{
			return _value;
		}
		
		public function set state(stt:String):void{
			removeChildAt(0);
			if(stt=="selected"){
				addChild(_selectedAsset);
			}else{
				addChild(_idleAsset);
			}
		}
		
		public function get state():String{
			if(getChildAt(0)==_selectedAsset){
				return "selected";
			}else{
				return "idle";
			}
		}
	}
}