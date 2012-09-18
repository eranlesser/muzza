package com.container
{
	import com.constants.Dimentions;
	import com.messages.LoadingMessage;
	import com.messages.MessageControl;
	import com.screens.view.HomePage;
	import com.screens.view.IScreen;
	import com.screens.view.RecordScreen;
	import com.screens.view.components.homePage.SongsMenu;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class Presenter extends Sprite
	{
		private var _screensLayer:		Sprite;
		private var _guiLayer:			Sprite;
		private var _messageLayer:		Sprite;
		private var _messages:			MessageControl;
		private var _startScreen:		HomePage;
		private var _toolBar:			BottomToolBar;
		public var tutorialRequest:Signal=new Signal();
		
		public function Presenter(){
			init();
		}
		
		private function init():void{
			_screensLayer = new Sprite();
			addChild(_screensLayer);
			_guiLayer = new Sprite();
			_toolBar = new BottomToolBar();
			addChild(_toolBar);
			_toolBar.y=Dimentions.HEIGHT-_toolBar.height-10;
			addChild(_guiLayer);
			_messageLayer = new Sprite();
			addChild(_messageLayer);
			_messages = new MessageControl(_messageLayer);
		}
		
		public function addStartScreen():void{
			_startScreen = new HomePage();
			_startScreen.tutorialRequest.add(onTutorialRequest);
			//_startScreen.parseXML(startScreenData);
			//_startScreen.songMenu.songSelected.add(onLessonSelected);
			//_startScreen.loaderRequest.add(addLoader);
			//_startScreen.infoSelected.add(onInfoSelected);
			addScreen(_startScreen);
		}
		
		public function get songMenu():SongsMenu{
			return _startScreen.songMenu;
		}
		
		private function onTutorialRequest():void{
			tutorialRequest.dispatch("tutorial");
		}
		
		
		public function restart(protector:ThemesController):void{
			addScreen(_startScreen);
			_startScreen.start();
		}
		
		public function removeStartScreen():void{
			_startScreen.stop();
			removeScreen(_startScreen);
			try{
			_messages.close();
			}catch(e:Error){}
		}
		
		public function start(protector:ThemesController):void{
			_startScreen.start();
		}
		
		public function addScreen(screen:DisplayObject):void{
			_screensLayer.addChild(screen);
			_toolBar.visible = !(screen is HomePage);
			if(_screensLayer.numChildren>1){
				throw new Error("too many scrreennss",this);
			}
		}
		
		public function removeScreen(screen:DisplayObject):void{
			if(screen is RecordScreen)
			trace(RecordScreen(screen).model.instrumentModel.thumbNail)
			_screensLayer.removeChild(screen);
		}
		
		public function get menu():BottomToolBar{
			return _toolBar;
		}
		
		private function addLoader():void{
			_messages.popUp(new LoadingMessage());	
		}
		
		private function removeLoader():void{
			_messages.close();
		}
		
		public function clearScreens():void{
			IScreen(_screensLayer.removeChildAt(0)).stop();
		}
		
	}
}