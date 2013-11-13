package com.screens.view.components.notes
{
	import com.gskinner.motion.GTween;
	import com.view.tools.AssetsManager;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
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
			_idleAsset = AssetsManager.getAssetByName(getPrefix(channel)+"_"+noteValue+".png",true);
			_location=loc;
			_value=noteValue;
			_id=id;
			
			init();
		}
		public function get id():String{
			return _id;
		}
		
		private static const WHITE:uint = 0xF4F1D7;
		private static const ORANGE:uint = 0xFF7F00;
		private static const GREEN:uint = 0x60A31C;
		private function init():void{
			
			//addChild(tField);
			//tField.cacheAsBitmap=true;
			//tField.border=true;
			addChild(_idleAsset);
			
			
			//this.scaleX=0.65;
			//this.scaleY=0.65;
			_idleAsset.y=-height-10;
			
			//_selectAsset.visible=false;
			//this.x+=width/2;
			
			
			createCircle(_circle,WHITE);
			createCircle(_getSetCircle,ORANGE);
			createCircle(_playNowCircle,GREEN);
		}
		
		
		
		private function getPrefix(tmbNail:String):String{
			var prefix:String="dn";
			switch(tmbNail){
				case "bottles.png":
					//prefix =  "insCircleDrop";
					//prefix="BOTTLES"
					break;
				case "drum.png":
					//prefix =  "insCircleDrop";
					//prefix="DRUMS"
					break;
				case "bass_flash.jpg":
					//prefix =  "insCircleDrop";
					//prefix="BASS"
					break;
				case "turnTable":
					prefix =  "dj";
					break;
			}
			return prefix;
		}
		private var _color:Shape;
		private var _circle:Shape=new Shape();
		private var _getSetCircle:Shape=new Shape();
		private var _playNowCircle:Shape=new Shape();
		
		private function createCircle(shp:Shape,color:uint):void{
			shp.graphics.lineStyle(4,color);
			shp.graphics.drawCircle(width/2+1,height/2+1,width/2-4);
			shp.x=_idleAsset.x;
			shp.y=_idleAsset.y;
		}
		
		public function get scoreValue():uint{
			switch(_color){
				case _getSetCircle:
					return 1;
					break;
				case _playNowCircle:
					return 2;
					break;
			}
			return 0;
		}
		
		public function get scoreColor():uint{
			switch(_color){
				case _getSetCircle:
					return ORANGE;
					break;
				case _playNowCircle:
					return GREEN;
					break;
			}
			return WHITE;
		}
		
		public function setState(clr:uint):void{
			var color:Shape
			switch(clr){
				case 0:
						color = _circle;
					break;
				case 1:
						color = _getSetCircle;
					break;
				case 2:
						color = _playNowCircle;
					break;
			}
			
			if(_color!=color){
				_color=color;
				
				addChild(color);
			}
			
		}
		
		public function destroy():void{
			removeChildren();
		}
		
		public function get location():uint{
			return _location;
		}
		
		public function get value():uint{
			return _value;
		}
		
		
		
	}
}