package com.musicalInstruments.view.components {
	import com.gskinner.motion.GTween;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;
	

	public class SoundPlayer extends EventDispatcher
	{
		private var _sound:		Sound = new Sound();
		private var _channel:	SoundChannel;
		private var _metronom:	ITimeModel;
		private var _soundFile:	String;
		public var ready:Signal = new Signal();
		
		
		public function SoundPlayer(soundFile:String){
			_soundFile = soundFile;
			_metronom = Metronome.getTimeModel();
			loadSound();
		}
		
		public function play(volume:Number=1):void{
			if(_channel){
				_channel.stop();
			}
			_channel = _sound.play();
			
		}
		
		public function stop():void{
			if(_channel){
				//_timer.start();
			}
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
			ready.dispatch();
			_sound.removeEventListener(Event.COMPLETE,onSoundReady);
		}
	
		private function errorHandler(errorEvent:IOErrorEvent):void {
			trace("The sound could not be loaded: " + errorEvent.text);
		}
		
	}
}