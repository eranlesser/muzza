package com.screens.recordScreenStates
{
	import com.constants.States;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.tutorial.TutorialScreenStateController;
	
	import org.osflash.signals.Signal;

	public class ListenState implements IRecordScreenState{
		
		protected var _context:		RecordScreenStateController;
		protected var _timeModel:		ITimeModel = Metronome.getTimeModel();
		private var _complete:		Signal = new Signal();
		private var _isPlaying:Boolean = false;
		
		public function ListenState(stateController:RecordScreenStateController){
			_context = stateController;
		}
		
		public function get complete():Signal{
			return _complete;
		}
		
		public function activate():void{
			//_context.bubble.visible=false;
			_context.instrumentRecorder.ableState=States.LISTEN;
			_context.listenButton.state = "off";
			_context.listenButton.clicked.add(onStopButton);
			//new GTween(_context.instrumentRecorder,1,{y:_context.model.getRecordInstrumentY()});
			//var tween:GTween=new GTween(_context.instrumentPlayer,1,{y:_context.model.getPlayInstrumentY(),x:_context.model.getPlayInstrumentX(),scaleX:1,scaleY:1});
			//tween.onComplete=play;
			//_instrumentPlayer.x = _model.getPlayInstrumentX();
			//_instrumentRecorder.x = _model.getRecordInstrumentX();
			//_instrumentPlayer.y = _model.getPlayInstrumentY();
			//_instrumentRecorder.y = _model.getRecordInstrumentY();
			_context.recordChannelController.reset();
			play();
		}
		
		private function onStopButton(clicked:Boolean):void{
			stop();
		}
		
		public function deActivate():void{
			_context.listenButton.clicked.remove(onStopButton);
			stop();
		}
		
		public function get name():String{
			return States.LISTEN;
		}
		
		protected function play():void{
			_context.bandActive=true;
			_timeModel.tickSignal.add(onTimerTick);
			_context.startTimer();
			_context.instrumentRecorder.play(_context.model.learnedSequanceId,_context.model.beginAtFrame);
			_context.recordChannelController.start();
			_context.representation.start();
		}
		
		protected function stop():void{
			_context.bandActive=false;
			_timeModel.tickSignal.remove(onTimerTick);
			_context.instrumentRecorder.stop()
			_context.recordChannelController.stop();
			_context.representation.stop();
			//_context.instrumentPlayer.stop();
			_context.stopTimer();
			_complete.dispatch();
			//_context.frameRate = Rhythms.DELAY_COUNT;
			_isPlaying = false;
		}
		
		protected function onTimerTick():void{
			if(!_isPlaying){
				_isPlaying = true;
				//_context.frameRate = Rhythms.DELAY_COUNT*((Levels.CURRENT_LEVEL)/100)
			}
			if(_context.model.endAtFrame == _timeModel.currentTick){
				stop();
			}
		}
		
		public function addTutorial(stage:uint):void{
			TutorialScreenStateController(_context).arrow.visible=false;
		}
		
		public function removeTutorial():void{
			
		}
		
		
		
	}
}