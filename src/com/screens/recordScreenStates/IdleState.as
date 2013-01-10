package com.screens.recordScreenStates
{
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.constants.States;
	import com.inf.PopUpsManager;
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
			//_context.notes.start();//move cue
			//_context.notes.stop();
			
			_context.practiceButton.visible=false;
			_context.recordButton.x=(Dimentions.WIDTH-_context.recordButton.width)/2
		}
		
		private function onRecordBtn(buttonState:Boolean):void{
			PopUpsManager.closePopUp();
			Session.instance.recordClicked = true;
			_context.record();
		}
		
		private function onPracticeClicked(buttonState:Boolean):void{
			_context.practice();
		}
		
		
		
		
	}
}