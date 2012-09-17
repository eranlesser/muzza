package com.screens.recordScreenStates
{
	import com.constants.States;
	import com.musicalInstruments.view.recordable.TapInstrument;
	import com.tutorial.TutorialScreenStateController;
	
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
			//_context.recordButton.clicked.remove(onRecordBtn);
			//_context.listenButton.clicked.remove(onListenBtn);
			//_context.playRecordedButton.clicked.remove(onPlayBtn);
			//_context.practiceButton.clicked.remove(onPracticeClicked);
			
			
			
			_context.stopTimer();
			_context.representation.stop();
		}
		
		public function get name():String{
			return States.IDLE;
		}
		
		public function activate():void{
			//_context.instrumentPlayer.playable=true;  // add play button
//			_context.listenButton.state="on";
//			_context.recordButton.state="on";
//			_context.practiceButton.state="on";
			//_context.playRecordedButton.state="on";
			
//			_context.listenButton.clicked.add(onListenBtn);
//			_context.recordButton.clicked.add(onRecordBtn);
//			_context.practiceButton.clicked.add(onPracticeClicked);
			//_context.playRecordedButton.clicked.add(onPlayBtn);
			_context.instrumentRecorder.y=_context.model.getRecordInstrumentY();
			_context.instrumentRecorder.octave=0;
			//_context.instrumentPlayer.y=_context.model.getPlayInstrumentY();
			//_context.instrumentPlayer.x=_context.model.getPlayInstrumentX();
			//_context.instrumentPlayer.scaleX=0.6;
			//_context.instrumentPlayer.scaleY=0.6;
			_context.startTimer();
			_context.representation.start();//move cue
			_context.representation.stop();
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