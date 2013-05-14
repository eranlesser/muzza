package com.container.controller {
	import com.constants.Session;
	import com.container.Presenter;
	import com.container.navigation.Navigator;
	//import com.freshplanet.nativeExtensions.Flurry;
	import com.inf.PopUpModel;
	import com.inf.PopUpsManager;
	import com.model.FileProxy;
	import com.screens.model.ScreensModel;
	import com.screens.view.ListenScreen;
	import com.screens.view.RecordScreen;
	
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
			if(_model.currentScreen is RecordScreen)
			var curScrTmbnail:String = (_model.currentScreen as RecordScreen).model.instrumentModel.thumbNail;
			if(true || _model.currentScreen is RecordScreen 
				&& ( (Session.instance.recordScreenGood((_model.currentScreen as RecordScreen).model) 
				&& (_model.getScreenIndex(scr)==_model.getScreenIndex(curScrTmbnail)+1) )//next on flow
				|| _model.getScreenIndex(scr)<_model.getScreenIndex(curScrTmbnail)) // or previous
				|| scr == "" // listen is next
				|| (_model.currentScreen is ListenScreen))  // from listen 
			{
			_model.currentScreen.stop();
			_view.removeScreens();
			_model.goTo(scr);
			_view.addScreen(_model.currentScreen as DisplayObject);
			_model.currentScreen.start();
			
			_navigator.state=_model.recordSession;
			//Flurry.getInstance().logEvent("go to "+scr);
			
			
			//if(_model.currentScreen is RecordScreen)
			//_model.currentScreen.isRecorded = _model.recordSession.isRecorded(_model.recordSession.currenScreenIndex);
			}
		}
		
		
		private function openDemo():void{
			if(_view.isDemoOpen){
				_view.closeDemo();
				//PopUpsManager.openPopUp(PopUpsManager.PRESS_RECORD);
				//Flurry.getInstance().logEvent("Close demo");
			}else{
				_view.openDemo(_model.demoScreen);
				PopUpsManager.closePopUp(true);
				Session.instance.demoClicked=true;
				//Flurry.getInstance().logEvent("Open demo");
			}
		}
		
		
		private function goHome():void{
			_model.currentScreen.stop();
			goHomeSignal.dispatch();
			_model.reset();
			PopUpsManager.closePopUp(true);
			//Flurry.getInstance().logEvent("go home");
		}
		
		
		
	
		
		
	}
}