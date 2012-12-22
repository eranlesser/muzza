package com.musicalInstruments.model
{
	import com.musicalInstruments.view.components.SoundPlayer;
	
	import flash.geom.Point;

	public class SequancedNote
	{
		private var _noteId:String;
		private var _location:uint;
		private var _endLocation:uint;
		private var _soundLength:uint;
		private var _octave:uint;
		private var _pointToNote:String;
		public function SequancedNote(noteId:String,location:uint,soundLength:uint,octave:uint,pointToNote:String=""){
			_noteId = noteId;
			_location = location;
			_soundLength = soundLength;
			_octave=octave;
			_pointToNote=pointToNote;
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
			return 1+_location;
		}
		
		public function get pointToNote():String{
			return _pointToNote; 
		}
		
	}
}