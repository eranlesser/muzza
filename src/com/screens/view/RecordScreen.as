package com.screens.view {
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.gskinner.motion.GTween;
	import com.metronom.ITimeControll;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.character.PlayMusician;
	import com.musicalInstruments.view.instrument.Cuiqa;
	import com.musicalInstruments.view.instrument.Instrument;
	import com.musicalInstruments.view.instrument.TapInstrument;
	import com.musicalInstruments.view.instrument.TurnTable;
	import com.representation.controller.RecordChannelController;
	import com.screens.model.RecordScreenModel;
	import com.screens.recordScreenStates.RecordScreenStateController;
	import com.screens.view.components.Clock;
	import com.screens.view.components.notes.Notes;
	import com.screens.view.components.notes.NotesChannel;
	import com.utils.Monotorizer;
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
		private var _playBtn:					Btn;
		private var _playBtnOver:				Btn;
		private var _recordTween:				GTween;
		private var _clock:						Clock;
		private var _muteButton:				Btn;
		private var _players:Vector.<PlayMusician> = new Vector.<PlayMusician>();
		
		public function RecordScreen(){
			_timerControll = Metronome.getTimeControll();
			_timeModel = Metronome.getTimeModel();
		}
		
		public function get stateController():RecordScreenStateController
		{
			return _stateController;
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

		public function get playButton():Btn{
			return _playBtn;
		}
		
		public function stopTimer():void{
			_timerControll.stop();
		}
		
		public function get notes():Notes{
			return _notes;
		}
	
		protected function initStateController(tutorial:Boolean):void{
			_stateController = new RecordScreenStateController(this,tutorial);
		}
		override public function start():void{
			if(!isInited){
				_bg.addChild(AssetsManager.getAssetByName("bgBlur.png"));
				addRepresentation();
				createPlayerAndInstrument();
				initPlayButton();
				_muteButton = new Btn("muteBTN_on.png","muteBTN_off.png");
				_guiLayer.addChild(_muteButton);
				_muteButton.x=Dimentions.WIDTH-_muteButton.width-8//_recordBtn.x+_recordBtn.width+12;
				_muteButton.y=28//_recordBtn.y+_recordBtn.height-_muteButton.height;
				_muteButton.clicked.add(onMute);
				var channel:NotesChannel=_notes.addChannel(_model.instrumentModel,_model.endAtFrame);
				_recordChannelController = new RecordChannelController(channel, _model.instrumentModel, _instrumentRecorder,_model);
				initStateController(_model.tutorial);
				_timerControll=Metronome.getTimeControll();
				layout();
				_clock = Clock.instance;
				_clock.x=290;
				_clock.y=28;
				Monotorizer.logEvent("Screen Start",_model.instrumentModel.thumbNail+"-"+Session.SONG_NAME);
				isInited = true;
			}
			addChild(_clock);
			_stateController.start();
			_timerControll.beginAtFrame = _model.beginAtFrame;
			_clock.reset();
			addBackUps();
			_instrumentRecorder.active = true;
		}
		
		private function initPlayButton():void
		{
			_recordBtn = new Btn("record_BTN_play.png","record_BTN_puse.png");
			addChild(_recordBtn);
			_recordBtn.x=(Dimentions.WIDTH-_recordBtn.width)/2;
			_recordBtn.y=44//(strip.height-practiceBtn.height)/2-2;
			_playBtn = new Btn("play_BTN_play.png","play_BTN_puse.png");
			_playBtn.x=(Dimentions.WIDTH-_playBtn.width)/2;
			_playBtn.y=44//(strip.height-practiceBtn.height)/2-2;
			_playBtnOver = new Btn("play_BTN.png","play_BTN.png");
			addChild(_playBtnOver);
			addChild(_playBtn);
			_playBtnOver.alpha=0;
			_playBtnOver.x=(Dimentions.WIDTH-_playBtnOver.width)/2;;
			_playBtnOver.y=50//(strip.height-practiceBtn.height)/2-2;
		}
		
		
		private function onMute(id:String):void
		{
			var player:PlayMusician;
			if(_muteButton.state == "pressed"){
				_muteButton.state = "idle" ;
				for each(player in _players){
					player.paused=false
				}
			}else{
				_muteButton.state = "pressed" ;
				for each(player in _players){
					player.paused=true
				}
			}
			
		}
		
		public var scoreUpdated:Signal = new Signal();
		override public function stop():void{
			_stateController.deActivate();
			_instrumentRecorder.stop();
			for each(var player:PlayMusician in _players){
				player.stop();
			}
			scoreUpdated.dispatch();
			super.stop();
		}
		
		override public function parseXML(screenData:XML,instrumentsModel:ThemeInstrumentsModel,tutorial:Boolean=false):void{
			_model = new RecordScreenModel(screenData,instrumentsModel);
			_model.tutorial = tutorial;
		}
		
		override protected function layout():void{
			super.layout();
			_instrumentRecorder.x = _model.getRecordInstrumentX();
			_instrumentRecorder.y = _model.getRecordInstrumentY();
			//_instrumentRecorder.x = (Dimentions.WIDTH-_instrumentRecorder.width)/2
				//trace("LLL",_instrumentRecorder.x)
		}
		
		private function getPlayer(playerModel:InstrumentModel):PlayMusician{
			for each(var playMusician:PlayMusician in _players){
				if(playMusician.thumbnail == playerModel.coreModel.thumbNail){
					return playMusician;
				}
			}
			var player:PlayMusician;
			player = new PlayMusician(playerModel);
			player.x = player.getX();
			player.y = player.getY();
			_players.push(player);
			return player;
		}
		
		public function get musteButton():Btn{
			return _muteButton;
		}
		
		public function get hasBackUps():Boolean{
			for each(var player:PlayMusician in _players){
				if(player.isRecorded(recordSequanceId)){
					return true;
				}
			}
			return false;
		}
		
		private function addBackUps():void{
			var player:PlayMusician;
			for each(var insModel:InstrumentModel in _model.backUpInsruments){
				player = getPlayer(insModel)
				
				if(player.isRecorded(recordSequanceId)){
					_stageLayer.addChild(player);
					player.start();
					player.play(recordSequanceId,0);
				}else{
					if(player.parent==_stageLayer){
						player.stop();
						_stageLayer.removeChild(player);
					}
				}
				
			}
			
		}
		
		private function get recordSequanceId():uint{
			if(Session.IMPROVISE_MODE){
				return _model.improviseSequnceId;
			}
			return _model.recordeSequanceId;
		}
		
		private function createPlayerAndInstrument():void{
			if(_model.instrumentModel.type=="turnTable"){
				_instrumentRecorder = new TurnTable(_model.instrumentModel as NotesInstrumentModel);
			}else if(_model.instrumentModel.type=="loopee"){
				_instrumentRecorder = new Cuiqa(_model.instrumentModel as NotesInstrumentModel);
			}else{
			_instrumentRecorder = new TapInstrument(_model.instrumentModel as NotesInstrumentModel);
			}
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
		
		public function get playGlow():Btn{
			return _playBtnOver;
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

