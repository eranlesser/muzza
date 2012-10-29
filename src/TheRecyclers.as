package {
	import com.container.PreLoader;
	import com.container.Presenter;
	import com.container.ThemesController;
	import com.freshplanet.nativeExtensions.Flurry;
	import com.model.FileProxy;
	import com.view.tools.AssetsManager;
	
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.*;
	import flash.events.StageOrientationEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	public class TheRecyclers extends Sprite
	{
		private var _presenter:			Presenter;
		private var _themesController:	ThemesController;
		private var _preLoader:PreLoader;

		public function TheRecyclers()
		{
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.displayState = StageDisplayState.FULL_SCREEN;
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
			start();
			FileProxy.reset(this)
		}
		
		private function start():void{
			var assetsManage:AssetsManager = new AssetsManager();
			assetsManage.complete.addOnce(preLoad);
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			stage.addEventListener(StageOrientationEvent.ORIENTATION_CHANGING, orientationChange);
			
			Flurry.getInstance().setIOSAPIKey("8R342X54FKMXSYP793P9");
			Flurry.getInstance().startSession();
			Flurry.getInstance().setUserId("");//eran
			
		}
		
		private function orientationChange(e:StageOrientationEvent):void{
			//onOrientationChanged(e.afterOrientation);
			if (e.afterOrientation != StageOrientation.ROTATED_LEFT && e.afterOrientation != StageOrientation.ROTATED_RIGHT)
			{
				e.preventDefault();
			}
		}
		
		
		private function preLoad():void{
			_preLoader = new PreLoader();
			addChild(_preLoader);
			_preLoader.loaded.add(onLoaded);
			//onLoaded();
			//var stats:Stats = new Stats();
			//addChild(stats);
			//stats.x=60;
			//NativeApplication.nativeApplication.addEventListener(Event.EXITING,onExit);
		}
		
		private function onLoaded():void{
			removeChild(_preLoader);
			_presenter = new Presenter();
			addChild(_presenter);
			_themesController = new ThemesController(_presenter);
		}
		/*
		private function resetData():void{
			FileProxy.reset(this);
			_themesController.resetData()
		}
		*/
		
	}
}