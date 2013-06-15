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
	
	public class DroppingNote extends Sprite{
		
		private var _idleAsset:DisplayObject;
		private var _location:uint;
		private var _value:uint;
		private var _id:String;
		public static const WIDTH:uint=22;
		public function DroppingNote(noteValue:uint,loc:uint,channel:String,id:String){
			//trace(getPrefix(channel)+"_IDLE_"+noteValue+".png")
			_idleAsset = AssetsManager.getAssetByName(getPrefix(channel)+"_IDLE_"+noteValue+".png",true);
			_location=loc;
			_value=noteValue;
			_id=id;
			
			init();
		}
		public function get id():String{
			return _id;
		}
		private function init():void{
			
			//addChild(tField);
			//tField.cacheAsBitmap=true;
			//tField.border=true;
			addChild(_idleAsset);
			
			
			this.scaleX=0.65;
			this.scaleY=0.65;
			_idleAsset.y=-height-10;
			
			//_selectAsset.visible=false;
			//this.x+=width/2;
		}
		
		public function set selected(flag:Boolean):void{
			
		}
		
		private function getPrefix(tmbNail:String):String{
			var prefix:String;
			switch(tmbNail){
				case "bottles.png":
					//prefix =  "insCircleDrop";
					prefix="BOTTLES"
					break;
				case "drum.png":
					//prefix =  "insCircleDrop";
					prefix="DRUMS"
					break;
				case "bass_flash.jpg":
					//prefix =  "insCircleDrop";
					prefix="BASS"
					break;
				case "turnTable":
					prefix =  "dj";
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
		
		
		
	}
}