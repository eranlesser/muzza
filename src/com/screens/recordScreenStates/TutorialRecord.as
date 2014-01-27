package com.screens.recordScreenStates
{
	import com.constants.Dimentions;
	import com.gskinner.motion.GTween;
	import com.inf.Inf;
	import com.inf.TutorialManager;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class TutorialRecord extends RecordState
	{
		protected var _tManager:		TutorialManager;
		private static const NOTE_ON_LINE:uint=0;
		public function TutorialRecord(stateController:RecordScreenStateController,tManager:TutorialManager)
		{
			super(stateController);
			_tManager = tManager;
			
		}
		
		private function onPauseSignal(paused:Boolean):void{
			if(paused){
				onTutorialSignal(NOTE_ON_LINE);
			}
		}
		
		override public function activate():void
		{
			_context.recordButton.visible=false;
			_context.playButton.visible=false;
			_context.playGlow.visible=false;
			_tManager.tutorialSignal.add(onTutorialSignal);
			super.pauseSignal.add(onPauseSignal);
			super.activate();
		}
		
		override public function deActivate():void
		{
			_tManager.closePopUp();
			_tManager.tutorialSignal.remove(onTutorialSignal);
			super.pauseSignal.remove(onPauseSignal);
			super.deActivate();
		}
		private var _topArrow:Sprite;
		private var _butArrow:Sprite;
		protected function onTutorialSignal(signal:uint):void{
			open(signal,_context.thumbNail);
		}
		private function open(phase:int,thumbNail:String):void
		{
			
			switch(phase){
				case NOTE_ON_LINE:
					/*
					_topArrow = drawArrow();
					_butArrow = drawArrow();
					
					_context.guiLayer.addChild(_topArrow);
					_context.guiLayer.addChild(_butArrow);
					_topArrow.rotation = 45;
					_butArrow.rotation = -45;
					*/
					_context.instrumentRecorder.visible = true;
					var yy:Number = _context.instrumentRecorder.y;
					_context.instrumentRecorder.y = Dimentions.HEIGHT;
					new GTween(_context.instrumentRecorder,1,{y:yy});
					_tManager.openInstruction("","Play the note under the arrow",(Dimentions.WIDTH-150)/2,12,thumbNail,Inf.NO_ARROW);
					break;
				
				
			}
		}
		
		override protected function onRecordBtn(buttonState:Boolean):void{
			super.onRecordBtn(buttonState);
			_tManager.openPop("Well Done","Click next",(Dimentions.WIDTH-300)/2,(Dimentions.HEIGHT-300)/2,_context.thumbNail);
		}
		
		override protected function stop():void{
			_complete.dispatch();
		}
		
		override protected function initScores():void{
			
		}
		
		private function drawArrow():Sprite{
			var hintArrow:Sprite = new Sprite();
			var shp:Shape = new Shape();
			shp.graphics.beginFill(0xFFFFFF,0.5);
			shp.graphics.drawRoundRect(0,0,8,_context.model.getRecordInstrumentY()-(_context.model.noteTargetsY+40),2,2);
			shp.graphics.endFill();
			hintArrow.addChild(shp);
			var arrowHead:Shape = new Shape();
			arrowHead.graphics.beginFill(0xFFFFFF,0.5);
			arrowHead.graphics.lineTo(16,0);
			arrowHead.graphics.lineTo(8,8);
			arrowHead.graphics.lineTo(0,0);
			arrowHead.graphics.endFill();
			hintArrow.addChild(arrowHead);
			arrowHead.y=shp.height-1;
			arrowHead.x=(shp.width-arrowHead.width)/2;
			return hintArrow; 
		}
		
		
		
	}
}