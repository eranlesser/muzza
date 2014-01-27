package com.screens.recordScreenStates
{
	import com.constants.States;
	import com.container.Presenter;
	import com.inf.TutorialManager;
	import com.musicalInstruments.view.instrument.Instrument;
	import com.representation.controller.RecordChannelController;
	import com.screens.model.RecordScreenModel;
	import com.screens.view.RecordScreen;
	import com.screens.view.components.notes.Notes;
	import com.screens.view.components.notes.NotesChannel;
	import com.view.gui.Btn;
	
	import flash.display.Sprite;

	public class RecordScreenStateController
	{
		protected var _states:			Vector.<IRecordScreenState>;
		protected var _state:			IRecordScreenState;
		protected var _recordScreen:	RecordScreen;
		
		public function RecordScreenStateController(recordScreen:RecordScreen){
			_recordScreen = recordScreen;
			_states = new Vector.<IRecordScreenState>();
			init();
		}
		
		protected function initStates():void{
			if(_recordScreen.model.isTutorial){
				var tManager:TutorialManager = new TutorialManager(_recordScreen.guiLayer.parent.parent.parent as Presenter); 
				_states.push(new TutorialIdleState(this,tManager));
				_states.push(new TutorialRecord(this,tManager));
			}else{
				_states.push(new IdleState(this));
				_states.push(new RecordState(this));
			}
		}
		
		public function get muteBtn():Btn{
			return _recordScreen.musteButton;
		}
		
		public function get hasBackUps():Boolean{
			return _recordScreen.hasBackUps;
		}
		
		private function init():void{
			initStates();
			//instrumentRecorder.setRecordable(model.beginAtFrame,model.endAtFrame);
		}
		
		
		public function get thumbNail():String{
			return _recordScreen.model.instrumentModel.thumbNail;
		}
		
		public function get stageLayer():Sprite{
			return _recordScreen.stageLayer;
		}
		
		public function get guiLayer():Sprite{
			return _recordScreen.guiLayer;
		}
		
		// ------------------------------------------------
		// COMMANDS
		// ------------------------------------------------
		
		
		public function record():void{
			setState(States.RECORD);
		}
		
		public function practice():void{
			setState(States.PRACTICE);
		}
		
		
		public function get notesLength():uint{
			return _recordScreen.notesLength;
		}
		
		
		public function start():void{
			setState(States.IDLE);
		}

		protected function setState(name:String):void
		{
			deActivate();
			//trace("state",name)
			_state = getStateByName(name);
			activate();
		}
		
		
		private function activate():void
		{
			if(!_state.isActive){
				_state.activate();
				_state.complete.add(onStateComplete);
			}
		}
		
		public function deActivate():void
		{
			if(_state && _state.isActive){
				_state.complete.remove(onStateComplete);
				_state.deActivate();
			}
		}
		
		private function onStateComplete():void{
			setState(States.IDLE);
		}
		
		private function getStateByName(name:String):IRecordScreenState{
			var returnedState:IRecordScreenState;
			for each(var state:IRecordScreenState in _states){
				if(state.name == name){
					returnedState = state;
				}
			}
			return returnedState;
		}
		
		
		// ------------------------------------------------
		// QUERIES
		// ------------------------------------------------
		
		
		public function get instrumentRecorder():Instrument{
			return _recordScreen.recorder;
		}
		
		public function get recordButton():Btn{
			return _recordScreen.recordButton;
		}
		public function get playButton():Btn{
			return _recordScreen.playButton;
		}
		
		public function get model():RecordScreenModel{
			return _recordScreen.model;
		}
		
		public function get channel():NotesChannel{
			return _recordScreen.recordChannelController.channel;
		}
		
		public function get recordChannelController():RecordChannelController{
			return _recordScreen.recordChannelController;
		}
		
		public function stopTimer():void{
			_recordScreen.stopTimer();
		}
		
		public function get notes():Notes{
			return _recordScreen.notes;
		}
		public function get playGlow():Btn{
			return _recordScreen.playGlow;
		}
		
		
		
	}
}