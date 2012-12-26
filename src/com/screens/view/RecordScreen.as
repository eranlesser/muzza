package com.screens.view {
	import com.metronom.*;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.PalletModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.musicalInstruments.palleta.Ipallet;
	import com.musicalInstruments.palleta.views.Groovee;
	import com.musicalInstruments.palleta.views.Loopee;
	import com.musicalInstruments.palleta.views.Pallet;
	import com.musicalInstruments.palleta.views.Paw;
	import com.musicalInstruments.palleta.views.Scratchee;
	import com.musicalInstruments.palleta.views.TurnTable;
	import com.musicalInstruments.view.character.*;
	import com.musicalInstruments.view.components.NoteSequancePlayer;
	import com.musicalInstruments.view.instrument.*;
	import com.representation.controller.RecordChannelController;
	import com.screens.model.RecordScreenModel;
	import com.screens.recordScreenStates.RecordScreenStateController;
	import com.screens.view.components.notes.INotesChannel;
	import com.screens.view.components.notes.Notes;
	import com.screens.view.components.notes.NotesChannel;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;


	public class RecordScreen extends AbstractScreen
	{
		private var _instrumentRecorder:		Instrument;
		private var _backUps:					Vector.<NoteSequancePlayer>;
		private var _model:						RecordScreenModel;
		private var _recordChannelController:	RecordChannelController;
		private var _stateController:			RecordScreenStateController;
		private var _timerControll:				ITimeControll;
		private var _timeModel:					ITimeModel;
		private var _notes:						Notes;
		private var _practiceBtn:				Btn;
		private var _recordBtn:					Btn;
		private var _pallet:					Instrument;
		
		public function RecordScreen(){
			_timerControll = Metronome.getTimeControll(this);
			_timeModel = Metronome.getTimeModel();
		}
		
		public function get recorder():Instrument{
			return _instrumentRecorder;
		}
		
		public function get pallet():Instrument{
			return _pallet;
		}
		
		public function get model():RecordScreenModel{
			return _model;
		}
		
		public function get recordChannelController():RecordChannelController{
			return _recordChannelController;
		}
		public function get channel():NotesChannel{
			return _recordChannelController.channel;
		}
		

		public function get recordButton():Btn{
			return _recordBtn;
		}
		public function get practiceBtn():Btn{
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
		
		public function get notes():Notes{
			return _notes;
		}
		
		override public function set isRecorded(flag:Boolean):void{
			_recordBtn.visible=flag;
			if(!flag){
				_practiceBtn.x=(width-_practiceBtn.width)/2;
			}else{
				_practiceBtn.x=267;
			}
		}
	
		protected function initStateController():void{
			_stateController = new RecordScreenStateController(this);
		}
		override public function start():void{
			if(!isInited){
				_bg.addChild(AssetsManager.getAssetByName("PLAY_SCREEN_WALL_BCKGR.png"));
				createPlayerAndInstrument();
				addBackUps();
				addRepresentation();
				super.start();
				var strip:DisplayObject = AssetsManager.getAssetByName("bStrip.png");
				addChild(strip);
				//strip.y=_recordBtn.height+4;
				//_notes.y=strip.y+strip.height;
				
				_practiceBtn = new Btn("PRACTICE_IDLE.png","PRACTICE_PRESSED.png");
				addChild(_practiceBtn);
				_practiceBtn.x=267;
				_practiceBtn.y=(strip.height-practiceBtn.height)/2-2;
				_recordBtn = new Btn("RECORD_IDLE.png","RECORD_PRESSED.png");
				addChild(_recordBtn);
				_recordBtn.x=_practiceBtn.x+_practiceBtn.width+30;
				_recordBtn.y=(strip.height-practiceBtn.height)/2-2;
				
				
				//_notes.addChannel(_model.instrumentModel);
				var channel:NotesChannel=_notes.addChannel(_model.instrumentModel);
				_recordChannelController = new RecordChannelController(channel, _model.instrumentModel, _instrumentRecorder ,_model);
				initStateController();
				_timerControll=Metronome.getTimeControll(this);
				layout();
				isInited = true;
				
			}
			_stateController.start();
			_timerControll.beginAtFrame = _model.beginAtFrame;
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
			_pallet.x = _model.getPalletX();
			_pallet.y = _model.getPalletY();
			//f_instrumentRecorder.scaleX=0.8;
		}
		
		private function addBackUps():void{
			_backUps = new Vector.<NoteSequancePlayer>();
			for each(var insModel:InstrumentModel in _model.backUpInsruments){
				var player:NoteSequancePlayer = new NoteSequancePlayer(NotesInstrumentModel(insModel.coreModel));
				_backUps.push(player);
			}
		}
		
		public function get backUps():Vector.<NoteSequancePlayer>{
			return _backUps;
		}
		
		private function createPlayerAndInstrument():void{
			if(_model.instrumentModel.type=="bottles"){
				_instrumentRecorder = new TapInstrument(_model.instrumentModel as NotesInstrumentModel);
			}else if(_model.instrumentModel.type=="bass"){
				_instrumentRecorder = new TapInstrument(_model.instrumentModel as NotesInstrumentModel);
			}else if(_model.instrumentModel.type=="drums"){
				_instrumentRecorder = new TapInstrument(_model.instrumentModel as NotesInstrumentModel);
			}else if(_model.instrumentModel.type=="voice"){
				//_instrumentRecorder = new MicrophoneView(_model.instrumentModel,_model.recordeSequanceId);
			}
			if(_model.palletModel){
				if((_model.palletModel as PalletModel).palletType=="groovee"){
					_pallet = new Loopee(_model.palletModel)
				}

				if((_model.palletModel as PalletModel).palletType=="scratch"){
					_pallet = new TurnTable(_model.palletModel)
				}
				if((_model.palletModel as PalletModel).palletType=="chelo"){
					_pallet = new Paw(_model.palletModel)
				}
			_stageLayer.addChild(_pallet);
			}else{
				trace(_model.instrumentModel.type)
			}
			_stageLayer.addChild(_instrumentRecorder);
			
		}
		
		private function onPlayerNote(noteId:String):void{
			_instrumentRecorder.animateNote(noteId,"play");
		}
		
		private function onPlayerUnNote(noteId:String):void{
			_instrumentRecorder.animateNote(noteId,"idle");
		}
		
		private function addRepresentation():void{
			_notes = new Notes(_model.endAtFrame,_model.getRecordInstrumentY());
			_stageLayer.addChild(_notes);
		}
		
		public function tick(currentTick:int):void{
			(_pallet as Ipallet).onTick(currentTick);
		}
		
		public function set active(value:Boolean):void{
			(_pallet as Ipallet).active = value;
		}
		
		private function addPallet(pallet:XML):void{
			switch(pallet.@type.toString()){
				case "groovee":
					_pallet = new Groovee(new PalletModel(pallet));
					break;
				case "scratchee":
					//_pallet = new Scratchee();
					break;
				case "paw":
					//_pallet = new Paw(pallet);
					break;
			}
			addChild(_pallet);
			_pallet.y=pallet.@y;
			_pallet.x=pallet.@x;
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

