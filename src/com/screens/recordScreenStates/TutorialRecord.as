package com.screens.recordScreenStates
{
	import com.constants.Dimentions;
	import com.gskinner.motion.GTween;
	import com.screens.view.components.notes.DroppingNote;
	
	public class TutorialRecord extends RecordState
	{
		public function TutorialRecord(stateController:RecordScreenStateController)
		{
			super(stateController);
			
		}
		
		private function onPauseSignal(paused:Boolean):void{
			if(paused){
				super.showHint();
//				onTutorialSignal(NOTE_ON_LINE);
			}
		}
		
		
		override protected function continuePlay(curnote:DroppingNote):void{
			if(_scoreMediator.lastScore>0){
				super.continuePlay(curnote);
			}
		}
		
		override protected function showMuteButton():void{
			
		}
		
		override public function activate():void
		{
			_context.recordButton.visible=false;
			_context.playButton.visible=false;
			_context.playGlow.visible=false;
			super.pauseSignal.add(onPauseSignal);
			if(_context.instrumentRecorder.visible==false){
				var yy:Number = _context.instrumentRecorder.y;
				_context.instrumentRecorder.y = Dimentions.HEIGHT;
				_context.instrumentRecorder.visible = true;
				new GTween(_context.instrumentRecorder,1,{y:yy});
			}
			super.activate();
		}
		
		override public function deActivate():void
		{
			super.deActivate();
		}
			
//			switch(phase){
//				case NOTE_ON_LINE:
//					_tManager.openInstruction("","Play the note under the arrow",(Dimentions.WIDTH-150)/2,12,thumbNail,Inf.NO_ARROW);
//					break;
//				
				
		
		override protected function onRecordBtn(buttonState:Boolean):void{
			super.onRecordBtn(buttonState);
		}
		
		override protected function stop():void{
			_complete.dispatch();
		}
		
		
		
		
	}
}