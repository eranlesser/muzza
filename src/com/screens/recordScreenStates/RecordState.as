package com.screens.recordScreenStates
{
	import com.constants.States;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.recordable.TapInstrument;
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
			_context.bandActive=false;
			_context.instrumentRecorder.notePlayed.remove(record);
			_timeModel.tickSignal.remove(onTimerTick);
			_context.instrumentRecorder.endRecord();
			_context.stopTimer();
			_context.recordButton.clicked.remove(onRecordBtn);
			//_context.frameRate = Rhythms.DELAY_COUNT;
			_context.representation.stop();
			_context.recordChannelController.stop();
			_preTicker.active=false;
			_isRecording = false;
		}
		
		public function get name():String{
			return States.RECORD;
		}
		
		public function activate():void{
			_context.bandActive=true;
			_context.bubble.visible=false;
			_context.recordButton.state="off";
			_context.instrumentRecorder.notePlayed.addOnce(record);
			_context.recordChannelController.reset();
			_context.recordChannelController.start();
			_context.representation.start();
			_context.recordButton.clicked.add(onRecordBtn);
			var noteSequance:NoteSequanceModel=NoteSequanceModel(NotesInstrumentModel(_context.model.instrumentModel).getSequanceById(_context.model.learnedSequanceId));
			TapInstrument(_context.instrumentRecorder).autoSetOctave(noteSequance);
			_preTicker.active=true;
		}
		
		private function record(noteId:String):void{
			_timeModel.tickSignal.add(onTimerTick);
			_context.startTimer();
			_context.instrumentRecorder.beginRecord();
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