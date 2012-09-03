package com.tutorial
{
	import com.representation.RepresentationSizes;
	import com.screens.recordScreenStates.PracticeState;
	import com.screens.recordScreenStates.RecordScreenStateController;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.geom.Point;
	
	public class TutorialPracticeState extends PracticeState implements ITutorialState
	{
		private var _tutorialDone:Boolean;
		public function TutorialPracticeState(stateController:RecordScreenStateController)
		{
			super(stateController);
		}
		
		override protected function highLightNext():Boolean{
			if(super.highLightNext()){
				showWhereToClick();
			}
			var dot:DisplayObject = TutorialScreenStateController(_context).dot;
			dot.y=70;
			dot.x=_context.representation.cueX+32-dot.width/2;
			dot.visible=!_tutorialDone;
			if(super.getNoteByDistance(4)&&!_tutorialDone){
				drawLine();
			}else{
				if(!_tutorialDone){
				TutorialScreenStateController(_context).line.visible=false;
				TutorialScreenStateController(_context).arrow.visible=false;
				}
			}
			return false;
		}
		
		public function addTutorial(stage:uint):void{
			TutorialScreenStateController(_context).arrow.visible=true;
			TutorialScreenStateController(_context).line.visible=true;
			_tutorialDone=false;
			//_timeModel.tickSignal.add(showWhereToClick);
		}
		
		public function removeTutorial():void{
			TutorialScreenStateController(_context).line.visible=false;
			TutorialScreenStateController(_context).dot.visible=false;
			//_timeModel.tickSignal.remove(showWhereToClick);
			_tutorialDone=true;
		}
		
		private function drawLine():void{
			var line:Shape=TutorialScreenStateController(_context).line;
			line.graphics.clear();
			line.graphics.lineStyle(1);
			line.graphics.moveTo(TutorialScreenStateController(_context).dot.x,TutorialScreenStateController(_context).dot.y);
			line.graphics.lineTo(TutorialScreenStateController(_context).arrow.x+TutorialScreenStateController(_context).arrow.width/2,TutorialScreenStateController(_context).arrow.y);
			line.visible=true;		
			TutorialScreenStateController(_context).arrow.visible=true;
		}
		private function showWhereToClick():void{
			var dot:DisplayObject = TutorialScreenStateController(_context).dot;
			//dot.x=_currentNote.x+dot.width/2+RepresentationSizes.thumbNailWidth+3;
			dot.y=70;
			var arrow:DisplayObject=TutorialScreenStateController(_context).arrow;
			arrow.x=_context.instrumentRecorder.x+_context.instrumentRecorder.getComponentById(_currentNote.value).x+_context.instrumentRecorder.getComponentById(_currentNote.value).width/2-TutorialScreenStateController(_context).arrow.width/2;
			arrow.y=_context.instrumentRecorder.y-arrow.height;
			
			//arrow.rotation=FindAngle(new Point(dot.x,dot.y),new Point(arrow.x,arrow.y));
			
			//TutorialScreenStateController(_context).setArrow(_currentNote.x,_currentNote.y,0);
			
		}
		
		
	}
}