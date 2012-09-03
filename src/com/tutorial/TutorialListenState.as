package com.tutorial
{
	import com.screens.recordScreenStates.ListenState;
	import com.screens.recordScreenStates.RecordScreenStateController;
	
	public class TutorialListenState extends ListenState implements ITutorialState
	{
		public function TutorialListenState(stateController:RecordScreenStateController){
			super(stateController);
		}
	}
}