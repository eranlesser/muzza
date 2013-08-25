package com.musicalInstruments.view.components
{
	import com.metronom.Metronome;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.media.SoundChannel;
	
	import org.osflash.signals.Signal;
	
	public class Pawee extends Sprite{
		private var _soundPlayer:SoundPlayer;
		private var _id:String;
		private var _upState:DisplayObject;
		private var _tapState:DisplayObject;
		public var notePlayed:Signal=new Signal();
		public var noteStopped:Signal=new Signal();
		private var _startTick:uint;
		public function Pawee(data:XML){
			_soundPlayer = new SoundPlayer(data.@sound);
			_id=data.@id;
			_upState = AssetsManager.getAssetByName(data.@image);
			_tapState = AssetsManager.getAssetByName(data.@imageTap);
			x=data.@x;
			init();
		}
		
		private function init():void{
			addChild(_upState);
			addChild(_tapState);
			_tapState.visible=false;
			
			this.addEventListener(TouchEvent.TOUCH_BEGIN,onClick);
			this.addEventListener(MouseEvent.MOUSE_DOWN,onClick);
		}
		
		private function onClick(e:Event):void{
			play();
			stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
		}
		private function play():void{
			var channel:SoundChannel = _soundPlayer.play(1);
			notePlayed.dispatch(_id);
			_startTick = Metronome.getTimeModel().currentTick;
			_upState.visible=false;
			_tapState.visible=true;
		}
		
		private function onMouseUp(e:Event):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_upState.visible=true;
			_tapState.visible=false;
			noteStopped.dispatch(_id,_startTick);
		}	
		
		public function get id():String
		{
			return _id;
		}
		
	}
}