package com.musicalInstruments.palleta
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	

	public class Sounder{
		private var _player:Sound;
		private var _noteId:String;
		private var _soundFile:String;
		public function Sounder(id:String,soundFile:String)
		{
			_soundFile = "../../../assets/sounds/pallet/"+soundFile;
			_noteId=id;
			loadSound(_soundFile);
		}
		
		
		
		public function get noteId():String
		{
			return _noteId;
		}

		public function get soundFile():String
		{
			return _soundFile;
		}

		private function loadSound(_soundFile:String):void{
			_player = new Sound();
			var req:URLRequest = new URLRequest(_soundFile);
			try {
				_player.addEventListener(Event.COMPLETE,onSoundReady);
				_player.load(req);
				//performance - to avoid cutting sound beginings
				var channel:SoundChannel = _player.play();
				channel.stop();
			}
			catch (err:Error) {
				trace(err.message);
			}
			_player.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			
		}
		
		private function onSoundReady(e:Event):void{
			_player.removeEventListener(Event.COMPLETE,onSoundReady);
		}
		
		private function errorHandler(errorEvent:IOErrorEvent):void {
			trace("The sound could not be loaded: " + errorEvent.text);
		}
		
		
		public function play():SoundChannel{
			return _player.play();
		}
		
	}
}