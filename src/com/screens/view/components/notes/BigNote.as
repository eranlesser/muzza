package com.screens.view.components.notes
{
	import com.gskinner.motion.GTween;
	import com.view.tools.AssetsManager;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class BigNote extends Sprite{
		
		private var _idleAsset:DisplayObject;
		private var _selectedAsset:DisplayObject;
		private var _location:uint;
		private var _value:uint;
		private var _id:String;
		
		public function BigNote(noteValue:uint,loc:uint,channel:String,id:String){
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
			var genericBmp:BitmapData = new BitmapData(100,100, false, 0x999999);
			this.graphics.beginBitmapFill(genericBmp);
			this.graphics.drawCircle(14,14,14);
			this.graphics.endFill();
			var tField:TextField = new TextField();
			tField.text=_value+"";
			//tField.autoSize=TextFieldAutoSize.CENTER;
			tField.width=28;
			tField.height=28;
			tField.x=7;
			tField.y=4;
			tField.setTextFormat(new TextFormat(null,18))
			//addChild(tField);
			//tField.cacheAsBitmap=true;
			//tField.border=true;
			//addChild(_idleAsset);
			//this.scaleX=0.65;
			//this.scaleY=0.65;
			//this.x+=width/2;
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
			if(stt=="selected"){
			this.graphics.lineStyle(5,0x3399FF);
			this.graphics.drawCircle(14,15,15);
			}else{
				this.graphics.lineStyle(0,0x333333);
				this.graphics.drawCircle(14,15,15);
			}
//			removeChildAt(0);
//			if(stt=="selected"){
//				addChild(_selectedAsset);
//			}else{
//				addChild(_idleAsset);
//			}
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