package com.view.gui
{
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	public class ToggleBut extends Sprite
	{
		
		private var _state0:DisplayObject;
		private var _state1:DisplayObject;
		private var _stateIndex:uint=0;
		public var clicked:Signal=new Signal();
		
		public function ToggleBut(state0:String,state1:String){
			_state0=AssetsManager.getAssetByName(state0);
			_state1=AssetsManager.getAssetByName(state1);
			addChild(_state0);
			addEventListener(MouseEvent.CLICK,onClick);
		}
		
		private function onClick(m:MouseEvent):void{
			if(_stateIndex==0){
				state=1;
			}else{
				state=0;
			}
			clicked.dispatch(_stateIndex);
			
		}
		
		public function set state(stt:uint):void{
			_stateIndex=stt;
			removeChildAt(0);
			if(_stateIndex==0){
				addChild(_state0);
			}else{
				addChild(_state1);
			}
		}
		
	}
}