package com.screens.recordScreenStates
{
	import com.constants.States;
	
	import org.osflash.signals.Signal;

	public class FeedBackState implements IRecordScreenState
	{
		private var _context:	RecordScreenStateController;
		private var _complete:	Signal = new Signal();
		
		public function FeedBackState(stateController:RecordScreenStateController)
		{
			_context = stateController;
		}
		
		public function get complete():Signal{
			return _complete;
		}
		
		public function deActivate():void{
			_context.recordButton.clicked.remove(onRecordBtn);
			_context.listenButton.clicked.remove(onPlayBtn);
		}
		
		public function get name():String{
			return States.FEEDBACK;
		}
		
		public function activate():void
		{
			_context.recordButton.clicked.add(onRecordBtn);
			_context.listenButton.clicked.add(onPlayBtn);
			_context.recordButton.enabled=true;
			_context.recordButton.state="on";
			_context.listenButton.enabled=true;
			_context.listenButton.state="on";
			_context.instrumentRecorder.ableState=States.FEEDBACK;
			//_context.instrumentPlayer.enabled = false;
			//_context.spotLight.alpha = 0.8;
			_context.channelController.activeComponent = "none";
			//_context.channelController.compare();
		}
		
		private function onRecordBtn(flag:Boolean):void{
			_context.record();
		}
		private function onPlayBtn(flag:Boolean):void{
			_context.listen();
		}
	}
}