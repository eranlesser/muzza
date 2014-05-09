package com.screens.view.components.notes
{
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class DroppingNote extends Sprite{
		
		private var _idleAsset:DisplayObject;
		private var _location:uint;
		private var _value:uint;
		private var _id:String;
		private var _channel:String;
		private var _mandatory:Boolean;
		public static const WIDTH:uint=22;
		
		public function DroppingNote(noteValue:uint,loc:uint,channel:String,id:String,mandatory:Boolean){
			//trace(getPrefix(channel)+"_IDLE_"+noteValue+".png")
			_location=loc;
			_value=noteValue;
			_id=id;
			_mandatory = mandatory;
			if(channel=="loopee"){
				
			}else{
			_channel=channel;
			if(noteValue==20){
				_idleAsset = AssetsManager.getAssetByName(getPrefix(channel)+"_"+"B"+".png",true);
			}else{
				_idleAsset = AssetsManager.getAssetByName(getPrefix(channel)+"_"+noteValue+".png",true);
			}
			
			
			init();
			}
		}

		public function get mandatory():Boolean
		{
			return _mandatory;
		}

		public function get id():String{
			return _id;
		}
		
		private static const WHITE:uint = 0xF4F1D7;
		private static const ORANGE:uint = 0xFFC736;
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
			
			
			//createCircle(_circle,WHITE,4);
			//createCircle(_getSetCircle,ORANGE,4);
			//createCircle(_playNowCircle,GREEN,6);
			_playNowCircle = new Sprite();
			_getSetCircle = new Sprite();
			_playNowCircle.addChild(AssetsManager.getAssetByName("green_circle.png"));
			_getSetCircle.addChild(AssetsManager.getAssetByName("green_orange.png"));
			_playNowCircle.x=_idleAsset.x+2;
			_playNowCircle.y=_idleAsset.y+2;
			_getSetCircle.x=_idleAsset.x+2;
			_getSetCircle.y=_idleAsset.y+2;
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
		private var _color:Sprite;
		private var _circle:Sprite=new Sprite();
		private var _getSetCircle:Sprite;
		private var _playNowCircle:Sprite;
		
		private function createCircle(shp:Shape,color:uint,wdt:uint):void{
			//shp.graphics.lineStyle(wdt,color);
			//shp.graphics.drawCircle(width/2+1,height/2+1,width/2-4);
			//shp.graphics.endFill();
			shp.x=_idleAsset.x;
			shp.y=_idleAsset.y;
			//shp.cacheAsBitmap = true;
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
			return ORANGE;
		}
		
		public function setState(clr:uint):void{
			
			var color:Sprite
			switch(clr){
				case 0:
						color = _getSetCircle;
					break;
				case 1:
						color = _getSetCircle;
					break;
				case 2:
						color = _playNowCircle;
					break;
			}
			
			if(_color!=color){
				if(_color){
					removeChild(_color);
				}
				_color=color;
				
				addChild(color);
			}
			if(_channel=="turnTable"){
				_color.visible=false;
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