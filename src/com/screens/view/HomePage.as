package com.screens.view
{
	import com.constants.Dimentions;
	import com.model.rawData.Data;
	import com.screens.view.components.homePage.SongsMenu;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;

	public class HomePage extends AbstractScreen
	{
		private var _songMenu:	SongsMenu;
		public var tutorialRequest:Signal=new Signal();
		public function HomePage(){
			init();
		}
		
		private function init():void{
			
			_songMenu=new SongsMenu();
			_songMenu.data=XML(Data.xml.lessons);
			addChild(_songMenu);
			addChild(AssetsManager.getAssetByName("WAGON_TRAIN.png"));
			//_songMenu.y=200;
			//_songMenu.x=320;
		}
		
		
		
		public function get songMenu():SongsMenu{
			return _songMenu;
		}
		
		
	}
}