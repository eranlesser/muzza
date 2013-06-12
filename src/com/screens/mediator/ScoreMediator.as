package com.screens.mediator
{
	import com.screens.recordScreenStates.RecordState;
	
	import flash.events.Event;

	public class ScoreMediator
	{
		private var _recordState:RecordState;
		private var _pauseCounter:int=0;
		public function ScoreMediator(recordState:RecordState){
			_recordState = recordState;
			_recordState.scoreSignal.add(onScoreSignal)
			_recordState.pauseSignal.add(onPauseSignal)
		}
		
		private function onPauseSignal(val:Boolean):void
		{
			trace("_pauseCounter",_pauseCounter)
			// TODO Auto Generated method stub
			if(!val){
				_recordState.view.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			}else{
				_pauseCounter=0;
				_recordState.view.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			}
			
		}
		
		private function onEnterFrame(e:Event):void{
			_pauseCounter++;
		}
		
		private function onScoreSignal(toPlayTime:int,curTime:int):void
		{
			_pauseCounter=0;
			trace(toPlayTime,curTime,_pauseCounter)
			// TODO Auto Generated method stub
			
		}
	}
}