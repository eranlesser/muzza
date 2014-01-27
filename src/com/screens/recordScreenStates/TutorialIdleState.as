package com.screens.recordScreenStates
{
	import com.inf.Inf;
	import com.inf.TutorialManager;
	

	public class TutorialIdleState extends IdleState
	{
		protected var _tManager:		TutorialManager;
		public static const INIT:uint = 0;
		public static const OPEN_DEMO:uint = 1;
		public static const DEMO_COMPLETE:uint = 2;
		public static const CLICK_PLAY:uint = 3;
		public static const AFTER_PLAY:uint = 4;
		public function TutorialIdleState(stateController:RecordScreenStateController,tManager:TutorialManager)
		{
			super(stateController);
			_tManager = tManager;
			_tManager.navigator.visible=false;
			//_popUpsManager = new TutorialManager(_context.guiLayer.parent.parent.parent as Presenter,_context.model.instrumentModel.thumbNail);
			
		}
		
		override public function activate():void{
			_tManager.tutorialSignal.add(onTutorialSignal);
			super.activate();
			
			
		}
		override public function deActivate():void{
			_tManager.closePopUp();
			_tManager.tutorialSignal.remove(onTutorialSignal);
			super.deActivate();
		}
		
		private function onTutorialSignal(signal:uint):void{
			open(signal,_context.thumbNail);
		}
		
		override protected function applyButtonsVisibility():void{
			
		}
		
		private function open(phase:int,thumbNail:String):void
		{
			switch(thumbNail){
				case "bottles.png":
					switch(phase){
						case INIT:
							_context.playButton.visible = false;
							_context.playGlow.visible = false;
							_context.instrumentRecorder.visible = false;
							break;
						case OPEN_DEMO:
							
							_tManager.openInstruction("Demo","Click here, this is what we are about to play together",90,500,thumbNail,Inf.BTM_LEFT);
							break;
						case DEMO_COMPLETE:
							_tManager.openInstruction("Close","Click to close",10,10,thumbNail,Inf.TOP_RIGHT);
							break;
						case CLICK_PLAY:
							_context.playButton.visible = true;
							_context.playGlow.visible = true;
							_tManager.openInstruction("Play","Click here, let's play some music with Mel",450,140,thumbNail,Inf.TOP_LEFT);
							break;
						
					}
				break;
				case "drum.png":
					switch(phase){
					case 0:
						_tManager.openInstruction("Dee Drums","Lets add some rhythm",250,300,thumbNail,Inf.TOP_LEFT);
						break;
					}
				break;
				case "bass_flash.jpg":
					switch(phase){
						case 0:
							_tManager.openInstruction("O the human Bass","Time for some heavy groove",250,300,thumbNail,Inf.TOP_LEFT);
							break;
					}
					break;
			}
		}
		
		private function getInf():Object{
			var o:Object = new Object();
			return o;
		}
		
	}
}

/*
class InfModel{
	public function InfModel(){
		
	}
	
	public function get title():String{
		
	}
	
	public function get content():String{
		
	}
	
	public function get x():int{
		
	}
	
	public function get y():int{
		
	}
	
	
}
*/