package com.container.controller
{
	import com.constants.Dimentions;
	import com.constants.States;
	import com.container.Presenter;
	import com.inf.Inf;
	import com.model.FileProxy;
	import com.model.MainThemeModel;
	import com.model.texts.HebrewTexts;
	import com.model.texts.ITexts;
	import com.screens.recordScreenStates.RecordState;
	import com.screens.view.ListenScreen;
	import com.screens.view.RecordScreen;
	import com.view.gui.Btn;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class TutorialProgressControl extends ProgressControl
	{
		private var _inf:Inf;
		private var _mask:Sprite;
		private var _recordScreen:RecordScreen;
		private var _texts:ITexts;
		public function TutorialProgressControl(view:Presenter,theme:MainThemeModel,themeName:String)
		{
			super(view,theme,themeName);
			_mask = new Sprite();
			_mask.graphics.beginFill(0xFFFFFF,0.3);
			_mask.graphics.drawRect(0,0,Dimentions.WIDTH,Dimentions.HEIGHT);
			_mask.graphics.endFill();
			_texts = new HebrewTexts();
		}
		
		override public function start():void{
			super.start();
			openInstruction(_texts.getTitleById("demo"),_texts.getMsgById("demo"),85,500,"bottles.png",Inf.BTM_LEFT,_view.menu.demoButton);
			_recordScreen = (_mainThemeModel.screensModel.currentScreen as RecordScreen);
			hideButtons();
		}
		
		
		private function hideButtons():void{
			if(_recordScreen){
				_recordScreen.playButton.visible = false;
				_recordScreen.recordButton.visible = false;
				_recordScreen.playGlow.visible = false;
				_recordScreen.recorder.visible = false;
				_view.menu.navigator.visible = false;
				_recordScreen.musteButton.visible=false;
			}
		}
		
		private function showPlayButton():void{
			if(_recordScreen){
				_recordScreen.playButton.visible = true;
				_recordScreen.playButton.clicked.add(onPlay);
			}
		}
		
		private function onPlay(str:String):void
		{
			// tutorial - timing
			if(_recordScreen&& _recordScreen.model.instrumentModel.thumbNail == "bottles.png"){
				openInstruction(_texts.getTitleById("cueline"),_texts.getMsgById("cueline"),460,65,"bottles.png",Inf.BTM_LEFT,null);
			}
			(_recordScreen.stateController.currentState as RecordState).scoreSignal.add(onScore);
			
		}
		
		private function onScore(toPlayTime:int,curTime:int,goodNote:Boolean,xx:uint=0):void
		{
			// TODO Auto Generated method stub
			if(toPlayTime ==curTime && goodNote){
				closePopUp();
				(_recordScreen.stateController.currentState as RecordState).scoreSignal.remove(onScore);
			}
		}
		
		override protected function openDemo(silentMode:Boolean=false):void{
			super.openDemo(silentMode);
			if(!silentMode){
				closePopUp();
				_mainThemeModel.screensModel.demoScreen.complete.add(onDemoComplete);
			}
		}
		
		override protected function closeDemo(silentMode:Boolean=false):void{
			super.closeDemo(silentMode);
			if(!silentMode){
				closePopUp();
				_mainThemeModel.screensModel.demoScreen.complete.remove(closePopUp);
				if(_recordScreen && _recordScreen.recorder.visible==false && _recordScreen.model.instrumentModel.thumbNail == "bottles.png"){
					var yy:Number = _recordScreen.recorder.y;
					_recordScreen.stateController.stateChanged.add(onStatesChanged);
					openInstruction(_texts.getTitleById("play"),_texts.getMsgById("play"),450,130,"bottles.png",Inf.TOP_LEFT,_recordScreen.playButton);
				}
				showPlayButton();
			}
		}
		
		private function onDemoComplete():void{
			openInstruction(_texts.getTitleById("close"),_texts.getMsgById("close"),697,85,"bottles.png",Inf.TOP_RIGHT,_mainThemeModel.screensModel.demoScreen.closeBtn);
		}
		
		override protected function gotoScreen(scr:String):void{
			super.gotoScreen(scr);
			_recordScreen = (_mainThemeModel.screensModel.currentScreen as RecordScreen);
			if(_recordScreen){
				_recordScreen.stateController.stateChanged.add(onStatesChanged);
				hideButtons();
			}else{
				var listenScreen:ListenScreen = _mainThemeModel.screensModel.currentScreen as ListenScreen;
				if(listenScreen){
					listenScreen.complete.addOnce(onSessionComplete);
					listenScreen.backBtn.visible = false;
				}
			}
		}
		
		private function onSessionComplete():void
		{
			openInstruction(_texts.getTitleById("welldone"),_texts.getMsgById("welldone"),410,110,"bottles.png",Inf.TOP_LEFT,null);
			
		}
		
		private function onStatesChanged(state:String):void
		{
			if(state == States.RECORD){
				closePopUp();
			}else{
				if(_recordScreen.model.isRecorded){
					var thumbNail:String = _recordScreen.model.instrumentModel.thumbNail;
					switch(thumbNail){
						
						case "bottles.png":
							openPop(_texts.getTitleById("bottles"),"",(Dimentions.WIDTH-300)/2,230,thumbNail);
							break;
						case "drum.png":
							openPop(_texts.getTitleById("drums"),"",(Dimentions.WIDTH-300)/2,230,thumbNail);
							break;
						case "bass_flash.jpg":
							openPop(_texts.getTitleById("bass"),"",(Dimentions.WIDTH-300)/2,230,thumbNail);
							break;
					}
				}
			}
			
		}
		
		private function onListenDone():void{
			
		}
		
		
		public function openInstruction(title:String,content:String,xx:uint,yy:uint,thumbNail:String,dir:String,actionBtn:Btn):void{
			_inf = new Inf(300,dir,actionBtn);
			//_view.addChild(_mask);
			_view.addChild(_inf);
			_inf.thumbNail = thumbNail;
			_inf.addTitle(title);
			_inf.addContent(content);
			_inf.open();
			_inf.x=xx//(Dimentions.WIDTH-popUp.width)/2
			_inf.y=yy//(Dimentions.HEIGHT-popUp.height)/3
			
			//_closeEvent = closeEvent;
		}
		
		public function openPop(title:String,content:String,xx:uint,yy:uint,thumbNail:String):void{
			_inf = new Inf(300,Inf.NO_ARROW,null);
			_view.addChild(_mask);
			_view.addChild(_inf);
			_inf.thumbNail = thumbNail;
			_inf.addTitle(title);
			_inf.addContent(content);
			_inf.open();
			_inf.x=xx//(Dimentions.WIDTH-popUp.width)/2
			_inf.y=yy//(Dimentions.HEIGHT-popUp.height)/3
			_inf.addNext();
			_inf.nextSignal.add(onNext);
		}
		
		private function onNext():void
		{
			_recordScreen.stateController.stateChanged.remove(onStatesChanged);
			_recordScreen.stateController.deActivate();
			goNext();
			_inf.nextSignal.remove(onNext);
			closePopUp();
			hideButtons();
			showPlayButton();
			if(_recordScreen){
				var thumbNail:String = _recordScreen.model.instrumentModel.thumbNail; 
				switch(thumbNail){
					case "drum.png":
						openInstruction(_texts.getTitleById("Ddrums"),_texts.getMsgById("Ddrums"),180,130,thumbNail,Inf.TOP_RIGHT,null);
						break;
					case "bass_flash.jpg":
						openInstruction(_texts.getTitleById("Bbass"),_texts.getMsgById("Bbass"),180,130,thumbNail,Inf.TOP_RIGHT,null);
						break;
				}
			}
		}
		
		override protected function goHome():void{
			super.goHome();
			closePopUp();
			FileProxy.resetTutorial();
			_mainThemeModel.screensModel.recordSession.deleteRecorded();
			_view.menu.navigator.visible = true;
			if(_recordScreen){
				_recordScreen.playButton.clicked.remove(onPlay);
			}
				//clear all data from levels
		}
		
		public function closePopUp():void{
			if(_inf&&_inf.parent){
				_view.removeChild(_inf as DisplayObject);
			}
			if(_mask&&_mask.parent){
				_view.removeChild(_mask as DisplayObject);
			}
		}
	}
}