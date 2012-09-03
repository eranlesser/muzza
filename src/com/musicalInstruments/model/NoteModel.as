package com.musicalInstruments.model
{
	import com.musicalInstruments.view.components.SoundPlayer;
	
	import org.osflash.signals.Signal;

	public class NoteModel
	{
		private var _id:uint;
		private var _animationIndex:uint;
		private var _soundFile:String;
		private var _representation:String;
		private var _player:SoundPlayer;
		private var _value:uint;
		private var _isFlatOrSharp:String;
		public var ready:Signal = new Signal();
		public function NoteModel(xml:XML){
			
			parse(xml);
		}
		
		private function parse(xml:XML):void{
			_id = xml.@id;
			_soundFile =  xml.@soundFile;
			_animationIndex = xml.@animationIndex;
			_value = xml.@value;
			_isFlatOrSharp = xml.@isFlatOrSharp;
			_player = new SoundPlayer(_soundFile);
			_player.ready.addOnce(onPlayerReady);
		}
		
		private function onPlayerReady():void{
			ready.dispatch();
		}
		public function get id():uint{
			return _id;
		}
		
		public function get isFlatOrSharp():String{
			return _isFlatOrSharp;
		}
		
		public function get value():uint{
			return _value;
		}
		
		public function get animationIndex():uint{
			return _animationIndex;
		}
		
		public function get soundFile():String{
			return _soundFile;
		}
		
		
		
		public function get player():SoundPlayer{
			return _player;
		}
		
		
		
	}
}