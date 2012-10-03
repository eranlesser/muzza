package com.screens.recordScreenStates
{
	import com.constants.States;
	import com.musicalInstruments.view.instrument.TapInstrument;
	
	import org.osflash.signals.Signal;

	public class IdleState implements IRecordScreenState
	{
		protected var _context:	RecordScreenStateController;
		private var _complete:	Signal = new Signal();
		
		public function IdleState(stateController:RecordScreenStateController)
		{
			_context = stateController;
		}
		
		public function get complete():Signal{
			return _complete;
		}
		
		public function deActivate():void{
			_context.recordButton.clicked.remove(onRecordBtn);
			_context.practiceButton.clicked.remove(onPracticeClicked);
			
			
			
			_context.stopTimer();
			_context.notes.stop();
		}
		
		public function get name():String{
			return States.IDLE;
		}
		
		public function activate():void{
			_context.recordButton.state="idle";
			_context.practiceButton.state="idle";
			_context.recordButton.clicked.add(onRecordBtn);
			_context.practiceButton.clicked.add(onPracticeClicked);
			_context.instrumentRecorder.y=_context.model.getRecordInstrumentY();
			_context.instrumentRecorder.octave=0;
			_context.startTimer();
			_context.notes.start();//move cue
			_context.notes.stop();
		}
		
		private function onRecordBtn(buttonState:Boolean):void{
			_context.record();
		}
		private function onListenBtn(buttonState:Boolean):void{
			_context.listen();
		}
		private function onPlayBtn(buttonState:Boolean):void{
			_context.playRecorded();
		}
		private function onPracticeClicked(buttonState:Boolean):void{
			_context.practice();
		}
		
		
		
		
	}
}