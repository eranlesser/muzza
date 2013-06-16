package com.container.controller {
	import com.constants.Session;
	import com.container.Presenter;
	import com.container.navigation.Navigator;
	import com.screens.model.ScreensModel;
	import com.sticksports.nativeExtensions.flurry.Flurry;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;


	public class ProgressControl{
		
		private var _view:			Presenter;
		private var _navigator:		Navigator;
		private var _model:			ScreensModel;
		private var _themeName:		String;
		private var _frameRate:		uint;
		public var goHomeSignal:	Signal;
		private var _demoShown:Boolean=false;
		public function ProgressControl(view:Presenter,model:ScreensModel,themeName:String,frameRate:uint){
			_view = view;
			_model = model;
			_themeName = themeName;
			_frameRate=frameRate;
			_view.menu.goHome.add(goHome);
			goHomeSignal = new Signal();
			
		}
		public function start(mode:String):void{
			_model.playMode=mode;
			_view.addScreen(_model.currentScreen as DisplayObject);
			
			_model.currentScreen.start();
			initNavigator();
			if(!_demoShown){
				_view.mouseEnabled=false;
				_view.mouseChildren=false;
				_demoShown=true;
				var tmr:Timer = new Timer(100,1);
				tmr.addEventListener(TimerEvent.TIMER_COMPLETE, function onTimer(e:Event):void{
					tmr.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
					_view.openDemo(_model.demoScreen,true);
					_view.closeDemo(true);
					_view.mouseEnabled=true;
					_view.mouseChildren=true;
					
				});
				tmr.start();
			}
		}
		
		public function reset():void{
			_model.reset();
			_view.goto.remove(goTo);
			_view.menu.openDemo.remove(openDemo);
		}
		
		public function get frameRate():uint{
			return _frameRate;
		}
		
		private function initNavigator():void{
			_navigator=_view.menu.navigator;
			_view.goto.add(goTo);
			_view.menu.openDemo.add(openDemo);
			_navigator.state=_model.recordSession;
			//_model.currentScreen.isRecorded = _model.recordSession.isRecorded(_model.recordSession.currenScreenIndex);
		}
		
		public function get theme():String{
			return _themeName;
		}
		
		private function goTo(scr:String):void{
			_view.removeScreens();
			_model.goTo(scr);
			_view.addScreen(_model.currentScreen as DisplayObject);
			_model.currentScreen.start();
			_navigator.state=_model.recordSession;
		}
		
		
		private function openDemo():void{
			if(_view.isDemoOpen){
				_view.closeDemo();
				_model.currentScreen.start();
				//PopUpsManager.openPopUp(PopUpsManager.PRESS_RECORD);
				Flurry.logEvent("Close demo");
			}else{
				_model.currentScreen.stop();
				_view.openDemo(_model.demoScreen);
				Flurry.logEvent("Open demo");
			}
		}
		
		
		private function goHome():void{
			_model.currentScreen.stop();
			goHomeSignal.dispatch();
			_model.reset();
			Flurry.logEvent("go home");
		}
		
		
		
	
		
		
	}
}