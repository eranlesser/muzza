package com.musicalInstruments.model.sequances
{
	import com.musicalInstruments.model.SequancedNote;
	
	import flash.geom.Point;
	
	import org.osflash.signals.Signal;
	

	public class RecordableNotesSequance implements ISequance, IRecordableSequance{
		
		private var _notes:Vector.<SequancedNote>;
		private var _id:uint;
		private var _added:Signal;
		
		public function RecordableNotesSequance(id:uint){
			_notes = new Vector.<SequancedNote>();
			_id = id;
			_added = new Signal();
		}
		
		public function get added():Signal{
			return _added;
		}
		
		public function get id():uint{
			return _id;
		}
		
		public function get length():uint{
			return _notes.length;
		}
		
		
		public function add(noteId:String,location:uint,soundLength:uint,octave:uint):SequancedNote{
			if(_notes.length>0 && _notes[_notes.length-1].location == location && _notes[_notes.length-1].noteId == noteId){
				trace("DUPLICATE "+_notes[_notes.length-1].location)
				return null;
			}
			var note:SequancedNote = new SequancedNote(noteId,location,soundLength,octave,"false");
			_notes.push(note);
			_added.dispatch(note);
			return note;
		}
		
		public function getNoteByLocation(location:uint):SequancedNote{
			var note:SequancedNote;
			for each(var sequancedNote:SequancedNote in _notes){
				if(sequancedNote.location == location){
					note = sequancedNote;
				}
			}
			return note;
		}
		
		public function reset():void{
			while(_notes.length>0){
				_notes.pop();
			}
		}
		
		public function get isEmpty():Boolean{
			return (_notes.length == 0)
		}
		
//		private function clean():void{
//			var prevNote:SequancedNote;
//			for(var i:uint=_notes.length-1;i>0;i--){
//				var note:SequancedNote = _notes[i];
//				if(prevNote && prevNote.noteId == note.noteId && prevNote.location == note.location){
//					trace("XXXXX",note.noteId,note.location);
//					_notes.splice(i,1);
//				}
//				prevNote = note;
//			}
//		}
		
		public function toXML():XML{
			//clean();
			var xml:XML=<sequance id={_id} />
			for each(var note:SequancedNote in _notes){
				xml.appendChild(<note id={note.noteId} location={note.location} octave={note.octave} soundLength={note.soundLength} />);
			}
			return xml;
		}
		
		public function destroy():void{
			while(_notes.length>0){
				_notes.pop();
			}
		}
	}
}