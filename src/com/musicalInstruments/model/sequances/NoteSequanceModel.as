package com.musicalInstruments.model.sequances {
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	

	public class NoteSequanceModel implements ISequance{
		
		private var _notes:				Vector.<SequancedNote>;
		private var _sequanceFetcher:	CoreInstrumentModel;
		private var _id:				uint;
		private var _xml:XML;
		
		public function NoteSequanceModel(xml:XML, sequanceFetcher:CoreInstrumentModel){
			_notes = new Vector.<SequancedNote>();
			_sequanceFetcher = sequanceFetcher;
			parse(xml);
			_xml=xml;
		}
		
		
		public function get id():uint{
			return _id;
		}
		
		public function toXML():XML{
			return _xml;
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
		
		public function removeNote(note:SequancedNote):void{
			//trace("removeNote",_notes.indexOf(note))
			_notes.splice(_notes.indexOf(note),1);
		}
		
		public function addNote(note:SequancedNote):void{
			_notes.push(note);
		}
		
		/**
		 	
		public function get firstNoteLocation():uint{
			// consider using vector.sort()
			var minLocation:uint = 0;
			for each(var note:SequancedNote in _notes){
				if(note.location<minLocation){
					minLocation = note.location;
				}
			}
			return minLocation;
		}
		 * */
		
		private function lastNoteLocation():uint{
			// consider using vector.sort()
			var maxLocation:uint = 0;
			for each(var note:SequancedNote in _notes){
				if(note.location>maxLocation){
					maxLocation = note.location;
				}
			}
			return maxLocation;
		}
		
		public function get notes():Vector.<SequancedNote>{
			return _notes;
		}
		
		public function ended(location:uint):Boolean{
			return (location>lastNoteLocation())
		}
		
		public function destroy():void{
			while(_notes.length>0){
				_notes.pop();
			}
		}
		
		private function parse(xml:XML):void{
			_id = xml.@id;
			for each(var note:XML in xml.note){
				_notes.push(new SequancedNote(note.@id,note.@location,note.@soundLength,note.@octave));
			}
			for each(var subSequance:XML in xml.subSequance){
				var sequance:NoteSequanceModel = _sequanceFetcher.getSequanceById(subSequance.@id) as NoteSequanceModel;
				for each(var snote:SequancedNote in sequance.notes){
					var newSequancedNote:SequancedNote = new SequancedNote(snote.noteId,snote.location + uint(subSequance.@location),snote.soundLength,snote.octave);
					_notes.push(newSequancedNote);
				}
			}
		}
		
	}
}