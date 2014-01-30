package com.container.controller
{
	import com.container.Presenter;
	import com.inf.Inf;
	import com.inf.TutorialManager;
	import com.model.MainThemeModel;
	import com.screens.view.RecordScreen;
	
	import flash.display.DisplayObject;

	public class TutorialProgressControl extends ProgressControl
	{
		private var _inf:Inf;
		private var _recordScreen:RecordScreen;
		public function TutorialProgressControl(view:Presenter,theme:MainThemeModel,themeName:String)
		{
			super(view,theme,themeName);
		}
		
		override public function start(mode:String):void{
			super.start(mode);
			openInstruction("Demo","Click here, this is what we are about to play together",85,500,"bottles.png",Inf.BTM_LEFT);
			_recordScreen = (_mainThemeModel.screensModel.currentScreen as RecordScreen);
			_recordScreen.playButton.visible = false;
			_recordScreen.playGlow.visible = false;
			_recordScreen.recorder.visible = false;
			_view.menu.navigator.visible = false;
			
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
			}
		}
		
		private function onDemoComplete():void{
			openInstruction("Close","Click to close",697,85,"bottles.png",Inf.TOP_RIGHT);
		}
		
		override protected function gotoScreen(scr:String):void{
			super.gotoScreen(scr);
			_recordScreen = (_mainThemeModel.screensModel.currentScreen as RecordScreen);
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
			//_view.addChild(_mask);
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
			// TODO Auto Generated method stub
			_inf.nextSignal.remove(onNext);
		}
		
		public function closePopUp():void{
			//_view.removeChild(_mask);
			if(_inf&&_inf.parent){
				_view.removeChild(_inf as DisplayObject);
			}
		}
	}
}