package com.musicalInstruments.view.components {
	import com.gskinner.motion.GTween;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
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
		
		private var _timer:Timer;
		/**
		 * 
		 *If there are performance issues (sound getting cut) consider creating soundplayer instance for every note 
		 */		
		public function SoundPlayer(soundFile:String){
			_soundFile = soundFile;
			_metronom = Metronome.getTimeModel();
			loadSound();
			_timer = new Timer(120,1);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimer);
		}
		
		public function play(volume:Number=1):void{
			if(_timer.running&&_channel){
				_channel.stop();
				_timer.stop();
			}
			_channel = _sound.play();
			if(_channel){
				var soundTransform:SoundTransform = new SoundTransform(volume);
				_channel.soundTransform = soundTransform;
			}else{
				//throw new Error("!!!!!  no channel available",_soundFile)
				trace("!!!!!  no channel available")
			}
		}
		
		public function stop():void{
			if(_channel){
				//_timer.start();
			}
		}
		
		private function onTimer(e:TimerEvent):void{
			if(_channel){
				_channel.stop();
			}else{
				_timer.stop();
			}
		}
		
		private function onTweenCue(tween:GTween):void{
			if(_channel){
				var soundTransform:SoundTransform = _channel.soundTransform;
				soundTransform.volume = soundTransform.volume-0.10;
				_channel.soundTransform = SoundTransform(soundTransform);
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