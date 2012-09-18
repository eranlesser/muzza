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
		
		
		public function BottomToolBar(){
			init();
		}
		
		private function init():void{
			addChild(AssetsManager.getAssetByName("BOTTOM_TOOLBAR.png"));
			_navigator = addChild(new Navigator()) as Navigator;
			_navigator.x = Dimentions.WIDTH-10-_navigator.width;
			//_navigator.y=10;
			_homeButton = new Btn("HOME_IDLE.png","HOME_PRESSED.png");
			addChild(_homeButton);
			_homeButton.x=10;
			_homeButton.clicked.add(onHome);
		}
		
		private function onHome(btn:String):void{
			goHome.dispatch();
		}
		
		public function get navigator():Navigator{
			return _navigator;
		}
		
	}
}