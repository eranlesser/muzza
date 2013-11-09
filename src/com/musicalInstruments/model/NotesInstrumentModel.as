package com.musicalInstruments.model
{
	import com.model.FileProxy;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.model.sequances.IRecordableSequance;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.model.sequances.RecordableNotesSequance;
	
	import flash.filesystem.File;

	public class NotesInstrumentModel extends CoreInstrumentModel implements INoteFetcher
	{
		private var _notes:		Vector.<NoteModel>;
		private var _readyNotes:	uint=0;
		public function NotesInstrumentModel(instrument:XML){
			
			super(instrument);
			parseNotes(instrument.notes)
			parseSequances(instrument.sequances.sequance)
		}
		
		
		
		private function parseNotes(notesXML:XMLList):void{
			_notes = new Vector.<NoteModel>();
			for each(var note:XML in notesXML.children()){
				var noteModel:NoteModel = new NoteModel(note);
				noteModel.ready.addOnce(onNoteReady);
				_notes.push(noteModel);
			}
		}

		private function parseSequances(sequancesXML:XMLList):void{
			for each(var sequance:XML in sequancesXML){
				var noteSequanceModel:NoteSequanceModel = new NoteSequanceModel(sequance as XML,this);
				_sequances.push(noteSequanceModel);
			}
			var recordedSequances:Array = FileProxy.getRecordedSequancesFileNames(_thumbNail);
			for each(var file:File in recordedSequances){
				loadNotesSequance(file);
			}
		}
		
		
		public function get notesLength():uint{
			return _notes.length;
		}
		
		public function getNoteById(id:String):NoteModel{
			var ntm:NoteModel;
				for each(var noteModel:NoteModel in _notes){
					if(noteModel.id == id){
						ntm = noteModel;
						break;
					}
				}
			return ntm;
		}
		
		public function getNoteAt(indx:uint):NoteModel{
			return _notes[indx];
		}
		
		override public function addRecordedSequance(sequance:IRecordableSequance,beginAtFrame:uint,endAtFrame:uint):void{
			var recordedSequanceModel:NoteSequanceModel = new NoteSequanceModel(sequance.toXML(),this) as NoteSequanceModel;
			var sequanceModelWithSameId:NoteSequanceModel = getSequanceById(recordedSequanceModel.id) as NoteSequanceModel;
			
			if(sequanceModelWithSameId){
				//appendmode
				//appendSequance(sequanceModelWithSameId,recordedSequanceModel,beginAtFrame,endAtFrame);
				//overide mode
				sequanceModelWithSameId.destroy();
				for each(var newNote:SequancedNote in recordedSequanceModel.notes){
					sequanceModelWithSameId.addNote(newNote);
				}
				//end overide mode
			}else{
				_sequances.push(recordedSequanceModel);
			}
			FileProxy.exportSequance(sequance as RecordableNotesSequance,_thumbNail);
		}
		
		private function onNoteReady():void{
			_readyNotes++;
			if(_readyNotes == _notes.length){
				ready.dispatch();
			}
		}
		private function loadNotesSequance(file:File):void{
			var notesSequanceModel:NoteSequanceModel = new NoteSequanceModel(FileProxy.importSequance(file),this);
			_sequances.push(notesSequanceModel);
		}
		
		private function appendSequance(sequanceModelWithSameId:NoteSequanceModel,recordedSequanceModel:NoteSequanceModel,beginAtFrame:uint,endAtFrame:uint):void{
			var notesToBeRemoved:Vector.<SequancedNote>=new Vector.<SequancedNote>();
			for each(var existingNote:SequancedNote in sequanceModelWithSameId.notes){
				if(existingNote.location >= beginAtFrame && existingNote.location <= endAtFrame){
					notesToBeRemoved.push(existingNote);
				}
			}
			for each(var toBeRemovedNote:SequancedNote in notesToBeRemoved){
				sequanceModelWithSameId.removeNote(toBeRemovedNote);
			}
			
			for each(var newNote:SequancedNote in recordedSequanceModel.notes){
				sequanceModelWithSameId.addNote(newNote);
			}
		}
		
	}
}