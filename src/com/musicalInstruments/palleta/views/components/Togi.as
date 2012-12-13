package com.musicalInstruments.palleta.views.components
{
	import com.musicalInstruments.palleta.Sounder;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import org.osflash.signals.Signal;
	
	public class Togi extends Sprite{
		private var _pressed:Sprite;
		private var _idle:Sprite;
		private var _play:Sprite;
		private var _soundPlayer:Sounder;
		public var click:Signal = new Signal();
		public function Togi(data:XML){
			var wdt:uint=40;
			var hgt:uint=50;
			_pressed = new Sprite();
			_pressed.graphics.beginFill(0xFFFFFF,0.5);
			_pressed.graphics.lineStyle(1,0x111111);
			_pressed.graphics.drawRoundRect(0,0,wdt,hgt,8);
			_pressed.graphics.endFill();
			_idle = new Sprite();
			_idle.graphics.beginFill(0xFFFFFF,0);
			_idle.graphics.lineStyle(1,0xEEEEEE);
			_idle.graphics.drawRoundRect(0,0,wdt,hgt,8);
			_idle.graphics.endFill();
			_play = new Sprite();
			_play.graphics.beginFill(0xFFFFFF,1);
			_play.graphics.lineStyle(1,0xEEEEEE);
			_play.graphics.drawRoundRect(0,0,wdt,hgt,8);
			_play.graphics.endFill();
			_soundPlayer = new Sounder(data.@sound);
			init(data.@selected=="true");
		}
		public function play():void{
			_soundPlayer.play();
			_play.visible=true;
		}
		
		public function unPlay():void{
			_play.visible = false;
		}
		
		private function init(isPressed:Boolean):void{
			addChild(_idle);
			addChild(_pressed);
			addChild(_play);
			_pressed.visible=isPressed;
			_play.visible=false;
			this.addEventListener(TouchEvent.TOUCH_TAP,togiClicked);
			//this.addEventListener(TouchEvent.TOUCH_OVER,togiClicked);
		}
		
		private function togiClicked(e:TouchEvent):void{
			_pressed.visible = !_pressed.visible;
			click.dispatch(this);
		}
		
		public function get selected():Boolean{
			return  _pressed.visible;
		}
		
		public function set selected(value:Boolean):void{
			_pressed.visible = value;
		}
			
		
	}
}