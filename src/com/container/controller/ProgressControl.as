package com.container.controller {
	import com.container.Presenter;
	import com.container.navigation.Navigator;
	import com.screens.model.ScreensModel;
	
	import flash.display.DisplayObject;
	
	import org.osflash.signals.Signal;


	public class ProgressControl{
		
		private var _view:			Presenter;
		private var _navigator:		Navigator;
		private var _model:			ScreensModel;
		private var _themeName:		String;
		private var _frameRate:uint;
		public var goHomeSignal:	Signal;
		
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
		}
		
		public function reset():void{
			_model.reset();
			_navigator.goto.remove(goTo);
			//_navigator.nextSignal.remove(progress);
			//_navigator.prevSignal.remove(rewind);
			//_view.menu.recordScreenMenu.speedControl.reset();
		}
		
		public function get frameRate():uint{
			return _frameRate;
		}
		
		private function initNavigator():void{
			//_navigator = _view.addNavigation();
			_navigator=_view.menu.navigator;
			_navigator.goto.add(goTo);
			_navigator.state=_model.recordSession;
			//_navigator.nextSignal.add(progress);
			//_navigator.prevSignal.add(rewind);
		}
		
		public function get theme():String{
			return _themeName;
		}
		
		private function goTo(scr:String):void{
			_model.currentScreen.stop();
			_view.removeScreen(_model.currentScreen as DisplayObject);
			_model.goTo(scr);
			_view.addScreen(_model.currentScreen as DisplayObject);
			_model.currentScreen.start();
			_navigator.state=_model.recordSession;
		}
		
		
		
		private function goHome():void{
			_model.currentScreen.stop();
			goHomeSignal.dispatch();
			_model.reset();
		}
		
		
		
	
		
		
	}
}