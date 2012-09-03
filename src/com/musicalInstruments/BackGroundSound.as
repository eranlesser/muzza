package com.musicalInstruments
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	public class BackGroundSound extends EventDispatcher
	{
		private var _sound:Sound;
		private var _soundFile:String;
		private var _channel:SoundChannel;
		public function BackGroundSound(soundFile:String){
			//_sound = new Sound(new URLRequest(soundFile));
			_soundFile=soundFile;
			loadSound();
		}
		
		public function play():void{
			_channel=_sound.play(0,100);	
		}
		
		public function stop():void{
			_channel.stop();	
		}
		
		private function loadSound():void{
			_sound = new Sound();
			var req:URLRequest = new URLRequest("../../../../assets/sounds/"+_soundFile);
			try {
				_sound.addEventListener(Event.COMPLETE,onSoundReady);
				_sound.load(req);
				//performance - to avoid cutting sound beginings
				_channel = _sound.play();
				_channel.stop();
				
			}
			catch (err:Error) {
				trace(err.message);
			}
			
			_sound.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			
		}
		
		private function onSoundReady(e:Event):void{
			//ready.dispatch();
			_sound.removeEventListener(Event.COMPLETE,onSoundReady);
		}
		
		private function errorHandler(errorEvent:IOErrorEvent):void {
			trace("The sound could not be loaded: " + errorEvent.text);
		}
	}
}