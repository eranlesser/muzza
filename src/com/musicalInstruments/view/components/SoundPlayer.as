package com.musicalInstruments.view.components {
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	import org.osflash.signals.Signal;
	

	public class SoundPlayer extends EventDispatcher
	{
		private var _sound:		Sound = new Sound();
		private var _metronom:	ITimeModel;
		private var _soundFile:	String;
		public var soundComplete:Signal=new Signal();
		public var ready:Signal = new Signal();
		
		
		public function SoundPlayer(soundFile:String){
			_soundFile = soundFile;
			
			_metronom = Metronome.getTimeModel();
			if(_soundFile!=""){
			loadSound();
			}
		}
		
		public function play(volume:Number):SoundChannel{
			if(_soundFile==""){
				trace("NO SOUND");
				return null;
			}
			var channel:SoundChannel = _sound.play();
			if(channel == null){
				return channel;
			}
			if(volume<1){
				var soundTransform:SoundTransform = new SoundTransform(volume);
				channel.soundTransform = soundTransform;
			}
			channel.addEventListener(Event.SOUND_COMPLETE,
				function onSoundComplete(e:Event):void{
					e.stopImmediatePropagation();
					e.stopPropagation();
					channel.removeEventListener(Event.SOUND_COMPLETE,onSoundComplete);
					soundComplete.dispatch();
				}
				);
			return channel;
		}
		
		
		
		
		private function loadSound():void{
			_sound = new Sound();
			var req:URLRequest = new URLRequest("../../../../assets/sounds/"+_soundFile);
			try {
				_sound.addEventListener(Event.COMPLETE,onSoundReady);
				_sound.load(req);
				//performance - to avoid cutting sound beginings
				var channel:SoundChannel = _sound.play();
				channel.stop();
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