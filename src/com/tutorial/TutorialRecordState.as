package com.tutorial
{
	import com.metronom.ITimeModel;
	import com.musicalInstruments.view.components.NoteView;
	import com.representation.RepresentationSizes;
	import com.representation.view.Channel;
	import com.screens.recordScreenStates.RecordScreenStateController;
	import com.screens.recordScreenStates.RecordState;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	
	public class TutorialRecordState extends RecordState implements ITutorialState
	{
		private var _channel:Channel;
		private var _currentNote:NoteView;
		
		public function TutorialRecordState(stateController:RecordScreenStateController)
		{
			super(stateController);
		}
		
		public function addTutorial(stage:uint):void{
			_channel=_context.channel;
			TutorialScreenStateController(_context).arrow.visible=true;
			_timeModel.tickSignal.add(getNextNote);
			getNextNote();
		}
		
		public function removeTutorial():void{
			_timeModel.tickSignal.remove(getNextNote);
		}
		
		private function getNextNote():Boolean{
			var noteChanged:Boolean=false;
			TutorialScreenStateController(_context).arrow.visible=false;
			TutorialScreenStateController(_context).line.visible=false;
			TutorialScreenStateController(_context).dot.x=_context.representation.cueX;
			if(_timeModel.currentTick==_context.model.endAtFrame){
				_complete.dispatch();
				return false;
			}
			var curNote:NoteView;
			for(var i:uint=0;i<6;i++){//was i<4
				if(_channel.getNoteByLocation(_timeModel.currentTick+i)){
					curNote=_channel.getNoteByLocation(_timeModel.currentTick+i);
					break;
				}
			}
			
			if(!curNote){return false}
			
			if(curNote!=_currentNote){
				_currentNote=curNote;
				showWhereToClick();
				noteChanged=true;
			}else{
				TutorialScreenStateController(_context).arrow.visible=true;
				drawLine();
				//TutorialScreenStateController(_context).line.visible=true;
			}
			return noteChanged;
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
			TutorialScreenStateController(_context).arrow.visible=true;
			var dot:DisplayObject = TutorialScreenStateController(_context).dot;
			dot.visible=true;
			//dot.x=_context.representation.cueX;
			dot.y=70;
			var arrow:DisplayObject=TutorialScreenStateController(_context).arrow;
			arrow.x=_context.instrumentRecorder.x+_context.instrumentRecorder.getComponentById(_currentNote.value).x-_context.instrumentRecorder.getComponentById(_currentNote.value).width/4;
			arrow.y=_context.instrumentRecorder.y-arrow.height;
			
			//arrow.rotation=FindAngle(new Point(dot.x,dot.y),new Point(arrow.x,arrow.y));
			
			//TutorialScreenStateController(_context).setArrow(_currentNote.x,_currentNote.y,0);
			
		}
	}
}