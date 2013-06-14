package com.screens.view {
	import com.gskinner.motion.GTween;
	import com.metronom.*;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.palleta.views.TurnTable;
	import com.musicalInstruments.view.character.*;
	import com.musicalInstruments.view.instrument.*;
	import com.representation.controller.RecordChannelController;
	import com.screens.model.RecordScreenModel;
	import com.screens.recordScreenStates.RecordScreenStateController;
	import com.screens.view.components.Clock;
	import com.screens.view.components.notes.Notes;
	import com.screens.view.components.notes.NotesChannel;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;


	public class RecordScreen extends AbstractScreen
	{
		private var _instrumentRecorder:		Instrument;
		private var _model:						RecordScreenModel;
		private var _recordChannelController:	RecordChannelController;
		private var _stateController:			RecordScreenStateController;
		private var _timerControll:				ITimeControll;
		private var _timeModel:					ITimeModel;
		private var _notes:						Notes;
		private var _recordBtn:					Btn;
		private var _recordTween:				GTween;
		private var _clock:						Clock;
		private var _improviseButton:			Btn;
		public var improviseMode:Signal = new Signal();
		public function RecordScreen(){
			_timerControll = Metronome.getTimeControll();
			_timeModel = Metronome.getTimeModel();
		}
		
		public function get recorder():Instrument{
			return _instrumentRecorder;
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
		
		public function stopTimer():void{
			_timerControll.stop();
		}
		
		public function get notes():Notes{
			return _notes;
		}
		
		
	
		protected function initStateController():void{
			_stateController = new RecordScreenStateController(this);
		}
		override public function start():void{
			if(!isInited){
				_bg.addChild(AssetsManager.getAssetByName("bgBlur.png"));
				addRepresentation();
				createPlayerAndInstrument();
				super.start();
				_recordBtn = new Btn("record_BTN_play.png","record_BTN_puse.png");
				addChild(_recordBtn);
				_recordBtn.x=443;
				_recordBtn.y=27//(strip.height-practiceBtn.height)/2-2;
				_improviseButton = new Btn("SPEED_SLIDER_button.png","SPEED_SLIDER_button.png");
				addChild(_improviseButton);
				//_improviseButton.visible = false;
				_improviseButton.x=12;
				_improviseButton.y=184;
				_improviseButton.clicked.add(onImprovise);
				var channel:NotesChannel=_notes.addChannel(_model.instrumentModel,_model.endAtFrame);
				_recordChannelController = new RecordChannelController(channel, _model.instrumentModel, _instrumentRecorder,_model);
				initStateController();
				_timerControll=Metronome.getTimeControll();
				layout();
				_clock = Clock.instance;
				_clock.x=290;
				_clock.y=28;
				isInited = true;
			}
			addChild(_clock);
			_stateController.start();
			_timerControll.beginAtFrame = _model.beginAtFrame;
			_clock.reset();
			addBackUps();
		}
		
		private function onImprovise(val:String):void
		{
			// TODO Auto Generated method stub
			if(_improviseButton.state == "pressed"){
				_improviseButton.state = "idle" ;
				_notes.visible=true;
				improviseMode.dispatch(false);
			}else{
				_improviseButton.state = "pressed" ;
				_notes.visible = false;
				improviseMode.dispatch(true);
			}
		}
		
		override public function stop():void{
			_stateController.deActivate();
			_instrumentRecorder.stop();
			for each(var player:PlayMusician in _players){
				player.stop();
			}
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
		
		private function isOnStage(playerModel:InstrumentModel):PlayMusician{
			for each(var playMusician:PlayMusician in _players){
				if(playMusician.thumbnail == playerModel.coreModel.thumbNail){
					return playMusician;
				}
			}
			return null;
		}
		
		private var _players:Vector.<PlayMusician> = new Vector.<PlayMusician>();
		private function addBackUps():void{
			var player:PlayMusician;
			for each(var insModel:InstrumentModel in _model.backUpInsruments){
				player = isOnStage(insModel)
				if(player == null){
					player = new PlayMusician(insModel);
					player.x = player.getX();
					player.y = player.getY();
					_players.push(player);
				}
				if(player.isRecorded(_model.recordeSequanceId)){
					_stageLayer.addChild(player);
					player.start();
					player.play(_model.recordeSequanceId,0);
				}
				
			}
			
		}
		
		
		private function createPlayerAndInstrument():void{
			if(_model.instrumentModel.type=="turnTable"){
				_instrumentRecorder = new TurnTable(_model.instrumentModel as NotesInstrumentModel);
			}else{
				_instrumentRecorder = new TapInstrument(_model.instrumentModel as NotesInstrumentModel);
			}
			/*}else if(_model.instrumentModel.type=="bass"){
				_instrumentRecorder = new TapInstrument(_model.instrumentModel as NotesInstrumentModel);
			}else if(_model.instrumentModel.type=="drums"){
				_instrumentRecorder = new TapInstrument(_model.instrumentModel as NotesInstrumentModel);
			}else if(_model.instrumentModel.type=="voice"){
				//_instrumentRecorder = new MicrophoneView(_model.instrumentModel,_model.recordeSequanceId);
			}else{
				//trace(_model.instrumentModel.type)
			}*/
			_guiLayer.addChild(_instrumentRecorder);
			
		}
		
		
		private function addRepresentation():void{
			_notes = new Notes(_model.noteTargetsY+_model.noteTargetsYOffset);
			_guiLayer.addChild(_notes);
		}
		
		
		public function get notesLength():uint{
			return NoteSequanceModel(NotesInstrumentModel(_model.instrumentModel).getSequanceById(_model.learnedSequanceId)).notes.length
		}
		
		public function get stageLayer():Sprite{
			return _stageLayer;
		}
		public function get guiLayer():Sprite{
			return _guiLayer;
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

