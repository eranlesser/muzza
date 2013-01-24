package com.screens.recordScreenStates
{
	import com.constants.Rhythms;
	import com.constants.States;
	import com.musicalInstruments.palleta.Ipallet;
	import com.musicalInstruments.palleta.views.Pallet;
	import com.musicalInstruments.view.components.NoteSequancePlayer;
	import com.musicalInstruments.view.instrument.Instrument;
	import com.representation.controller.RecordChannelController;
	import com.screens.model.RecordScreenModel;
	import com.screens.view.RecordScreen;
	import com.screens.view.TimeSlider;
	import com.screens.view.components.notes.INotesChannel;
	import com.screens.view.components.notes.Notes;
	import com.screens.view.components.notes.NotesChannel;
	import com.view.gui.Btn;
	
	import flash.text.TextField;

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
			trace("state",name)
			_state = getStateByName(name);
			activate();
		}
		
		public function set isRecorded(flag:Boolean):void{
			_recordScreen.isRecorded=flag;
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
		
		
		public function get instrumentRecorder():Instrument{
			return _recordScreen.recorder;
		}
		
		public function get recordButton():Btn{
			return _recordScreen.recordButton;
		}
		public function get practiceButton():Btn{
			return _recordScreen.practiceBtn;
		}
		
		public function set speed(value:Number):void{
			//_recordScreen.stage.frameRate=Rhythms.FRAME_RATE*value;
			trace("frame rate is",_recordScreen.stage.frameRate)
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
		
	  
		
		public function startTimer():void{
			_recordScreen.startTimer();
		}
		
		public function stopTimer():void{
			_recordScreen.stopTimer();
		}
		
		public function get notes():Notes{
			return _recordScreen.notes;
		}
		
		public function get backUps():Vector.<NoteSequancePlayer>{
			return _recordScreen.backUps;
		}
		
		public function get timeSlider():TimeSlider{
			return _recordScreen.timeSlider;
		}
		
		public function get timeField():TextField{
			return _recordScreen.timeField;
		}
		
	}
}