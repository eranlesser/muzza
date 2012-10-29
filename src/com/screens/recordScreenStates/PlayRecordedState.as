package com.screens.recordScreenStates
{
	import com.constants.States;

	public class PlayRecordedState extends ListenState
	{
		public function PlayRecordedState(stateController:RecordScreenStateController)
		{
			super(stateController);
		}
		
		override public function activate():void{
			_context.bubble.visible=false;
			_context.instrumentRecorder.ableState=States.LISTEN;
			//_context.playRecordedButton.state = "off";
			//_context.playRecordedButton.clicked.add(onStopButton);
			//play();
		}
		
		override protected function play():void{
			_timeModel.soundTick.add(onTimerTick);
			_context.startTimer();
			//_context.instrumentPlayer.play(_context.model.recordeSequanceId,_context.model.beginAtFrame);
		}
		override public function deActivate():void{
			//_context.playRecordedButton.clicked.remove(onStopButton);
			stop();
		}
		
		override public function get name():String{
			return States.PLAY_RECORDED;
		}
		
		private function onStopButton(clicked:Boolean):void{
			stop();
		}
	}
}