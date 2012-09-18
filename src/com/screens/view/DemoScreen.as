package com.screens.view {
	import com.constants.*;
	import com.container.ToolBar;
	import com.metronom.*;
	import com.musicalInstruments.BackGroundSound;
	import com.musicalInstruments.model.*;
	import com.musicalInstruments.view.components.SoundPlayer;
	import com.musicalInstruments.view.playable.PlayMusician;
	import com.representation.Representation;
	import com.representation.controller.PlayChannelController;
	import com.representation.view.Channel;
	import com.screens.lyrics.*;
	import com.screens.model.PlayScreenModel;
	import com.screens.view.components.Clock;
	import com.view.tools.AssetsManager;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.*;
	import flash.utils.Timer;

	/**
	 * 
	 * @author eranlesser
	 * Abstract class for different themes
	 * 
	 */	
	public class DemoScreen extends MusicalScreen implements IScreen{
		
		protected var _model:				PlayScreenModel;
		private var _timeModel:				ITimeModel = Metronome.getTimeModel();
		protected var _timeControll:		ITimeControll ;
		protected var _instruments:			Vector.<PlayMusician>
		private var _lyricsController:		LyricController;
		private var _channelControllers:	Vector.<PlayChannelController>;
		private var _loadSign:TextField;
		private var _backGroundSoundPlayer:BackGroundSound;
		protected var _representation:Representation;
		
		public function DemoScreen(){
			_instruments = new Vector.<PlayMusician>();
			_channelControllers = new Vector.<PlayChannelController>();
			_timeControll= Metronome.getTimeControll(this);
			
		}
		
		override public function parseXML(screenData:XML,instrumentsModel:ThemeInstrumentsModel):void{
			_model = new PlayScreenModel(screenData,instrumentsModel);
		}
		
		protected function init():void{
			removeChild(_loadSign);
			_model.start();
			addRepresentation();
			//_bg.addChild(AssetsManager.getAssetByName("BCKGR_1.jpg"));
			addSign();
			for each(var instrumentModel:InstrumentModel in _model.instruments){
				_instruments.push(addInstrument(instrumentModel));
			}
			//_stageLayer.addChild(AssetsManager.getAssetByName("Pole_Left.png"));
			layout();
			isInited = true;
			//////
			for each(var ins:PlayMusician in _instruments){
				ins.start();
			}
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.start();
			}
			_representation.visible=false;
			unPause();
			setClock();
			_stageLayer.addChild(AssetsManager.getAssetByName("Pole_Left.png"));
			
			if(_model.backGraoundSound!=""){
				_backGroundSoundPlayer=new BackGroundSound(_model.backGraoundSound);
			}
			
			var tmr:Timer=new Timer(1000,1);
			tmr.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
			tmr.start();
		}
		
		override public function start():void{
			if(!isInited){
				_bg.addChild(AssetsManager.getAssetByName("BCKGR_1.jpg"));
				addLoadingSign();
				//var initTimer:Timer=new Timer(100,1);
				//initTimer.addEventListener(TimerEvent.TIMER_COMPLETE,init);
				//initTimer.start();
				init()
				
			}else{
				for each(var ins:PlayMusician in _instruments){
					ins.start();
				}
				for each(var channelController:PlayChannelController in _channelControllers){
					channelController.start();
				}
				_representation.visible=false;
				unPause();
				setClock();
				
				var tmr:Timer=new Timer(1000,1);
				tmr.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
				tmr.start();
			}
			
			
		}
		
		private function addLoadingSign():void{
			_loadSign=new TextField();
			var fmt:TextFormat=new TextFormat("Arial",62,0xFFFFFF);
			_loadSign.text="Loading";
			_loadSign.setTextFormat(fmt);
			_loadSign.autoSize=TextFieldAutoSize.LEFT;
			addChild(_loadSign);
			_loadSign.x=(Dimentions.WIDTH-_loadSign.width)/2
			_loadSign.y=(Dimentions.HEIGHT-_loadSign.height)/2
		}
		
		private function onTimerComplete(e:Event):void{
			Timer(e.target).removeEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
			_timeControll.beginAtFrame = _model.beginAtFrame;
			for each(var ins:PlayMusician in _instruments){
				ins.play(_model.playSequance,_model.beginAtFrame,Gains.PLAY_INSTRUMENT_LEVEL);
				ins.sequanceDone.add(onPlayerDone);
			}
			if(_backGroundSoundPlayer){
				_backGroundSoundPlayer.play();
			}
			_representation.start();
			
		}
		
		private function onPlayerDone():void{
			var donePlayers:uint=0;
			for each(var player:PlayMusician in _instruments){
				if(player.done){
					donePlayers++;
				}else{
					break;
				}
			}
			if(donePlayers==_instruments.length){
				if(_timeModel.currentTick>0){
					endMusciPiece();
					if(_backGroundSoundPlayer){
						_backGroundSoundPlayer.stop();
					}
				}else{
					stop();
				}
			}
		}
		
		protected function unPause():void{
			Clock.getInstance().play();
			_timeControll.play();
		}
		
		override public function stop():void{
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.stop();
			}
			pause();
			if(_backGroundSoundPlayer){
				_backGroundSoundPlayer.stop();
			}
			_representation.stop();
			Clock.getInstance().reset();
			Clock.getInstance().visible=false;
		}
		
		protected function pause():void{
			for each(var ins:PlayMusician in _instruments){
				ins.stop();
			}
			_timeControll.stop(); 
			Clock.getInstance().stop();
		}
		
		protected function setClock():void{
			var clock:Clock = Clock.getInstance()//new Clock(_guiLayer);
			clock.x =  281;
			clock.y = 54;
			addChild(clock);
			clock.visible = true;
		}
		
		override protected function layout():void{
			super.layout();
			for each(var ins:PlayMusician in _instruments){
				ins.x = ins.getX();
				ins.y = ins.getY();
			}
			_representation.y=Dimentions.HEIGHT - _representation.height-23;
		}
		
		
		
		private function addRepresentation():void{
			_representation = new Representation(4);
			_representation.y = Dimentions.HEIGHT -38*3;
			_stageLayer.addChild(_representation);
		}
		
		

		private function addInstrument(insModel:InstrumentModel):PlayMusician{
			var ins:PlayMusician = new PlayMusician(insModel);
			_stageLayer.addChild(ins);
			var channel:Channel = _representation.addChannel(insModel.coreModel);
			_channelControllers.push(new PlayChannelController( channel, insModel,_model.playSequance));
			return ins;
		}
		
		protected function endMusciPiece():void{
			Clock.getInstance().stop();
			for each(var channelController:PlayChannelController in _channelControllers){
				channelController.stop();
			}
		}
		
		
		private function addSign():void{
			var sign:Sprite = new Sprite();
			sign.addChild(AssetsManager.getAssetByName("sign.png"));
			_bg.addChild(sign);
			sign.x=380;
			sign.y=40;
			var tField:TextField = new TextField()
			tField.defaultTextFormat = new TextFormat("HelveticaNeue",24,0Xd6d6d9);
			sign.addChild(tField);
			tField.autoSize = TextFieldAutoSize.LEFT;
			tField.text = "The Recyclers";
			tField.type = TextFieldType.INPUT;
			tField.maxChars = 14;
			tField.x=15;
			tField.y=32;
		}
		
	}
}