package com.screens.view {
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.gskinner.motion.GTween;
	import com.inf.PopUp;
	import com.inf.PopUpsManager;
	import com.metronom.*;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.PalletModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
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
	import flash.geom.Point;


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
		private var _recordTween:GTween;
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
				var channel:NotesChannel=_notes.addChannel(_model.instrumentModel,_model.endAtFrame);
				_recordChannelController = new RecordChannelController(channel, _model.instrumentModel, _instrumentRecorder,_model);
				initStateController();
				_timerControll=Metronome.getTimeControll();
				_score = new ScorePannel(_model.instrumentModel.thumbNail);
				addChild(_score);
				_score.x=Dimentions.WIDTH-_score.width-12;
				_score.y=(strip.height-_score.height)/2-2;
				layout();
				isInited = true;
			}
			PopUpsManager.thumbNail = _model.instrumentModel.thumbNail;
			if(Session.instance.recordScreenGood(_model)){
				PopUpsManager.openPopUp(getNextPopUp(_model.instrumentModel.thumbNail));
			}
			else if(!Session.instance.demoClicked){
				PopUpsManager.openPopUp(PopUpsManager.OPEN_DEMO);
			}else{
				PopUpsManager.openPopUp(PopUpsManager.PRESS_RECORD);
			}
			_stateController.start();
			_timerControll.beginAtFrame = _model.beginAtFrame;
		}
		private var _score:ScorePannel;
		private function getNextPopUp(scr:String):String{
			var nextStr:String;
			switch(scr){
				case "bottles.png":
					nextStr = PopUpsManager.DRUMS;
					break;
				case "drum.png":
					nextStr = PopUpsManager.BASS;
					break;
				case "bass_flash.jpg":
					nextStr = PopUpsManager.DONE;
					break;
			}
			return nextStr;
		}
		override public function stop():void{
			_stateController.deActivate();
			PopUpsManager.closePopUp();
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
			_notes = new Notes(_model.noteTargetsY+_model.noteTargetsYOffset);
			_stageLayer.addChild(_notes);
		}
		
		
		public function get score():uint{
			return _score.score;
		}
		public function addScore(val:int):void{
			_score.addScore(val);
		}
		public function resetScore():void{
			_score.reset();
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
	public function ScorePannel(thumbNail:String){
		init(thumbNail);
	}
	
	private function init(thumbNail:String):void{
		this.graphics.beginFill(0x333333);
		this.graphics.drawRect(0,0,150,40);
		this.graphics.endFill();
		_scoreField = new TextField();
		_scoreField.defaultTextFormat = new TextFormat("Arial",22,0xFFFFFF,true,null,null,null,null,TextAlign.CENTER);
		_scoreField.width = 100;
		_scoreField.height = 30;
		_scoreField.x=40;
		_scoreField.y=5;
		addChild(_scoreField);
		_scoreField.text=_score+"";
		addChild(getIcon(thumbNail));
	}
	
	public function addScore(val:int):void{
		_score+=val;
		_scoreField.text = _score+"";
	}
	
	public function get score():uint{
		return _score;
	}
	
	public function reset():void{
		_score=0;
		_scoreField.text=_score+"";
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

