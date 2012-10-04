package com.representation.controller {
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
	import com.screens.view.components.notes.INotesChannel;
	import com.representation.ChanelNotesType;
	import com.representation.RepresentationSizes;
	import com.screens.model.RecordScreenModel;

	/**
	 * @author eranlesser
	 */
	public class RecordChannelController{
		
		private var _model:				ITimeModel;
		private var _channelView:		INotesChannel;
		private var _recordScreenModel:	RecordScreenModel;
		private var _instrumentModel:	CoreInstrumentModel
		private var _learnedSequance:	ISequance;
		private var _recordedSequance:	RecordableNotesSequance;
		private var _instrument:		Instrument;
		
		public function RecordChannelController(channelView:INotesChannel,instrumentModel:CoreInstrumentModel, instrument:Instrument, recordScreenModel:RecordScreenModel):void{
			_model=Metronome.getTimeModel();
			_channelView=channelView;
			_recordScreenModel=recordScreenModel;
			_instrumentModel=instrumentModel;
			_instrument = instrument;
			_learnedSequance = _instrumentModel.getSequanceById(_recordScreenModel.learnedSequanceId);
			_recordedSequance = new RecordableNotesSequance(_recordScreenModel.recordeSequanceId);
			if(_learnedSequance is NoteSequanceModel){//temp
				drawNotes(NoteSequanceModel(_learnedSequance),ChanelNotesType.U_PLAYING);
			}
			if( _instrumentModel.getSequanceById(_recordScreenModel.recordeSequanceId) is NoteSequanceModel){//temp
				//drawNotes(NoteSequanceModel(_instrumentModel.getSequanceById(_recordScreenModel.recordeSequanceId)),ChanelNotesType.U_PLAYING);
			}
			onTick();
		}
		
		public function reset(mode:String):void{
			_channelView.clearNotes();
			if(_learnedSequance is NoteSequanceModel){//temp
				drawNotes(NoteSequanceModel(_learnedSequance),mode);
			}
		}
		
		
		
		public function beginRecord():void{
			_recordedSequance.reset();
			_instrument.noteStopped.add(noteAdded);
		}
		
		public function endRecord():void{
			if(!_recordedSequance.isEmpty){
				//write sequance somewhere
				_instrumentModel.addRecordedSequance(_recordedSequance, _recordScreenModel.beginAtFrame,_recordScreenModel.endAtFrame);
				FileProxy.exportSequance(_recordedSequance, _instrumentModel.thumbNail);
			}
			_instrument.noteStopped.remove(noteAdded);
		}
		
		public function start():void{
			_model.tickSignal.add(onTick);
		}
		
		public function stop():void{
			_model.tickSignal.remove(onTick);
			_channelView.setX(-((RepresentationSizes.notesArea)/64)+RepresentationSizes.notesArea/2);
		}
		
		private function onTick():void{
			
			_channelView.setX((-(_model.currentTick*2)*(RepresentationSizes.notesArea)/64)+RepresentationSizes.notesArea/2);
		}
		
		public function get channel():INotesChannel{
			return _channelView;
		}
		
		public function add(noteId:uint,noteLength:uint,startLocation:uint,octave:uint):SequancedNote{
			return _recordedSequance.add(noteId,startLocation,noteLength,octave);
		}
		
		private function noteAdded(noteId:uint,noteLength:uint,startLocation:uint,octave:uint):void{
			var note:SequancedNote = add(noteId,startLocation,noteLength,octave);
			var noteModel:NoteModel = NotesInstrumentModel(_instrumentModel).getNoteById(note.noteId);
			var learnedSequance:NoteSequanceModel = NoteSequanceModel(_learnedSequance);
			for(var i:uint=0;i<=2;i++){
				var closeNote:SequancedNote;
				closeNote = learnedSequance.getNoteByLocation(note.location+i);
				if(closeNote&&noteModel.id==closeNote.noteId){
					note.location=closeNote.location;
					break;
				}
				closeNote = learnedSequance.getNoteByLocation(note.location-i);
				if(closeNote&&noteModel.id==closeNote.noteId){
					note.location=closeNote.location;
					break;
				}
			}
			_channelView.drawNote(note,noteModel.value,ChanelNotesType.U_PLAYING,noteModel.isFlatOrSharp);
		}
		
		private function drawNotes(sequance:NoteSequanceModel,mode:String):void{
			for each(var note:SequancedNote in sequance.notes){
				var noteModel:NoteModel = NotesInstrumentModel(_instrumentModel).getNoteById(note.noteId);
				_channelView.drawNote(note,noteModel.value,mode,noteModel.isFlatOrSharp);
			}
		}
		
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
		
	}
}
