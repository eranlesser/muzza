package com.screens.view {
	import com.constants.*;
	import com.metronom.*;
	import com.musicalInstruments.model.*;
	import com.musicalInstruments.view.character.PlayMusician;
	import com.screens.lyrics.*;
	import com.screens.model.PlayScreenModel;
	import com.screens.view.components.Clock;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.*;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;

	public class DemoScreen extends MusicalScreen implements IScreen{
		
		protected var _model:				PlayScreenModel;
		private var _timeModel:				ITimeModel = Metronome.getTimeModel();
		protected var _timeControll:		ITimeControll ;
		protected var _instruments:			Vector.<PlayMusician>
		private var _mask:					Shape;
		private var _frame:					DisplayObject;
		private var _closeBtn:				Btn;
		public var close:					Signal=new Signal();
		
		
		public function DemoScreen(){
			_instruments = new Vector.<PlayMusician>();
			_timeControll= Metronome.getTimeControll(this);
			
		}
		
		override public function parseXML(screenData:XML,instrumentsModel:ThemeInstrumentsModel):void{
			_model = new PlayScreenModel(screenData,instrumentsModel);
		}
		
		protected function init(masked:Boolean=true):void{
			_model.start();
			addSign();
			for each(var instrumentModel:InstrumentModel in _model.instruments){
				_instruments.push(addInstrument(instrumentModel));
			}
			layout();
			isInited = true;
			//////
			for each(var ins:PlayMusician in _instruments){
				ins.start();
			}
			
			unPause();
			setClock();
			
			
			if(masked){
				_mask=new Shape();
				_mask.graphics.beginFill(0xFFFFFF);
				_mask.graphics.drawRect(6,10,940,580);
				_mask.graphics.endFill();
				_stageLayer.mask=_mask;
				_bg.mask=_mask;
				_frame=AssetsManager.getAssetByName("DEMO_SCREEN_FRAME.png");
				_stageLayer.addChild(_frame)
				_frame.x=29;
				_frame.y=19;
				_mask.x=29;
				_mask.y=19;
				
				_closeBtn = new Btn("CLOSE_BUTTON_IDLE.png","CLOSE_BUTTON_SELECTED.png");
				_stageLayer.addChild(_closeBtn);
				_closeBtn.x=950;
				_closeBtn.y=19;
				_closeBtn.clicked.add(onClose);
				
				var nowPlaying:DisplayObject=AssetsManager.getAssetByName("ODE_TO_JOY_nowPlaying.png");
				_stageLayer.addChild(nowPlaying);
				nowPlaying.x=29+71;
				nowPlaying.y=531+19;
				
				var playBtn:Btn = new Btn("pause.png","play.png");
				_stageLayer.addChild(playBtn);
				playBtn.x=131+39+nowPlaying.x+nowPlaying.width;
				playBtn.y=nowPlaying.y+10;
				playBtn.clicked.add(onPlay);
				var reloader:Btn = new Btn("RELOAD_IDLE.png","RELOAD_IDLE.png");
				_stageLayer.addChild(reloader);
				reloader.x=playBtn.x+playBtn.width;
				reloader.y=playBtn.y;
				
				//var timeBar:DisplayObject=AssetsManager.getAssetByName("");
			}else{
				_stageLayer.addChild(AssetsManager.getAssetByName("Pole_Left.png"));
			}
		}
		
		private function onPlay(str:String):void{
			if(_timeModel.isPlaying)
				pause();
			else
				unPause();
			trace(str)
		}
		
		private function onClose(btnid:String):void{
			close.dispatch();
		}
		
		override public function start():void{
			if(!isInited){
				_bg.addChild(AssetsManager.getAssetByName("BCKGR_1.jpg"));
				init()
			}else{
				for each(var ins:PlayMusician in _instruments){
					ins.start();
				}
				
				unPause();
				setClock();
			}
			var tmr:Timer=new Timer(1000,1);
			tmr.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
			tmr.start();
			stage.frameRate=Rhythms.FRAME_RATE;
			
		}
		
		
		
		private function onTimerComplete(e:Event):void{
			Timer(e.target).removeEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
			_timeControll.beginAtFrame = _model.beginAtFrame;
			for each(var ins:PlayMusician in _instruments){
				ins.play(_model.playSequance,_model.beginAtFrame,Gains.PLAY_INSTRUMENT_LEVEL);
				ins.sequanceDone.add(onPlayerDone);
			}
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
			for each(var ins:PlayMusician in _instruments){
				ins.stop();
			}
			pause();
			Clock.getInstance().reset();
			Clock.getInstance().visible=false;
		}
		
		private function pause():void{
			
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
		}
		
		protected function addInstrument(insModel:InstrumentModel):PlayMusician{
			var ins:PlayMusician = new PlayMusician(insModel);
			_stageLayer.addChild(ins);
			return ins;
		}
		
		protected function endMusciPiece():void{
			Clock.getInstance().stop();
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
			tField.text = "Train Beats";
			tField.type = TextFieldType.INPUT;
			tField.maxChars = 14;
			tField.x=15;
			tField.y=32;
			tField.addEventListener(MouseEvent.CLICK,onTextClikced)
		}
		
		private function onTextClikced(e:Event):void{
			trace("rrr")
		}
	}
}