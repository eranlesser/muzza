package com.container
{
	import com.constants.Dimentions;
	import com.screens.view.DemoScreen;
	import com.screens.view.HomePage;
	import com.screens.view.IScreen;
	import com.screens.view.ListenScreen;
	import com.screens.view.RecordScreen;
	import com.screens.view.components.homePage.SongsMenu;
	
	import flash.display.DisplayObject;
	import flash.display.Screen;
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class Presenter extends Sprite
	{
		private var _screensLayer:		Sprite;
		private var _guiLayer:			Sprite;
		private var _messageLayer:		Sprite;
		private var _startScreen:		HomePage;
		private var _toolBar:			BottomToolBar;
		public var goto:Signal=new Signal();
		
		public function Presenter(){
			init();
		}
		
		private function init():void{
			_screensLayer = new Sprite();
			addChild(_screensLayer);
			_guiLayer = new Sprite();
			_toolBar = new BottomToolBar();
			addChild(_toolBar);
			_toolBar.y=Dimentions.HEIGHT-_toolBar.height;
			_toolBar.navigator.goto.add(goToRequest);
			addChild(_guiLayer);
			_messageLayer = new Sprite();
			addChild(_messageLayer);
		}
		
		private function goToRequest(scr:String):void{
			goto.dispatch(scr);
		}
		
		public function addStartScreen():void{
			_startScreen = new HomePage();
			addScreen(_startScreen);
		}
		
		public function get songMenu():SongsMenu{
			return _startScreen.songMenu;
		}
		
		public function restart(protector:ThemesController):void{
			addScreen(_startScreen);
			_startScreen.start();
		}
		
		public function removeStartScreen():void{
			_startScreen.stop();
			removeScreens();
		}
		
		public function start(protector:ThemesController):void{
			_startScreen.start();
		}
		
		public function addScreen(screen:DisplayObject):void{
			_screensLayer.addChild(screen);
			_toolBar.visible = (screen is RecordScreen);
			if(screen is ListenScreen){
				(screen as ListenScreen).goto.add(goToRequest);
			}
			if(_screensLayer.numChildren>1){
				throw new Error("too many scrreennss",this);
			}
		}
		
		public function removeScreens():void{
			if(_toolBar.demoButton.state=="pressed"){
				closeDemo();
			}
			for(var i:uint=_screensLayer.numChildren;i>0;i--){
				var scr:IScreen = _screensLayer.getChildAt(0) as IScreen;
				scr.stop();
				_screensLayer.removeChildAt(0);
				if(scr is ListenScreen){
					(scr as ListenScreen).goto.remove(goToRequest);
				}
			}
			
		}
		
		public function openDemo(demoScreen:DemoScreen,silentMode:Boolean=false):void{
			_screensLayer.addChild(demoScreen);
			demoScreen.start();
			if(!silentMode){
			_toolBar.demoButton.state="pressed";
			demoScreen.close.add(closeDemo);
			}
		}
		
		public function closeDemo(silentMode:Boolean=false):void{
			var demoScreen:DemoScreen = _screensLayer.getChildAt(1) as DemoScreen;
			demoScreen.stop();
			_screensLayer.removeChild(demoScreen);
			if(!silentMode){
				_toolBar.demoButton.state="idle";
				(_screensLayer.getChildAt(0) as IScreen).start();
			}
		}
		
		public function get isDemoOpen():Boolean{
			return _screensLayer.numChildren==2;
		}
		
		public function get menu():BottomToolBar{
			return _toolBar;
		}
		
		
		
		
		
	}
}