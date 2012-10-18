package com.musicalInstruments.model
{
	import com.musicalInstruments.view.components.SoundPlayer;

	public class SequancedNote
	{
		private var _noteId:String;
		private var _location:uint;
		private var _endLocation:uint;
		private var _soundLength:uint;
		private var _octave:uint;
		public function SequancedNote(noteId:String,location:uint,soundLength:uint,octave:uint){
			_noteId = noteId;
			_location = location;
			_soundLength = soundLength;
			_octave=octave;
		}
		
		public function get octave():uint{
			return _octave;
		}
		
		public function get noteId():String{
			return _noteId;
		}
		
		public function get location():uint{
			return _location;
		}
		
		public function set location(loc:uint):void{
			_location=loc;
		}
		
		public function get soundLength():uint{
			return _soundLength;
		}
		
		public function get endLoction():uint{
			return _soundLength+_location;
		}
		
		
	}
}