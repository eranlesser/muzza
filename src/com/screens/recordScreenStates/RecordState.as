package com.screens.recordScreenStates
{
	import com.constants.Rhythms;
	import com.constants.States;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.components.NoteSequancePlayer;
	import com.musicalInstruments.view.instrument.TapInstrument;
	import com.representation.ChanelNotesType;
	import com.representation.controller.RecordChannelController;
	import com.screens.view.components.notes.DroppingNote;
	import com.screens.view.components.notes.NotesChannel;
	import com.view.MetronomView;
	
	import org.osflash.signals.Signal;

	public class RecordState implements IRecordScreenState
	{
		
		protected var _context:		RecordScreenStateController;
		protected var _complete:		Signal = new Signal();
		protected var _timeModel:		ITimeModel = Metronome.getTimeModel();
		private var _preTicker:MetronomView;
		private var _isRecording:Boolean = false;
		
		public function RecordState(stateController:RecordScreenStateController){
			_context = stateController;
			//=new MetronomView();
		}
		
		public function get complete():Signal{
			return _complete;
		}
		
		public function deActivate():void{
			TapInstrument(_context.instrumentRecorder).deAutoSetOctave();
			//_context.instrumentRecorder.notePlayed.remove(record);
			_timeModel.soundTick.remove(onTimerTick);
			_context.recordChannelController.endRecord();
			_context.stopTimer();
			_context.recordButton.state="idle";
			_context.recordButton.clicked.remove(onRecordBtn);
			_context.practiceButton.clicked.remove(onPracticeClicked);
			//_context.frameRate = Rhythms.DELAY_COUNT;
			_context.notes.stop();
			_context.recordChannelController.stop();
			//_preTicker.active=false;
			_isRecording = false;
			_context.pallet.active = false;
			//_context.notes.backUpsBut.clicked.remove(setBackUps);
			for each(var noteSequencePlayer:NoteSequancePlayer in _context.backUps){
				noteSequencePlayer.stop();
			}
		}
		
		private function setBackUps():void{
			for each(var noteSequencePlayer:NoteSequancePlayer in _context.backUps){
				//if(_context.notes.backUpsBut.selected){
					noteSequencePlayer.play(noteSequencePlayer.getSequance(_context.model.learnedSequanceId));
				//}else{
				//	noteSequencePlayer.stop();
				//}
			}
		}
		
		public function get name():String{
			return States.RECORD;
		}
		private function onPracticeClicked(buttonState:Boolean):void{
			_context.practice();
		}
		
		private function checkNotesMatch(noteId:String):void{
			var match:Boolean = false;
			for each(var curNote:DroppingNote in _toPlayNotes){
				if(noteId==curNote.id){
					//trace("good");
					_context.addScore(1);
					_toPlayNotes.splice(_toPlayNotes.indexOf(curNote),1);
					_context.notes.removeNote(curNote);
					_context.notes.marc(curNote.value,true);
					match = true;
					break;
				}
			}
			if(!match)
				_context.notes.marc(NotesInstrumentModel(_context.model.instrumentModel).getNoteById(noteId).value,false);
		}
		
		public function activate():void{
			_context.recordButton.state="pressed";
			_context.instrumentRecorder.notePlayed.add(checkNotesMatch);
			_context.recordChannelController.reset(ChanelNotesType.TEACHER_PLAYING);
			_context.recordChannelController.start();
			_context.recordButton.clicked.add(onRecordBtn);
			//_context.practiceButton.clicked.add(onPracticeClicked);
			var noteSequance:NoteSequanceModel=NoteSequanceModel(NotesInstrumentModel(_context.model.instrumentModel).getSequanceById(_context.model.learnedSequanceId));
			TapInstrument(_context.instrumentRecorder).autoSetOctave(noteSequance);
			//_preTicker.active=true;
			_context.speed=Rhythms.RECORD_SPEED;
			//_context.notes.backUpsBut.clicked.add(setBackUps);
			_timeModel.soundTick.add(onTimerTick);
			_context.startTimer();
			_context.recordChannelController.beginRecord();
			_context.pallet.active = true;
			setBackUps();
			_context.notes.start();
			_context.resetScore();
		}
		
		
		private function stop():void{
			_complete.dispatch();
		}
		
		private var _toPlayNotes:Vector.<DroppingNote>;
		
		private function onTimerTick():void{
			if(!_isRecording){
				_isRecording = true;
				//_context.frameRate = Rhythms.DELAY_COUNT*((Levels.CURRENT_LEVEL)/100)
			}
			if(_context.model.endAtFrame == _timeModel.currentTick){
				stop();
			}
			_toPlayNotes=(_context.channel as NotesChannel).getNotesInRange(4,_timeModel.currentTick);
			//var curNote:BigNote=getNoteByDistance(4);
			for each(var curNote:DroppingNote in _toPlayNotes){
				//curNote.state="selected";
				//_context.instrumentRecorder.marc(curNote.id,4);
			}
			_context.pallet.onTick(_timeModel.currentTick);
			
			//if(curNote!=_currentNote){
			//	_currentNote=curNote;
			//	_currentNoteIndx=_timeModel.currentTick;
				
		}
		
		
		private function onRecordBtn(buttonState:Boolean):void{
			stop();
		}
		
		
	}
}