package com.musicalInstruments.model
{
	import com.musicalInstruments.view.components.SoundPlayer;
	
	import org.osflash.signals.Signal;

	public class NoteModel
	{
		private var _id:String;
		private var _animationIndex:uint;
		private var _soundFile:String;
		private var _representation:String;
		private var _player:SoundPlayer;
		private var _value:uint;
		private var _isFlatOrSharp:String;
		private var _x:uint; // used for pallet

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
			_x=xml.@x;
			_player = new SoundPlayer(_soundFile);
			_player.ready.addOnce(onPlayerReady);
		}
		
		private function onPlayerReady():void{
			ready.dispatch();
		}
		public function get id():String{
			return _id;
		}
		
		public function get isFlatOrSharp():String{
			return _isFlatOrSharp;
		}
		
		public function get value():uint{
			return _value;
		}
		
		public function get x():uint{
			return _x;
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