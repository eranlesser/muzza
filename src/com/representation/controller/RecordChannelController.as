package com.representation.controller {
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.ISequance;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.model.sequances.RecordableNotesSequance;
	import com.musicalInstruments.view.recordable.RecordableView;
	import com.notes.INotesChannel;
	import com.notes.NotesChannel;
	import com.representation.ChanelNotesType;
	import com.representation.Representation;
	import com.representation.RepresentationSizes;
	import com.representation.view.Channel;
	import com.screens.model.RecordScreenModel;

	/**
	 * @author eranlesser
	 */
	public class RecordChannelController{
		
		private var _model:				ITimeModel;
		private var _channelView:		INotesChannel;
		private var _recordScreenModel:	RecordScreenModel;
		private var _fetcher:			CoreInstrumentModel;
		private var _instrument:		CoreInstrumentModel
		private var _recordableView:	RecordableView;
		private var _learnedSequance:	ISequance;
		
		public function RecordChannelController(channelView:INotesChannel,instrument:CoreInstrumentModel, recordableView:RecordableView, recordScreenModel:RecordScreenModel):void{
			_model=Metronome.getTimeModel();
			_channelView=channelView;
			_recordScreenModel=recordScreenModel;
			_fetcher = recordScreenModel.instrumentModel;
			_instrument=instrument;
			_recordableView=recordableView;
			init();
		}
		
		
		
		public function get score():Number{
			var goodNotes:int=0;
			var recordedSequance:RecordableNotesSequance = _recordableView.sequance as RecordableNotesSequance;
			_learnedSequance = _fetcher.getSequanceById(_recordScreenModel.learnedSequanceId);
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
		
		public function reset():void{
			_channelView.clearNotes();
			if(_learnedSequance is NoteSequanceModel){//temp
				drawNotes(NoteSequanceModel(_learnedSequance),ChanelNotesType.TEACHER_PLAYING);
			}
		}
		
		
		private function init():void{
			_learnedSequance = _fetcher.getSequanceById(_recordScreenModel.learnedSequanceId);
			if(_learnedSequance is NoteSequanceModel){//temp
				drawNotes(NoteSequanceModel(_learnedSequance),ChanelNotesType.TEACHER_PLAYING);
			}
			if( _fetcher.getSequanceById(_recordScreenModel.recordeSequanceId) is NoteSequanceModel){//temp
				drawNotes(NoteSequanceModel(_fetcher.getSequanceById(_recordScreenModel.recordeSequanceId)),ChanelNotesType.U_PLAYING);
			}
			_recordableView.added.add(noteAdded);
			onTick();
		}
		
		public function start():void{
			_model.tickSignal.add(onTick);
		}
		
		public function stop():void{
			_model.tickSignal.remove(onTick);
			_channelView.setX(-((RepresentationSizes.notesArea)/64)+RepresentationSizes.notesArea/2);
		}
		
		private function onTick():void{
			//if(_model.currentTick>64){
				_channelView.setX((-(_model.currentTick)*(RepresentationSizes.notesArea)/64)+RepresentationSizes.notesArea/2);
			//}
		}
		
		public function get channel():INotesChannel{
			return _channelView;
		}
		
		private function noteAdded(note:SequancedNote):void{
			var noteModel:NoteModel = NotesInstrumentModel(_instrument).getNoteById(note.noteId);
			_channelView.drawNote(note,noteModel.value,note.soundLength,ChanelNotesType.U_PLAYING,noteModel.isFlatOrSharp);
		}
		
		private function drawNotes(sequance:NoteSequanceModel,mode:String):void{
			for each(var note:SequancedNote in sequance.notes){
				var noteModel:NoteModel = NotesInstrumentModel(_instrument).getNoteById(note.noteId);
				_channelView.drawNote(note,noteModel.value,note.soundLength,mode,noteModel.isFlatOrSharp);
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
		
	}
}
