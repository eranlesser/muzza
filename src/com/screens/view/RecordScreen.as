package com.screens.view {
	import com.constants.Rhythms;
	import com.container.BottomToolBar;
	import com.metronom.*;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.musicalInstruments.view.playable.*;
	import com.musicalInstruments.view.recordable.*;
	import com.notes.INotesChannel;
	import com.notes.RecordScreenNotes;
	import com.representation.controller.RecordChannelController;
	import com.representation.view.Channel;
	import com.screens.model.RecordScreenModel;
	import com.screens.recordScreenStates.RecordScreenStateController;
	import com.view.gui.Btn;


	public class RecordScreen extends MusicalScreen
	{
		private var _instrumentRecorder:		RecordableView;
		private var _model:						RecordScreenModel;
		private var _recordChannelController:	RecordChannelController;
		private var _stateController:			RecordScreenStateController;
		private var _timerControll:				ITimeControll;
		private var _timeModel:					ITimeModel;
		private var _notes:						RecordScreenNotes;
		private var _practiceBtn:				Btn;
		private var _recordBtn:					Btn;
		
		public function RecordScreen(){
			_timerControll = Metronome.getTimeControll(this);
			_timeModel = Metronome.getTimeModel();
		}
		
		public function get recorder():RecordableView{
			return _instrumentRecorder;
		}
		
		public function get model():RecordScreenModel{
			return _model;
		}
		
		public function get recordChannelController():RecordChannelController{
			return _recordChannelController;
		}
		public function get channel():INotesChannel{
			return _recordChannelController.channel;
		}
		

		public function get recordButton():Btn{
			return _recordBtn;
		}
		public function get practiceButton():Btn{
			return _practiceBtn;
		}
		
		public function startTimer():void{
			_timerControll.play();
		}
		
		public function stopTimer():void{
			_timerControll.stop();
		}
		
		public function pauseTimer():void{
			_timerControll.pause();
		}
		
		public function unPauseTimer():void{
			_timerControll.unPause();
		}
		
		public function get notes():RecordScreenNotes{
			return _notes;
		}
	
		protected function initStateController():void{
			_stateController = new RecordScreenStateController(this);
		}
		override public function start():void{
			if(!isInited){
				createPlayerAndInstrument();
				addRepresentation();
				super.start();
				_stageLayer.addChild(_instrumentRecorder);
				_practiceBtn = new Btn("PRACTICE_IDLE.png","PRACTICE_PRESSED.png");
				addChild(_practiceBtn);
				_practiceBtn.x=267;
				_practiceBtn.y=60;
				_recordBtn = new Btn("RECORD_IDLE.png","RECORD_PRESSED.png");
				addChild(_recordBtn);
				_recordBtn.x=267+_practiceBtn.width+30;
				_recordBtn.y=60;
				var playChannel:INotesChannel=_notes.addChannel(_model.instrumentModel);
				var channel:INotesChannel=_notes.addChannel(_model.instrumentModel);
				_recordChannelController = new RecordChannelController(channel, _model.instrumentModel, _instrumentRecorder ,_model);
				initStateController();
				_timerControll=Metronome.getTimeControll(this);
				layout();
				isInited = true;
				
			}
			_stateController.start();
			_timerControll.beginAtFrame = _model.beginAtFrame;
			stage.frameRate = Rhythms.DELAY_COUNT;
		}
		
		

		override public function stop():void{
			_stateController.deActivate();
			super.stop();
		}
		
		override public function parseXML(screenData:XML,instrumentsModel:ThemeInstrumentsModel):void{
			_model = new RecordScreenModel(screenData,instrumentsModel);
		}
		
		override protected function layout():void{
			super.layout();
			_instrumentRecorder.x = _model.getRecordInstrumentX();
			_instrumentRecorder.y = _model.getRecordInstrumentY();
			
		}
		
		private function addInstrument(insModel:InstrumentModel):PlayMusician{
			var ins:PlayMusician = new PlayMusician(insModel);
			_stageLayer.addChild(ins);
			return ins;
		}
		
		private function createPlayerAndInstrument():void{
			if(_model.instrumentModel.type=="bottles"){
				_instrumentRecorder = new TapInstrument(_model.instrumentModel as NotesInstrumentModel,_model.recordeSequanceId);
			}else if(_model.instrumentModel.type=="bass"){
				_instrumentRecorder = new TapInstrument(_model.instrumentModel as NotesInstrumentModel,_model.recordeSequanceId);
			}else if(_model.instrumentModel.type=="drums"){
				_instrumentRecorder = new TapInstrument(_model.instrumentModel as NotesInstrumentModel,_model.recordeSequanceId);
			}else if(_model.instrumentModel.type=="voice"){
				//_instrumentRecorder = new MicrophoneView(_model.instrumentModel,_model.recordeSequanceId);
			}
		}
		
		private function onPlayerNote(noteId:uint):void{
			_instrumentRecorder.animateNote(noteId,"play");
		}
		
		private function onPlayerUnNote(noteId:uint):void{
			_instrumentRecorder.animateNote(noteId,"idle");
		}
		
		private function addRepresentation():void{
			_notes = new RecordScreenNotes();
			_stageLayer.addChild(_notes);
			_notes.x=37;
			_notes.y=110;
		}
		
		
		
	}
}

/*
private function addLyrics():void{
	_lyrics = new LyricView();
	_lyricsController = new LyricController(_lyrics,_model.lyrics);
	_stageLayer.addChild(_lyrics);
}
*/

