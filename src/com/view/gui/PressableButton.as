package com.view.gui
{
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class PressableButton extends Sprite{
		
		private var _idleStateIcon:DisplayObject;
		private var _pressStateIcon:DisplayObject;
		private var _timeModel:ITimeModel;
		private var _blinkCounter:uint = 0;
		public function PressableButton(idleState:String,pressState:String){
			
			_idleStateIcon=AssetsManager.getAssetByName(idleState);
			_pressStateIcon=AssetsManager.getAssetByName(pressState);
			init();
		}
		private function init():void{
			addChild(_idleStateIcon);
			addChild(_pressStateIcon);
			addEventListener(MouseEvent.MOUSE_DOWN,onTapDown);
			addEventListener(MouseEvent.MOUSE_UP,onTapUp);
			_timeModel = Metronome.getTimeModel();
			state = "idle"
		}
		
		private function onTapDown(e:Event):void{
			state = "press";
		}
		private function onTapUp(e:Event):void{
			state = "idle";
		}
		
		private function set state(stt:String):void{
			if(stt=="idle"){
				_idleStateIcon.visible = true;
				_pressStateIcon.visible = false;
			}else{
				_idleStateIcon.visible = false;
				_pressStateIcon.visible = true;
				
			}
		}
		
		public function blink():void{
			_timeModel.tickSignal.add(onTick);
		}
		public function stop():void{
			_timeModel.tickSignal.remove(onTick);
			
		}
		private function onTick():void{
			_blinkCounter++;
			if(_blinkCounter==4){
				toggleState();
				_blinkCounter=0;
			}
		}
		private function toggleState():void{
			_idleStateIcon.visible = !_idleStateIcon.visible;
			_pressStateIcon.visible = !_pressStateIcon.visible;
		}
		
	}
}