package com.screens.view.components.notes
{
	import com.gskinner.motion.GTween;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class BigNote extends Sprite{
		
		private var _idleAsset:DisplayObject;
		private var _selectedAsset:DisplayObject;
		private var _location:uint;
		private var _value:uint;
		private var _id:String;
		
		public function BigNote(noteValue:uint,channelType:String,loc:uint,channel:String,id:String,isFlatOrSharp:String){
			_idleAsset = AssetsManager.getAssetByName(getPrefix(channel)+"_IDLE_"+noteValue+".png",true);
			_selectedAsset = AssetsManager.getAssetByName(getPrefix(channel)+"_SELECTED_"+noteValue+".png",true);
			_location=loc;
			_value=noteValue;
			_id=id;
			init();
		}
		public function get id():String{
			return _id;
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
		
		public function buzz():void{
			var tween:GTween = new GTween(this.getChildAt(0),0.01,{scaleX:2.2,scaleY:2.2});
			tween.onComplete = buzz3;
		}
		public function buzz2(g:GTween):void{
			var tween:GTween = new GTween(this.getChildAt(0),0.01,{rotation:-12});
			tween.onComplete = buzz3;
		}
		public function buzz3(g:GTween):void{
			var tween:GTween = new GTween(this.getChildAt(0),0.01,{scaleX:1,scaleY:1});
			//tween.onComplete = buzz4;
		}
//		public function buzz4(g:GTween):void{
//			var tween:GTween = new GTween(this.getChildAt(0),0.01,{rotation:-4});
//			tween.onComplete = buzz5;
//		}
//		public function buzz5(g:GTween):void{
//			var tween:GTween = new GTween(this.getChildAt(0),0.01,{rotation:0});
//		}
	}
}