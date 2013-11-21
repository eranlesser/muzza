package com.container.controller {
	import com.container.Presenter;
	import com.container.navigation.Navigator;
	import com.metronom.Metronome;
	import com.model.MainThemeModel;
	import com.screens.model.ScreensModel;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;


	public class ProgressControl{
		
		private var _view:			Presenter;
		private var _navigator:		Navigator;
		private var _themeName:		String;
		private var _frameRate:		uint;
		private var _mainThemeModel:MainThemeModel;
		public var goHomeSignal:	Signal;
		private var _demoShown:Boolean=false;
		public function ProgressControl(view:Presenter,theme:MainThemeModel,themeName:String){
			_view = view;
			_mainThemeModel = theme;
			_themeName = themeName;
			_frameRate=theme.rhythm;
			_view.menu.goHome.add(goHome);
			_view.goHome.add(goHome);
			goHomeSignal = new Signal();
			
		}
		public function start(mode:String):void{
			_mainThemeModel.reset();
			_mainThemeModel.screensModel.playMode=mode;
			_view.addScreen(_mainThemeModel.screensModel.currentScreen as DisplayObject);
			
			_mainThemeModel.screensModel.currentScreen.start();
			initNavigator();
			if(!_demoShown){//performance
				_view.mouseEnabled=false;
				_view.mouseChildren=false;
				_demoShown=true;
				var tmr:Timer = new Timer(100,1);
				tmr.addEventListener(TimerEvent.TIMER_COMPLETE, function onTimer(e:Event):void{
					tmr.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
					openDemo(true);
					closeDemo(true);
					_view.mouseEnabled=true;
					_view.mouseChildren=true;
				});
				tmr.start();
			}
		}
		
		public function reset():void{
			_mainThemeModel.screensModel.reset();
			_view.goto.remove(goTo);
			_view.goNext.remove(goNext);
			_view.menu.openDemo.remove(toggleDemo);
		}
		
		public function get frameRate():uint{
			return _frameRate;
		}
		
		private function initNavigator():void{
			_navigator=_view.menu.navigator;
			_view.goto.add(goTo);
			_view.goNext.add(goNext);
			_view.menu.openDemo.add(toggleDemo);
			_navigator.state=_mainThemeModel.screensModel.recordSession;
			//_model.currentScreen.isRecorded = _model.recordSession.isRecorded(_model.recordSession.currenScreenIndex);
		}
		
		public function get theme():String{
			return _themeName;
		}
		
		private function goTo(scr:String):void{
			closeDemo();
			_view.removeScreens();
			_mainThemeModel.screensModel.goTo(scr);
			_view.addScreen(_mainThemeModel.screensModel.currentScreen as DisplayObject);
			_mainThemeModel.screensModel.currentScreen.start();
			_navigator.state=_mainThemeModel.screensModel.recordSession;
		}
		
		private function goNext():void{
			closeDemo();
			_view.removeScreens();
			_mainThemeModel.screensModel.goNext();
			_view.addScreen(_mainThemeModel.screensModel.currentScreen as DisplayObject);
			_mainThemeModel.screensModel.currentScreen.start();
			_navigator.state=_mainThemeModel.screensModel.recordSession;
		}
		private var _demoOpen:Boolean=false;
		private function toggleDemo():void{
			if(_demoOpen){
				closeDemo();
				//_mainThemeModel.screensModel.currentScreen.start();
				//PopUpsManager.openPopUp(PopUpsManager.PRESS_RECORD);
				//Flurry.logEvent("Close demo");
			}else{
				openDemo();
			}
		}
		
		private function openDemo(silentMode:Boolean=false):void{
			_demoOpen = true;
			_mainThemeModel.screensModel.currentScreen.stop();
			_view.screensLayer.addChild(_mainThemeModel.screensModel.demoScreen);
			_mainThemeModel.screensModel.demoScreen.start();
			if(!silentMode){
				_view.menu.demoButton.state="pressed";
				_mainThemeModel.screensModel.demoScreen.close.add(toggleDemo);
			}
		}
		
		private function closeDemo(silentMode:Boolean=false):void{
			if(!_demoOpen){
				return // called from removescreens
			}
			
			_demoOpen=false;
			_mainThemeModel.screensModel.demoScreen.stop();
			_view.screensLayer.removeChild(_mainThemeModel.screensModel.demoScreen);
			Metronome.getTimeControll().stop();
			if(!silentMode){
				_view.menu.demoButton.state="idle";
				_mainThemeModel.screensModel.demoScreen.close.remove(toggleDemo);
			}
			_mainThemeModel.screensModel.currentScreen.start();
		}
		
		
		private function goHome():void{
			_mainThemeModel.screensModel.currentScreen.stop();
			goHomeSignal.dispatch();
			_mainThemeModel.screensModel.reset();
		//	Flurry.logEvent("go home");
		}
		
	}
}