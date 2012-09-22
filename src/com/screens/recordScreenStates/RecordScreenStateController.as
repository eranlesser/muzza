package com.screens.recordScreenStates
{
	import com.constants.States;
	import com.musicalInstruments.view.components.SpeechBubble;
	import com.musicalInstruments.view.recordable.RecordableView;
	import com.notes.INotesChannel;
	import com.notes.Notes;
	import com.representation.Representation;
	import com.representation.controller.RecordChannelController;
	import com.representation.view.Channel;
	import com.screens.model.RecordScreenModel;
	import com.screens.view.RecordScreen;
	import com.screens.view.components.RecordScreenButton;
	import com.view.gui.Btn;

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
			_states.push(new IdleState(this));
			_states.push(new ListenState(this));
			_states.push(new PracticeState(this));
			_states.push(new RecordState(this));
		}
		
		private function init():void{
			initStates();
			instrumentRecorder.setRecordable(model.beginAtFrame,model.endAtFrame);
		}
		
		// ------------------------------------------------
		// COMMANDS
		// ------------------------------------------------
		
		public function listen():void{
			setState(States.LISTEN);
		}
		
		public function record():void{
			setState(States.RECORD);
		}
		
		public function practice():void{
			setState(States.PRACTICE);
		}
		
		public function playRecorded():void{
			setState(States.PLAY_RECORDED);
		}
		
		public function start():void{
			setState(States.IDLE);
		}

		protected function setState(name:String):void
		{
			deActivate();
			trace("state",name)
			_state = getStateByName(name);
			activate();
		}
		
		
		
		private function activate():void
		{
			_state.activate();
			_state.complete.add(onStateComplete);
		}
		
		public function deActivate():void
		{
			if(_state){
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
		
		public function get bubble():SpeechBubble{
			return new SpeechBubble();
		}
		
		public function get instrumentRecorder():RecordableView{
			return _recordScreen.recorder;
		}
		public function get recordButton():Btn{
			return _recordScreen.recordButton;
		}
		
		public function get practiceButton():Btn{
			return _recordScreen.practiceButton;
		}
		
		
		
		public function get model():RecordScreenModel{
			return _recordScreen.model;
		}
		
		public function get channel():INotesChannel{
			return _recordScreen.recordChannelController.channel;
		}
		
		public function get recordChannelController():RecordChannelController{
			return _recordScreen.recordChannelController;
		}
		
	  
		
		public function startTimer():void{
			_recordScreen.startTimer();
		}
		
		public function stopTimer():void{
			_recordScreen.stopTimer();
		}
		public function pauseTimer():void{
			_recordScreen.pauseTimer();
		}
		
		public function unPauseTimer():void{
			_recordScreen.unPauseTimer();
		}
		
		public function get notes():Notes{
			return _recordScreen.notes;
		}
		
		
	}
}