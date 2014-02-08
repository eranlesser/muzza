package com.container.controller
{
	import com.constants.Dimentions;
	import com.constants.States;
	import com.container.Presenter;
	import com.inf.Inf;
	import com.model.FileProxy;
	import com.model.MainThemeModel;
	import com.screens.view.ListenScreen;
	import com.screens.view.RecordScreen;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class TutorialProgressControl extends ProgressControl
	{
		private var _inf:Inf;
		private var _mask:Sprite;
		private var _recordScreen:RecordScreen;
		public function TutorialProgressControl(view:Presenter,theme:MainThemeModel,themeName:String)
		{
			super(view,theme,themeName);
			_mask = new Sprite();
			_mask.graphics.beginFill(0xFFFFFF,0.3);
			_mask.graphics.drawRect(0,0,Dimentions.WIDTH,Dimentions.HEIGHT);
			_mask.graphics.endFill();
		}
		
		override public function start(mode:String):void{
			super.start(mode);
			openInstruction("Demo","Click here, this is what we are about to play together",85,500,"bottles.png",Inf.BTM_LEFT);
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
					openInstruction("Play","Click here, let's play some music with Mel",450,130,"bottles.png",Inf.TOP_LEFT);
				}
				showPlayButton();
			}
		}
		
		private function onDemoComplete():void{
			openInstruction("Close","Click to close",697,85,"bottles.png",Inf.TOP_RIGHT);
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
			openInstruction("Well Done","You are ready for the next level, click here",410,110,"bottles.png",Inf.TOP_LEFT);
			
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
							openPop("Great Job!","",(Dimentions.WIDTH-300)/2,230,thumbNail);
							break;
						case "drum.png":
							openPop("You Rock!","",(Dimentions.WIDTH-300)/2,230,thumbNail);
							break;
						case "bass_flash.jpg":
							openPop("Awesome!!","",(Dimentions.WIDTH-300)/2,230,thumbNail);
							break;
					}
				}
			}
			
		}
		
		private function onListenDone():void{
			
		}
		
		
		public function openInstruction(title:String,content:String,xx:uint,yy:uint,thumbNail:String,dir:String):void{
			_inf = new Inf(300,dir);
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
			_inf = new Inf(300,Inf.NO_ARROW);
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
						openInstruction("Dee Drums","Lets add some rhythm",180,130,thumbNail,Inf.TOP_RIGHT);
						break;
					case "bass_flash.jpg":
						openInstruction("The human Bass","Time for some heavy groove",180,130,thumbNail,Inf.TOP_RIGHT);
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