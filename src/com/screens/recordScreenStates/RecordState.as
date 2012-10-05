package com.screens.recordScreenStates
{
	import com.constants.Rhythms;
	import com.constants.States;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.instrument.TapInstrument;
	import com.representation.ChanelNotesType;
	import com.representation.controller.RecordChannelController;
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
			_preTicker=new MetronomView();
		}
		
		public function get complete():Signal{
			return _complete;
		}
		
		public function deActivate():void{
			TapInstrument(_context.instrumentRecorder).deAutoSetOctave();
			if(_context.recordChannelController.score>0.75){
				_context.bubble.setText("Good Stuff!!",true)
			}else if(_context.recordChannelController.score>0){
				_context.bubble.setText("Not bad, give it another try.",true)
			}else{
				_context.bubble.setText("Practice some more",true)
			}
			_context.instrumentRecorder.notePlayed.remove(record);
			_timeModel.tickSignal.remove(onTimerTick);
			_context.recordChannelController.endRecord();
			_context.stopTimer();
			_context.recordButton.state="idle";
			_context.recordButton.clicked.remove(onRecordBtn);
			_context.practiceButton.clicked.remove(onPracticeClicked);
			//_context.frameRate = Rhythms.DELAY_COUNT;
			_context.notes.stop();
			_context.recordChannelController.stop();
			_preTicker.active=false;
			_isRecording = false;
		}
		
		public function get name():String{
			return States.RECORD;
		}
		private function onPracticeClicked(buttonState:Boolean):void{
			_context.practice();
		}
		
		public function activate():void{
			_context.bubble.visible=false;
			_context.recordButton.state="pressed";
			_context.instrumentRecorder.notePlayed.addOnce(record);
			_context.recordChannelController.reset(ChanelNotesType.TEACHER_PLAYING);
			_context.recordChannelController.start();
			_context.notes.start();
			_context.recordButton.clicked.add(onRecordBtn);
			_context.practiceButton.clicked.add(onPracticeClicked);
			var noteSequance:NoteSequanceModel=NoteSequanceModel(NotesInstrumentModel(_context.model.instrumentModel).getSequanceById(_context.model.learnedSequanceId));
			TapInstrument(_context.instrumentRecorder).autoSetOctave(noteSequance);
			_preTicker.active=true;
			_context.speed=Rhythms.RECORD_SPEED
		}
		
		private function record(noteId:String):void{
			_timeModel.tickSignal.add(onTimerTick);
			_context.startTimer();
			_context.recordChannelController.beginRecord();
			//_preTicker.active=false;
		}
		
		private function stop():void{
			_complete.dispatch();
		}
		
		private function onTimerTick():void{
			if(!_isRecording){
				_isRecording = true;
				//_context.frameRate = Rhythms.DELAY_COUNT*((Levels.CURRENT_LEVEL)/100)
			}
			if(_context.model.endAtFrame == _timeModel.currentTick){
				stop();
			}
		}
		
		private function onRecordBtn(buttonState:Boolean):void{
			stop();
		}
		
		
	}
}