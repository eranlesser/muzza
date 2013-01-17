package com.representation.controller {
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.representation.ChanelNotesType;
	import com.representation.RepresentationSizes;
	import com.representation.view.Channel;

	/**
	 * @author eranlesser
	 */
	public class PlayChannelController {
		
		private var _timeModel:		ITimeModel;
		private var _channelView:	Channel;
		private var _instrument:	InstrumentModel;
		private var _fetcher:		CoreInstrumentModel;
		private var _playSequance:uint;
		
		public function PlayChannelController(channelView:Channel,instrument:InstrumentModel,playSequance:uint):void{
			_timeModel=Metronome.getTimeModel();
			_channelView=channelView;
			_instrument=instrument;
			_fetcher=instrument.coreModel;
			_playSequance=playSequance;
//			if(_instrument.visibleAtCycle > 0){
//				_channelView.visible = false;
//			}
		}
		
		public function start():void{
			_timeModel.tickSignal.add(onTick);
			if(_instrument.getSequanceById(_playSequance))
				drawNotes(NoteSequanceModel(_instrument.getSequanceById(_playSequance))); //getSequanceAtCycle(_timeModel.currentCycle);
		}
		
		public function stop():void{
			_timeModel.tickSignal.remove(onTick);
			_channelView.setX(0);
		}
		
		private function onTick():void{
			if(_timeModel.currentTick>64){
				_channelView.setX((-(_timeModel.currentTick-64)*(RepresentationSizes.notesArea)/128)+RepresentationSizes.cueWidth/2);
			}
		}
		
		private function drawNotes(sequance:NoteSequanceModel):void{
			_channelView.clearNotes();
			for each(var note:SequancedNote in sequance.notes){
				var noteModel:NoteModel = NotesInstrumentModel(_instrument.coreModel).getNoteById(note.noteId);
				_channelView.drawNote(note,noteModel.value,note.soundLength,ChanelNotesType.BAND_PLAYING,noteModel.isFlatOrSharp);
			}
		}
		
		
//		private function cycleChanged():void{
//			
//			_channelView.clearNotes();
//			var currentSequanceId:uint = _instrument.getSequanceAtCycle(_timeModel.currentCycle);
//			//trace(_fetcher.getSequanceById(currentSequanceId))
//			var sequance:ISequance = _fetcher.getSequanceById(currentSequanceId);
//			if(sequance is NoteSequanceModel){
//				drawNotes(NoteSequanceModel(sequance));
//			}else if(sequance is VoiceSequanceModel){
//				_channelView.voiceSequance = VoiceSequanceModel(sequance);
//				drawVoice();
//			}
//			
//			if(_instrument.visibleAtCycle == _timeModel.currentCycle){
//				_channelView.visible = true;
//			}
//			if(_instrument.hiddenAtCycle == _timeModel.currentCycle){
//				_channelView.visible = false;
//			}
//				
//		}
		
		
		
	}
}
