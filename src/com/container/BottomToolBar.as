package com.container
{
	import com.constants.Dimentions;
	import com.container.navigation.Navigator;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class BottomToolBar extends Sprite{
		
		private var _homeButton:Btn;
		private var _demoButton:Btn;
		private var _navigator:Navigator;
		public var goHome:Signal = new Signal();
		public var openDemo:Signal = new Signal();
		
		
		public function BottomToolBar(){
			init();
		}
		
		private function init():void{
			addChild(AssetsManager.getAssetByName("BOTTOM_TOOLBAR.png"));
			_navigator = addChild(new Navigator()) as Navigator;
			_navigator.x = Dimentions.WIDTH-10-_navigator.width;
			_navigator.y=7;
			_homeButton = new Btn("HOME_IDLE.png","HOME_PRESSED.png");
			addChild(_homeButton);
			_homeButton.x=10;
			_homeButton.y=7;
			_homeButton.clicked.add(onHome);
			_demoButton = new Btn("DEMO_IDLE.png","DEMO_PRESSED.png");
			addChild(_demoButton);
			_demoButton.x=_homeButton.x+_homeButton.width;
			_demoButton.y=7;
			_demoButton.clicked.add(onDemo);
		}
		
		private function onHome(btn:String):void{
			goHome.dispatch();
		}
		
		private function onDemo(btn:String):void{
			openDemo.dispatch();
		}
		
		public function get navigator():Navigator{
			return _navigator;
		}
		
	}
}