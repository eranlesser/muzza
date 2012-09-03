package com.gui
{
	import com.musicalInstruments.view.recordable.TapInstrument;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;
	
	public class SpeedSlider extends Sprite
	{
		
		private var _fullSpeed:Sprite;
		private var _halfSpeed:Sprite;
		private var _quarterSpeed:Sprite;
		private var _activeGear:Sprite;
		public var onChange:Signal=new Signal();
		public function SpeedSlider(){
			init();
		}
		
		private function init():void{
			_fullSpeed=getSpeedButton("1");
			_halfSpeed=getSpeedButton("3/4");
			_quarterSpeed=getSpeedButton("1/2");
			addChild(_fullSpeed);
			addChild(_halfSpeed);
			addChild(_quarterSpeed);
			_activeGear=_fullSpeed;
			_halfSpeed.x=25;
			_fullSpeed.x=50;
			_fullSpeed.addEventListener(MouseEvent.CLICK,onClicked);
			_halfSpeed.addEventListener(MouseEvent.CLICK,onClicked);
			_quarterSpeed.addEventListener(MouseEvent.CLICK,onClicked);
			_fullSpeed.addEventListener(TouchEvent.TOUCH_OVER,onClicked);
			_halfSpeed.addEventListener(TouchEvent.TOUCH_OVER,onClicked);
			_quarterSpeed.addEventListener(TouchEvent.TOUCH_OVER,onClicked);
			//activateSpeed(3);
			var tField:TextField=new TextField();
			tField.autoSize=TextFieldAutoSize.LEFT;
			tField.text="Speed:";
			addChild(tField);
			tField.x=-tField.width-6;
			//tField.y=-30;
			tField.setTextFormat(new TextFormat(null,15,0XFFFFFF));
		}
		
		private function onClicked(e:Event):void{
			_activeGear.graphics.beginFill(0x555555);
			_activeGear.graphics.drawRect(0,0,25,25);
			_activeGear.graphics.endFill();
			
			_activeGear=Sprite(e.target);
			
			_activeGear.graphics.beginFill(0x333333);
			_activeGear.graphics.drawRect(0,0,25,25);
			_activeGear.graphics.endFill();
			var speed:String;
			if(_activeGear==_fullSpeed){
				speed="1";
			}else if(_activeGear==_halfSpeed){
				speed="3/4";
			}else{
				speed="1/2";
			}
			onChange.dispatch(speed);
		}
		
		public function reset():void{
			_activeGear.graphics.beginFill(0x555555);
			_activeGear.graphics.drawRect(0,0,25,25);
			_activeGear.graphics.endFill();
			
			_activeGear=_fullSpeed;
			
			_activeGear.graphics.beginFill(0x333333);
			_activeGear.graphics.drawRect(0,0,25,25);
			_activeGear.graphics.endFill();
		}
		
		private function getSpeedButton(speed:String):Sprite{
			var spr:Sprite=new Sprite();
			if(speed=="1"){
				spr.graphics.beginFill(0x333333);
			}else{
				spr.graphics.beginFill(0x555555);
			}
			spr.graphics.drawRect(0,0,25,25);
			spr.graphics.endFill();
			
			var tField:TextField=new TextField();
			tField.autoSize=TextFieldAutoSize.LEFT;
			tField.text=speed;
			spr.addChild(tField);
			tField.x=20-tField.width/2;
			tField.y=8;
			tField.setTextFormat(new TextFormat(null,12,0XFFFFFF));
			tField.mouseEnabled=false;
			
			return spr;
		}
		
		
	}
}