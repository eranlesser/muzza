package com.tutorial
{
	import com.constants.States;
	import com.screens.recordScreenStates.ListenState;
	import com.screens.recordScreenStates.RecordScreenStateController;
	import com.screens.view.RecordScreen;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	
	public class TutorialScreenStateController extends RecordScreenStateController{
		
		public function TutorialScreenStateController(recordScreen:TutorialRecordScreen){
			super(recordScreen);
		}
		
		override protected function initStates():void{
			_states.push(new TutorialIdleState(this));
			_states.push(new TutorialListenState(this));
			_states.push(new TutorialPracticeState(this));
			_states.push(new TutorialRecordState(this));
		}
		
		public function setArrow(xx:int,yy:int,angle:int):void{
			TutorialRecordScreen(_recordScreen).setArrow(xx,yy,angle);
		}
		
		public function get arrow():DisplayObject{
			return TutorialRecordScreen(_recordScreen).arrow;
		}
		
		public function get dot():Shape{
			return TutorialRecordScreen(_recordScreen).dot;
		}
		public function get line():Shape{
			return TutorialRecordScreen(_recordScreen).line;
		}
		
		public function reduceSpeed():void{
			
		}
		
		override protected function setState(name:String):void{
			if(_state){
				ITutorialState(_state).removeTutorial();
			}
			super.setState(name);
			ITutorialState(_state).addTutorial(_progressStage);
		}
		
	}
}