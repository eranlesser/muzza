package editor
{
	import com.container.PreLoader;
	import com.container.Presenter;
	import com.container.ThemesController;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.view.tools.AssetsManager;
	
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageOrientation;
	import flash.display.StageScaleMode;
	import flash.events.StageOrientationEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	public class Editor extends Sprite
	{
		private var _recordScreens:Vector.<Recorder>;
		private var _instrumentsModel:ThemeInstrumentsModel;
		
		
		public function Editor()
		{
				// support autoOrients
				stage.align = StageAlign.TOP_LEFT;
				stage.scaleMode = StageScaleMode.NO_SCALE;
				NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
				start();
				
			}
			
			private function start():void{
				var assetsManage:AssetsManager = new AssetsManager();
				assetsManage.complete.addOnce(init);
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				stage.addEventListener(StageOrientationEvent.ORIENTATION_CHANGING, orientationChange);
			}
			
			private function orientationChange(e:StageOrientationEvent):void{
				//onOrientationChanged(e.afterOrientation);
				if (e.afterOrientation != StageOrientation.ROTATED_LEFT && e.afterOrientation != StageOrientation.ROTATED_RIGHT)
				{
					e.preventDefault();
				}
			}
			
			private function init():void{
				
			}
			
			
		}
	}