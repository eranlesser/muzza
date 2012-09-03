package com.musicalInstruments.model
{
	import com.musicalInstruments.view.components.SoundPlayer;

	public class SequancedNote
	{
		private var _noteId:uint;
		private var _location:uint;
		private var _endLocation:uint;
		private var _soundLength:uint;
		private var _octave:uint;
		public function SequancedNote(noteId:uint,location:uint,soundLength:uint,octave:uint){
			_noteId = noteId;
			_location = location;
			_soundLength = soundLength;
			_octave=octave;
		}
		
		public function get octave():uint{
			return _octave;
		}
		
		public function get noteId():uint{
			return _noteId;
		}
		
		public function get location():uint{
			return _location;
		}
		
		public function get soundLength():uint{
			return _soundLength;
		}
		
		public function get endLoction():uint{
			return _soundLength+_location;
		}
		
		
	}
}