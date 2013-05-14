package com.screens.view {
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.gskinner.motion.GTween;
	import com.inf.PopUpsManager;
	import com.metronom.*;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.palleta.views.Scratchee;
	import com.musicalInstruments.palleta.views.TurnTable;
	import com.musicalInstruments.view.character.*;
	import com.musicalInstruments.view.components.NoteSequancePlayer;
	import com.musicalInstruments.view.instrument.*;
	import com.representation.controller.RecordChannelController;
	import com.screens.model.RecordScreenModel;
	import com.screens.recordScreenStates.RecordScreenStateController;
	import com.screens.view.components.notes.Notes;
	import com.screens.view.components.notes.NotesChannel;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.filters.BlurFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;


	public class RecordScreen extends AbstractScreen
	{
		private var _instrumentRecorder:		Instrument;
		private var _model:						RecordScreenModel;
		private var _recordChannelController:	RecordChannelController;
		private var _stateController:			RecordScreenStateController;
		private var _timerControll:				ITimeControll;
		private var _timeModel:					ITimeModel;
		private var _notes:						Notes;
		private var _practiceBtn:				Btn;
		private var _recordBtn:					Btn;
		private var _recordTween:				GTween;
		private var _timeSlider:TimeSlider = new TimeSlider(true);
		private var _timeAlert:DisplayObject;
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
		public function get practiceBtn():Btn{
			return _practiceBtn;
		}
		public function startTimer():void{
			//todo12
			//_timerControll.play();
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
				_bg.addChild(AssetsManager.getAssetByName("BCKGR_1.jpg"));
				_bg.filters = [new BlurFilter()]
				addRepresentation();
				createPlayerAndInstrument();
				super.start();
				//var strip:DisplayObject = AssetsManager.getAssetByName("line.png");
				//addChild(strip);
				//strip.y=_recordBtn.height+4;
				//_notes.y=strip.y+strip.height;
				
				_practiceBtn = new Btn("PRACTICE_IDLE.png","PRACTICE_PRESSED.png");
				addChild(_practiceBtn);
				_practiceBtn.x=267;
				_practiceBtn.y=12;
				_recordBtn = new Btn("RECORD_IDLE.png","RECORD_PRESSED.png");
				addChild(_recordBtn);
				_recordBtn.x=_practiceBtn.x+_practiceBtn.width+30;
				_recordBtn.y=12//(strip.height-practiceBtn.height)/2-2;
				
				
				//_notes.addChannel(_model.instrumentModel);
				var channel:NotesChannel=_notes.addChannel(_model.instrumentModel,_model.endAtFrame);
				_recordChannelController = new RecordChannelController(channel, _model.instrumentModel, _instrumentRecorder,_model);
				initStateController();
				_timerControll=Metronome.getTimeControll();
				addTimer();
				layout();
				isInited = true;
			}
			PopUpsManager.thumbNail = _model.instrumentModel.thumbNail;
			if(Session.instance.recordScreenGood(_model)&&Session.instance.goodScreensLength<4){
				PopUpsManager.openPopUp(getNextPopUp(_model.instrumentModel.thumbNail));
			}else if(Session.instance.goodScreensLength==4 && !Session.instance.completePopUpShowen){
				PopUpsManager.openPopUp(getNextPopUp(_model.instrumentModel.thumbNail));
				Session.instance.completePopUpShowen = true;				
			}
			else if(!Session.instance.recordScreenGood(_model) && !Session.instance.demoClicked && _model.instrumentModel.thumbNail == "bottles.png"){
				PopUpsManager.openPopUp(PopUpsManager.OPEN_DEMO);
			}else{
				PopUpsManager.openPopUp(PopUpsManager.PRESS_RECORD);
			}
			_stateController.start();
			_timerControll.beginAtFrame = _model.beginAtFrame;
			addBackUps();
		}
		private function addTimer():void{
			var tBg:Shape = new Shape();
			tBg.graphics.beginFill(0x174C5B,0.8);
			tBg.graphics.drawRoundRect(0,0,_timeSlider.width+10,50,6,6);
			tBg.graphics.endFill();
			//addChild(tBg);
			tBg.x=Dimentions.WIDTH-tBg.width-3;
			tBg.y=21;
			addChild(_timeSlider);
			_timeSlider.x=(Dimentions.WIDTH-_timeSlider.width)/2;
			_timeSlider.y=77;
			var timeIcon:DisplayObject = AssetsManager.getAssetByName("hour_glass.png");
			addChild(timeIcon);
			timeIcon.x=_timeSlider.x-timeIcon.width+2;
			timeIcon.y=_timeSlider.y+(_timeSlider.height-timeIcon.height)/2;
			_timeAlert = AssetsManager.getAssetByName("hour_glass_alert.png");
			addChild(_timeAlert);
			_timeAlert.x = timeIcon.x;
			_timeAlert.y = timeIcon.y;
			_timeAlert.visible=false;
			//_timeSlider.x=tBg.x;
			//_timeSlider.y=282;
			_timeSlider.value=1;
			//_timeSlider.rotation = 90;
		}
		
		public function get timeAlert():DisplayObject{
			return _timeAlert;
		}
		
		private function getNextPopUp(scr:String):String{
			var nextStr:String;
			switch(scr){
				case "bottles.png":
					nextStr = PopUpsManager.BASS;
					break;
				case "bass_flash.jpg":
					nextStr = PopUpsManager.DRUMS;
					break;
				case "drum.png":
					nextStr = PopUpsManager.TURN_TABLE;
					break;
				case "turnTable":
					nextStr = PopUpsManager.DONE;
					break;
			}
			return nextStr;
		}
		override public function stop():void{
			_stateController.deActivate();
			PopUpsManager.closePopUp();
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
			//f_instrumentRecorder.scaleX=0.8;
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
			
//			if(_players.length>0){
//				for each(var playMusician:PlayMusician in _players){
//					_stageLayer.addChild(playMusician);
//					playMusician.start();
//					player.play(_model.recordeSequanceId,0);
//				}
//				return;
//			}
			var player:PlayMusician;
			for each(var insModel:InstrumentModel in _model.backUpInsruments){
				//var player:NoteSequancePlayer = new NoteSequancePlayer(NotesInstrumentModel(insModel.coreModel));
				//_backUps.push(player);
				player = isOnStage(insModel)
				if(player == null){
					player = new PlayMusician(insModel);
					player.x = player.getX();
					player.y = player.getY();
					player.filters = [new BlurFilter()];
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
		
//		private function onPlayerNote(noteId:String):void{
//			_instrumentRecorder.animateNote(noteId,"play");
//		}
//		
//		private function onPlayerUnNote(noteId:String):void{
//			_instrumentRecorder.animateNote(noteId,"idle");
//		}
		
		private function addRepresentation():void{
			_notes = new Notes(_model.noteTargetsY+_model.noteTargetsYOffset);
			_guiLayer.addChild(_notes);
		}
		
		public function get timeSlider():TimeSlider{
			return _timeSlider;
		}
		
		
		public function get notesLength():uint{
			return NoteSequanceModel(NotesInstrumentModel(_model.instrumentModel).getSequanceById(_model.learnedSequanceId)).notes.length
		}
		
	}
}



import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

import flashx.textLayout.formats.TextAlign;

class ScorePannel extends Sprite{
	
	private var _scoreField:TextField;
	private var _score:uint=0;
	private var _total:uint;
	public function ScorePannel(thumbNail:String,total:uint){
		_total=total;
		init(thumbNail);
	}
	
	private function init(thumbNail:String):void{
		this.graphics.beginFill(0x323232);
		this.graphics.drawRoundRect(0,0,150,40,6,6);
		this.graphics.endFill();
		_scoreField = new TextField();
		_scoreField.defaultTextFormat = new TextFormat("Verdana",26,0xFFFFFF,null,null,null,null,null,TextAlign.CENTER);
		_scoreField.width = 100;
		_scoreField.height = 40;
		_scoreField.x=45;
		_scoreField.y=2;
		addChild(_scoreField);
		reset();
		addChild(getIcon(thumbNail));
	}
	
	public function addScore(val:int):void{
		_score+=val;
		_scoreField.text = _score+" / "+_total;
	}
	
	public function get score():uint{
		return _score;
	}
	
	public function reset():void{
		_score=0;
		_scoreField.text=_score+" / "+_total;
	}
	
	public function get total():uint{
		return _total;
	}
	
	private function getIcon(thumbNail:String):DisplayObject{
		var icon:DisplayObject;
		switch(thumbNail){
			case "bottles.png":
				icon = AssetsManager.getAssetByName("bottles_icon.png");
				break;
			case "drum.png":
				icon = AssetsManager.getAssetByName("drum_icon.png");
				break;
			case "bass_flash.jpg":
				icon = AssetsManager.getAssetByName("bass_icon.png");
				break;
		}
		return icon;
	}
	
	
}

/*
private function addLyrics():void{
	_lyrics = new LyricView();
	_lyricsController = new LyricController(_lyrics,_model.lyrics);
	_stageLayer.addChild(_lyrics);
}
*/

