package com.tutorial
{
	import com.screens.recordScreenStates.IdleState;
	import com.screens.recordScreenStates.RecordScreenStateController;
	
	public class TutorialIdleState extends IdleState implements ITutorialState
	{
		public function TutorialIdleState(stateController:RecordScreenStateController)
		{
			super(stateController);
		}
		
		public function addTutorial(stage:uint):void{
			TutorialScreenStateController(_context).arrow.visible=true;
			TutorialScreenStateController(_context).dot.visible=false;
			TutorialScreenStateController(_context).line.visible=false;
			if(stage<3){
				TutorialScreenStateController(_context).setArrow(480+(stage*80),600,0);
			}else{
				if(_context.recordChannelController.score>0.6){
					TutorialScreenStateController(_context).setArrow(940,600,0);
				}else{
					TutorialScreenStateController(_context).reduceSpeed();
				}
			}
		}
		
		public function removeTutorial():void{
			
		}
	}
}