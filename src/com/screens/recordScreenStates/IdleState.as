package com.screens.recordScreenStates
{
	import com.constants.Session;
	import com.constants.States;
	import com.gskinner.motion.GTween;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;

	public class IdleState implements IRecordScreenState
	{
		protected var _context:	RecordScreenStateController;
		private var _isActive:Boolean = false;
		private var _complete:	Signal = new Signal();
		
		public function IdleState(stateController:RecordScreenStateController)
		{
			_context = stateController;
		}
		
		public function get complete():Signal{
			return _complete;
		}
		
		public function deActivate():void{
			_context.recordButton.clicked.remove(onRecordBtn);
			_context.playButton.clicked.remove(onRecordBtn);
			_context.stopTimer();
			_context.notes.stop();
			_isActive = false;
		}
		public function get isActive():Boolean{
			return _isActive;
		}
		public function get name():String{
			return States.IDLE;
		}
		
		public function activate():void{
			_context.recordButton.state="idle";
			_context.recordButton.clicked.add(onRecordBtn);
			_context.playButton.clicked.add(onRecordBtn);
			_context.instrumentRecorder.y=_context.model.getRecordInstrumentY();
			applyButtonsVisibility();
			//_context.recordButton.x=(Dimentions.WIDTH-_context.recordButton.width)/2;
			_isActive = true;
		}
		
		protected function applyButtonsVisibility():void{
			_context.muteBtn.visible=false;
			_context.recordButton.visible=Session.IMPROVISE_MODE;
			_context.playGlow.visible=!Session.IMPROVISE_MODE;
			_context.playButton.visible=!Session.IMPROVISE_MODE;
			_context.notes.visible =!Session.IMPROVISE_MODE;
			var tmr:Timer = new Timer(2000,7);
			tmr.addEventListener(TimerEvent.TIMER,showPlay);
			tmr.start();
		}
		
		private function onRecordBtn(buttonState:Boolean):void{
			_context.record();
		}
		
		private function onPracticeClicked(buttonState:Boolean):void{
			_context.practice();
		}
		
		private function showPlay(e:Event):void{
			var playTween1:GTween = new GTween(_context.playGlow,0.5,{alpha:1});
			playTween1.onComplete = function():void{
				new GTween(_context.playGlow,0.5,{alpha:0});
			}
			var tmr:Timer = e.target as Timer;
			if(tmr && tmr.currentCount==tmr.repeatCount){
				tmr.removeEventListener(TimerEvent.TIMER,showPlay);
				tmr=null;
			}
		}
		
		
		
	}
}