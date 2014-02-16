package com.container.controller {
	import com.constants.Session;
	import com.container.Presenter;
	import com.container.navigation.Navigator;
	import com.metronom.Metronome;
	import com.model.MainThemeModel;
	import com.utils.Monotorizer;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;


	public class ProgressControl{
		
		protected var _view:			Presenter;
		private var _navigator:		Navigator;
		private var _themeName:		String;
		private var _frameRate:		uint;
		protected var _mainThemeModel:MainThemeModel;
		public var goHomeSignal:	Signal;
		private var _demoShown:Boolean=false;
		public function ProgressControl(view:Presenter,theme:MainThemeModel,themeName:String){
			_view = view;
			_mainThemeModel = theme;
			_themeName = themeName;
			_frameRate=theme.rhythm;
			goHomeSignal = new Signal();
			
		}
		public function start(mode:String):void{
			_mainThemeModel.reset();
			_mainThemeModel.screensModel.playMode=mode;
			_view.addScreen(_mainThemeModel.screensModel.currentScreen as DisplayObject);
			
			_view.menu.goHome.add(goHome);
			_view.goHome.add(goHome);
			
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
		
		private function reset():void{
			_mainThemeModel.screensModel.reset();
			_mainThemeModel.screensModel.currentScreen.stop();
			_view.menu.goHome.remove(goHome);
			_view.goHome.remove(goHome);
			_view.gotoScreen.remove(gotoScreen);
			_view.goNext.remove(goNext);
			_view.menu.openDemo.remove(toggleDemo);
			_view.menu.demoButton.state="idle";
			_demoOpen=false;
		}
		
		public function get frameRate():uint{
			return _frameRate;
		}
		
		private function initNavigator():void{
			_navigator=_view.menu.navigator;
			_view.gotoScreen.add(gotoScreen);
			_view.goNext.add(goNext);
			_view.menu.openDemo.add(toggleDemo);
			_navigator.state=_mainThemeModel.screensModel.recordSession;
			//_model.currentScreen.isRecorded = _model.recordSession.isRecorded(_model.recordSession.currenScreenIndex);
		}
		
		public function get theme():String{
			return _themeName;
		}
		
		protected function gotoScreen(scr:String):void{
			closeDemo();
			_view.removeScreens();
			scr == "next" ? _mainThemeModel.screensModel.goNext() : _mainThemeModel.screensModel.gotoScreen(scr) ; 
			_view.addScreen(_mainThemeModel.screensModel.currentScreen as DisplayObject);
			_mainThemeModel.screensModel.currentScreen.start();
			_navigator.state=_mainThemeModel.screensModel.recordSession;
		}
		
		protected function goNext():void{
			gotoScreen("next");
		}
		private var _demoOpen:Boolean=false;
		private function toggleDemo():void{
			if(_demoOpen){
				closeDemo();
			}else{
				openDemo();
			}
		}
		
		protected function openDemo(silentMode:Boolean=false):void{
			_demoOpen = true;
			_mainThemeModel.screensModel.currentScreen.stop();
			_view.screensLayer.addChild(_mainThemeModel.screensModel.demoScreen);
			_mainThemeModel.screensModel.demoScreen.start();
			if(!silentMode){
				_view.menu.demoButton.state="pressed";
				_mainThemeModel.screensModel.demoScreen.close.add(toggleDemo);
			}
			Monotorizer.logEvent("demo",Session.SONG_NAME);
		}
		
		protected function closeDemo(silentMode:Boolean=false):void{
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
		
		
		protected function goHome():void{
			reset();
			goHomeSignal.dispatch();
		}
		
	}
}