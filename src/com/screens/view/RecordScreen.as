package com.screens.view {
	import com.constants.Gains;
	import com.constants.Rhythms;
	import com.container.ToolBar;
	import com.metronom.*;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.musicalInstruments.view.components.SpeechBubble;
	import com.musicalInstruments.view.playable.*;
	import com.musicalInstruments.view.recordable.*;
	import com.representation.Representation;
	import com.representation.controller.RecordChannelController;
	import com.representation.view.Channel;
	import com.screens.model.RecordScreenModel;
	import com.screens.recordScreenStates.RecordScreenStateController;
	import com.screens.view.components.MenuButton;
	import com.view.MetronomView;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;


	public class RecordScreen extends MusicalScreen
	{
		private var _instrumentRecorder:		RecordableView;
		private var _bandInstruments:			Vector.<PlayMusician>
		private var _model:						RecordScreenModel;
		private var _recordChannelController:	RecordChannelController;
		protected var _stateController:			RecordScreenStateController;
		private var _menu:						ToolBar;
		private var _timerControll:				ITimeControll;
		private var _timeModel:					ITimeModel;
		private var _metronomView:MetronomView;
				
		public function RecordScreen(){
			_timerControll = Metronome.getTimeControll(this);
			_timeModel = Metronome.getTimeModel();
			_bandInstruments=new Vector.<PlayMusician>();
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
		public function get channel():Channel{
			return _recordChannelController.channel;
		}
		
		public function get listenButton():MenuButton{
			return _menu.recordScreenMenu.listenButton;
		}
		
		public function get recordButton():MenuButton{
			return _menu.recordScreenMenu.recordButton;
		}
		public function get practiceButton():MenuButton{
			return _menu.recordScreenMenu.practiceButton;
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
		
		public function get representation():Representation{
			return _representation;
		}
		public function get bubble():SpeechBubble{
			var playerIndex:uint=0;
			if(Math.random()>0.5&&_bandInstruments.length>1){
				playerIndex=1;
			}	
			if(_bandInstruments.length>0)
				return _bandInstruments[playerIndex].bubble;
			else
				return new SpeechBubble();
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
				for each(var instrumentModel:InstrumentModel in _model.bandInstruments){
					_bandInstruments.push(addInstrument(instrumentModel));
				}
				var playChannel:Channel=_representation.addChannel(_model.instrumentModel);
				var channel:Channel=_representation.addChannel(_model.instrumentModel);
				_recordChannelController = new RecordChannelController(channel, _model.instrumentModel, _instrumentRecorder ,_model);
				initStateController();
				_menu=ToolBar.instance;
				_timerControll=Metronome.getTimeControll(this);
				_metronomView = new MetronomView();
				addChild(_metronomView);
				_metronomView.x=44;
				_metronomView.y=84;
				layout();
				isInited = true;
				var tmr:Timer=new Timer(55,1);
				tmr.addEventListener(TimerEvent.TIMER_COMPLETE,initBand);
				tmr.start();
			}else{
				for each(var ins:PlayMusician in _bandInstruments){
					ins.start();
				}
			}
			_stateController.start();
			_timerControll.beginAtFrame = _model.beginAtFrame;
			stage.frameRate = Rhythms.DELAY_COUNT;
		}
		
		private function initBand(e:TimerEvent):void{
			for each(var ins:PlayMusician in _bandInstruments){
				ins.start();
			}
		}
		
		public function set bandActive(value:Boolean):void{
			if(value){
				bandPlay()
			}else{
				for each(var ins:PlayMusician in _bandInstruments){
						ins.stop();
				}
			}
		}
		
		public function get bandInstruments():Vector.<PlayMusician>{
			return _bandInstruments;
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
			for each(var ins:PlayMusician in _bandInstruments){
				ins.x = ins.getX();
				ins.y = ins.getY();
				ins.scaleX=0.6;
				ins.scaleY=0.6;
			}
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
			_representation = new Representation(2);
			_stageLayer.addChild(_representation);
			_representation.scaleY=1.2;
		}
		
		private function bandPlay():void{
			var ins:PlayMusician;
			for each(ins in _bandInstruments){
				ins.play(99,_model.beginAtFrame,Gains.PLAYBACK_INSTRUMENT_LEVEL);
			}
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

