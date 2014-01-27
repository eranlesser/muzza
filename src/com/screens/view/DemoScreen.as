package com.screens.view {
	import com.constants.Dimentions;
	import com.constants.Gains;
	import com.constants.Rhythms;
	import com.constants.Session;
	import com.metronom.ITimeControll;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.musicalInstruments.view.character.PlayMusician;
	import com.screens.model.PlayScreenModel;
	import com.view.gui.Btn;
	import com.view.gui.ToggleBut;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;

	public class DemoScreen extends AbstractScreen implements IScreen{
		
		protected var _model:				PlayScreenModel;
		private var _timeModel:				ITimeModel = Metronome.getTimeModel();
		protected var _timeControll:		ITimeControll ;
		protected var _instruments:			Vector.<PlayMusician>
		private var _mask:					Shape;
		private var _frame:					DisplayObject;
		private var _closeBtn:				Btn;
		private var _playPauseBtn:			ToggleBut;
		public var close:					Signal=new Signal();
		private var _timeSlider:TimeSlider;
		
		
		public function DemoScreen(){
			_instruments = new Vector.<PlayMusician>();
			_timeControll= Metronome.getTimeControll();
			
		}
		
		override public function get screenName():String{
			return "demo";
		}
		
		override public function parseXML(screenData:XML,instrumentsModel:ThemeInstrumentsModel):void{
			_model = new PlayScreenModel(screenData,instrumentsModel);
		}
		
		protected function init(masked:Boolean=true):void{
			_model.start();
			//addSign();
			for each(var instrumentModel:InstrumentModel in _model.instruments){
				(addInstrument(instrumentModel));
			}
			
			layout();
			isInited = true;
			//////
			for each(var ins:PlayMusician in _instruments){
				ins.start();
			}
			
			if(masked){ // demo - not listen
				_mask=getMask();
				//_stageLayer.mask=_mask;
				addChild(_mask)
				_bg.mask=_mask;
				_frame=AssetsManager.getAssetByName("DEMO_SCREEN_FRAME.png");
				_guiLayer.addChild(_frame)
				_frame.x=29;
				_frame.y=19;
				
				_closeBtn = new Btn("CLOSE_BUTTON_IDLE.png","CLOSE_BUTTON_SELECTED.png");
				_guiLayer.addChild(_closeBtn);
				_closeBtn.x=950;
				_closeBtn.y=19;
				_closeBtn.clicked.add(onClose);
				
				var nowPlaying:DisplayObject=AssetsManager.getAssetByName(_model.nowPlaying);
				_guiLayer.addChild(nowPlaying);
				nowPlaying.x=29+71;
				nowPlaying.y=531+19;
				
				_playPauseBtn = new ToggleBut("pause.png","play.png");
				_guiLayer.addChild(_playPauseBtn);
				_playPauseBtn.x=480;
				_playPauseBtn.y=531+19+10;
				_playPauseBtn.clicked.add(onPlayPause);
				var reloader:Btn = new Btn("RELOAD_IDLE.png","RELOAD_PRESSED.png");
				_guiLayer.addChild(reloader);
				reloader.x=_playPauseBtn.x+_playPauseBtn.width;
				reloader.y=531+19+10;
				reloader.clicked.add(reload);
				_timeSlider = new TimeSlider();
				_guiLayer.addChild(_timeSlider);
				_timeSlider.x=(Dimentions.WIDTH)/2+_frame.x-_timeSlider.width/2;
				_timeSlider.y=531+19+40;
				
//				var anotherMask:Shape = new Shape();
//				anotherMask.graphics.beginFill(0xFFFFFF);
//				anotherMask.graphics.drawRect(6,10,940,580);
//				anotherMask.graphics.endFill();
//				//mask=anotherMask;
//				anotherMask.x=29+16;
//				anotherMask.y=19+22;
				//var timeBar:DisplayObject=AssetsManager.getAssetByName("");
			}
			_stageLayer.addChild(AssetsManager.getAssetByName("Pole_Left.png"));
			if(_timeSlider)
				_stageLayer.mask = addChild(getMask());
		}
		
		
		private function getMask():Shape{
			var gmask:Shape=new Shape();
			gmask.graphics.beginFill(0xFFFFFF);
			gmask.graphics.drawRect(51,49,920,520);
			gmask.graphics.endFill();
			return gmask;
		}
		
		private function reload(str:String):void{
			_timeControll.toZero();
			_playPauseBtn.state=1;
		}
		
		public function onPlayPause(btnId:String):void{
			_timeControll.togglePause();
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
				
				//setClock();
			}
			if(_timeSlider){
				_timeControll.play(_timeSlider,_model.endAtFrame,{value:100});
			}else{
				_timeControll.play(this,_model.endAtFrame,null);
			}
			stage.frameRate=Rhythms.FRAME_RATE;
			//trace("frame rate is",stage.frameRate)
			if(_timeSlider){
				_timeSlider.value=(0);
			}
			startPlayers();
		}
		
//		private function setTimeSlider():void{
//			_timeSlider.setValue(_timeModel.currentTick/_model.endAtFrame)
//		}
		
		
		
		protected function startPlayers():void{
			if(!this.parent){
				return;
			}
			_timeControll.beginAtFrame = _model.beginAtFrame;
			for each(var ins:PlayMusician in _instruments){
				ins.play(_model.playSequance,_model.beginAtFrame,Gains.PLAY_INSTRUMENT_LEVEL);
				ins.sequanceDone.addOnce(onPlayerDone);
			}
			_playPauseBtn.state=0;
		}
		
		protected function onPlayerDone():void{
			var donePlayers:uint=0;
			for each(var player:PlayMusician in _instruments){
				if(player.done){
					donePlayers++;
				}else{
					break;
				}
			}
			Session.instance.goodScreensLength = donePlayers;
			if(donePlayers==_instruments.length){
				//if(_timeModel.currentTick>0 && donePlayers==_model.instruments.length){
				if(_timeModel.currentTick>0 ){//&& donePlayers==_instruments.length
					endMusciPiece();
				}
			}
		}
		
		override public function stop():void{
			for each(var ins:PlayMusician in _instruments){
				ins.stop();
			}
			_timeControll.stop();
			//Clock.getInstance().reset();
			//Clock.getInstance().visible=false;
			if(_timeSlider){
				//_timeModel.tickSignal.remove(setTimeSlider);
			}
		}
		
		
		protected function setClock():void{
//			var clock:Clock = Clock.getInstance()//new Clock(_guiLayer);
//			clock.x =  281;
//			clock.y = 54;
//			addChild(clock);
//			clock.visible = true;
		}
		
		override protected function layout():void{
			super.layout();
			for each(var ins:PlayMusician in _instruments){
				ins.x = ins.getX();
				ins.y = ins.getY();
			}
			
		}
		
		protected function addInstrument(insModel:InstrumentModel):void{
			var ins:PlayMusician = new PlayMusician(insModel);
			//if(ins.type=="bg"){
			if(_model.instruments.indexOf(insModel)<2){
				
				_stageLayer.addChildAt(ins,0);
			}else{
				_stageLayer.addChild(ins);
			}
			//}else{
			//	_stageLayer.addChild(ins);
			//}
			_instruments.push(ins)
		}
		public var demoComplete:Signal = new Signal();
		protected function endMusciPiece():void{
			//Clock.getInstance().stop();
			if(_timeSlider){
				//_timeModel.tickSignal.remove(setTimeSlider);
				if(_model.endAtFrame-10 <= _timeModel.currentTick){
				//PopUpsManager.openPopUp(PopUpsManager.CLOSE_DEMO);
					_playPauseBtn.state=1;
				//Flurry.logEvent("demo complete");
				}
				demoComplete.dispatch();
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
			tField.text = "Train Beats";
			tField.type = TextFieldType.INPUT;
			tField.maxChars = 14;
			tField.x=15;
			tField.y=32;
		}
		
	}
}
