package com.representation.controller {
	import com.constants.Session;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.model.FileProxy;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.ISequance;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.model.sequances.RecordableNotesSequance;
	import com.musicalInstruments.view.instrument.Instrument;
	import com.screens.model.RecordScreenModel;
	import com.screens.view.components.notes.NotesChannel;

	/**
	 * @author eranlesser
	 */
	public class RecordChannelController{
		
		private var _model:				ITimeModel;
		private var _channelView:		NotesChannel;
		private var _recordScreenModel:	RecordScreenModel;
		private var _instrumentModel:	CoreInstrumentModel;
		private var _learnedSequance:	ISequance;
		private var _recordedSequance:	RecordableNotesSequance;
		private var _improviseSequnce:	RecordableNotesSequance;
		private var _instrument:		Instrument;
		
		public function RecordChannelController(channelView:NotesChannel,instrumentModel:CoreInstrumentModel, instrument:Instrument,recordScreenModel:RecordScreenModel):void{
			_model=Metronome.getTimeModel();
			_channelView=channelView;
			_recordScreenModel=recordScreenModel;
			_instrumentModel=instrumentModel;
			_instrument = instrument;
			_learnedSequance = _instrumentModel.getSequanceById(_recordScreenModel.learnedSequanceId);
			_recordedSequance = new RecordableNotesSequance(_recordScreenModel.recordeSequanceId);
			_improviseSequnce = new RecordableNotesSequance(_recordScreenModel.improviseSequnceId);
			if(_learnedSequance is NoteSequanceModel){//temp
				_channelView.clearNotes();
				drawNotes(_instrumentModel as NotesInstrumentModel,NoteSequanceModel(_learnedSequance));
				
			_channelView.drawNoteTarget(_recordScreenModel.noteTargetsY,_recordScreenModel.noteTargetsYOffset);
			}
		}
		
		public function reset():void{
			_channelView.clearNotes();
			if(_learnedSequance is NoteSequanceModel){//temp
				drawNotes(_instrumentModel as NotesInstrumentModel,NoteSequanceModel(_learnedSequance));
			}
		}
		
		private function get recordSequance():RecordableNotesSequance{
			if(Session.IMPROVISE_MODE){
				return _improviseSequnce;
			}else{
				return _recordedSequance;
			}
		}
		
		
		public function beginRecord():void{
			recordSequance.reset();
			_instrument.noteStopped.add(noteAdded);
			
		}
		
		public function endRecord():void{
			if(!recordSequance.isEmpty){
				//write sequance somewhere
				_instrumentModel.addRecordedSequance(recordSequance, _recordScreenModel.beginAtFrame,_recordScreenModel.endAtFrame);
				FileProxy.exportSequance(recordSequance, _instrumentModel.thumbNail);
			}
			_instrument.noteStopped.remove(noteAdded);
		}
		
		public function get learnedLength():uint{
			return (_learnedSequance as NoteSequanceModel).notes.length;
		}
		public function get recordedLength():uint{
			return (recordSequance as RecordableNotesSequance).length;
		}
		
		
		public function get channel():NotesChannel{
			return _channelView;
		}
		
		
		private function noteAdded(noteId:String,startLocation:uint,noteLength:uint,octave:uint):void{
			var note:SequancedNote = recordSequance.add(noteId,startLocation,noteLength,octave);
			if(note == null){
				return;
			}
			//var noteModel:NoteModel = NotesInstrumentModel(_instrumentModel).getNoteById(note.noteId);
			//var learnedSequance:NoteSequanceModel = NoteSequanceModel(_learnedSequance);
//			for(var i:uint=0;i<=RecordState.fixNum;i++){
//				var closeNotes:Vector.<SequancedNote>;
//				closeNotes = learnedSequance.getNotesByLocation(note.location+i);
//				if(closeNotes.length>0&&noteModel.id==closeNotes[0].noteId){
//					note.location=closeNotes[0].location;
//					break;
//				}
//				closeNotes = learnedSequance.getNotesByLocation(note.location-i);
//				if(closeNotes.length>0&&noteModel.id==closeNotes[0].noteId){
//					note.location=closeNotes[0].location;
//					break;
//				}
//			}
			//_channelView.drawNote(note,noteModel.value,ChanelNotesType.U_PLAYING,noteModel.isFlatOrSharp);
		}
		
		private function drawNotes(instrumentModel:NotesInstrumentModel,sequance:NoteSequanceModel):void{
			for each(var note:SequancedNote in sequance.notes){
				var noteModel:NoteModel = NotesInstrumentModel(instrumentModel).getNoteById(note.noteId);
				_channelView.drawNote(note,instrumentModel.thumbNail,noteModel.value,noteModel.x);
			}
			
			
		}
		/*
		private function checkNotesMatch(playedNote:SequancedNote,recordeSequance:RecordableNotesSequance):Boolean{
			var estimateLocation:uint = playedNote.location-2;
			for(var i:uint=0;i<=4;i++){
				var recordedNote:SequancedNote=recordeSequance.getNoteByLocation(estimateLocation)
				if(recordedNote&&recordedNote.noteId==playedNote.noteId){
					return true;
				}
				estimateLocation++;
			}
			return false;
		}
		
		public function get score():Number{
			var goodNotes:int=0;
			var recordedSequance:RecordableNotesSequance = _recordedSequance as RecordableNotesSequance;
			_learnedSequance = _instrumentModel.getSequanceById(_recordScreenModel.learnedSequanceId);
			if(_learnedSequance is NoteSequanceModel){
				var learnedNotes:Vector.<SequancedNote>=NoteSequanceModel(_learnedSequance).notes;
				for each(var playedNote:SequancedNote in learnedNotes){
					if(playedNote && checkNotesMatch(playedNote,recordedSequance)){
						goodNotes++;
					}else{
						goodNotes--;
					}
				}
			}
			return goodNotes/NoteSequanceModel(_learnedSequance).notes.length;
		}
		*/
	}
}
