package com.musicalInstruments.model.sequances
{
	import com.musicalInstruments.model.SequancedNote;
	
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
		
		
		public function add(noteId:uint,location:uint,soundLength:uint,octave:uint):SequancedNote{
			var note:SequancedNote = new SequancedNote(noteId,location,soundLength,octave);
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
		
		public function toXML():XML{
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