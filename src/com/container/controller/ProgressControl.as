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
			_view.menu.mode=mode;
			addScreen(_model.currentScreen as DisplayObject);
			_model.currentScreen.start();
			initNavigator();
			_navigator.backEnebled =false;
		}
		
		public function reset():void{
			_navigator.nextEnabled=true;
			_model.reset();
			_navigator.nextSignal.remove(progress);
			_navigator.prevSignal.remove(rewind);
			_view.menu.recordScreenMenu.speedControl.reset();
		}
		
		public function get frameRate():uint{
			return _frameRate;
		}
		
		private function initNavigator():void{
			//_navigator = _view.addNavigation();
			_navigator=_view.menu.navigator;
			_navigator.nextSignal.add(progress);
			_navigator.prevSignal.add(rewind);
		}
//		private function resetNavigator():void{
//			_navigator.nextSignal.remove(progress);
//			_navigator.prevSignal.remove(rewind);
//			_navigator.backEnebled = false;
//			_navigator.nextEnabled = true;
//		}
		
		public function get theme():String{
			return _themeName;
		}
		
		private function progress():void{
			_model.currentScreen.stop();
			removeScreen(_model.currentScreen as DisplayObject);
			_model.progress();
			addScreen(_model.currentScreen as DisplayObject);
			_model.currentScreen.start();
			_navigator.nextEnabled = _model.showNextButton;
			_navigator.backEnebled = _model.showBackButton;
			if(!_model.showNextButton){
				_view.menu.mode="play";
			}else{
				_view.menu.mode="record";
			}
			
		}
		
		private function rewind():void{
			_model.currentScreen.stop();
			removeScreen(_model.currentScreen as DisplayObject);
			_model.rewind();
			addScreen(_model.currentScreen as DisplayObject);
			_model.currentScreen.start();
			_navigator.nextEnabled = _model.showNextButton;
			_navigator.backEnebled = _model.showBackButton;
			if(!_model.showNextButton){
				_view.menu.mode="play";
			}else{
				_view.menu.mode="record";
			}
		}
		
		private function goHome():void{
			_model.currentScreen.stop();
			goHomeSignal.dispatch();
			_model.reset();
		}
		
		private function addScreen(screen:DisplayObject):void{
			_view.addScreen(screen);
		}
		
		private function removeScreen(screen:DisplayObject):void{
			_view.removeScreen(screen);
		}
		
		private function onScreenComplete():void{
			progress();
		}
	}
}