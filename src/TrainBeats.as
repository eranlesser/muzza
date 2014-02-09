package {
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.container.PreLoader;
	import com.container.Presenter;
	import com.container.ThemesController;
	import com.model.FileProxy;
	import com.sticksports.nativeExtensions.flurry.Flurry;
	import com.utils.errorHandlers.GlobalExceptionHandler;
	
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageOrientation;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.StageOrientationEvent;
	import flash.media.AudioPlaybackMode;
	import flash.media.SoundMixer;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	public class TrainBeats extends Sprite
	{
		private var _presenter:			Presenter;
		private var _themesController:	ThemesController;
		private var _preLoader:PreLoader;

		public function TrainBeats()
		{
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
			SoundMixer.audioPlaybackMode  =  AudioPlaybackMode.AMBIENT;
			stage.quality = StageQuality.LOW;
			
			start();
			FileProxy.reset(this)
			setDisplaySize();
			new GlobalExceptionHandler(loaderInfo);
			Flurry.startSession("NZ33R7N9728H7CD2T9WB");
		}
		
		
		private function setDisplaySize():void{
			var ratioX:Number = Math.max(stage.fullScreenWidth,stage.fullScreenHeight) / Dimentions.WIDTH;
			var ratioY:Number = Math.min(stage.fullScreenWidth,stage.fullScreenHeight) / Dimentions.HEIGHT;
			this.scaleX=ratioX;
			this.scaleY=ratioY;
			if(stage.fullScreenWidth==1024 || stage.fullScreenWidth==2048){
				Session.DeviceId=2;
			}else{
				Session.DeviceId=1;
			}
		}
		
		private function start():void{
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			stage.addEventListener(StageOrientationEvent.ORIENTATION_CHANGING, orientationChange);
			preLoad();
//			Flurry.getInstance().setIOSAPIKey("8R342X54FKMXSYP793P9");
//			Flurry.getInstance().startSession();
//			Flurry.getInstance().setUserId("");//eran
			
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
			setDisplaySize();
		}
		/*
		private function resetData():void{
			FileProxy.reset(this);
			_themesController.resetData()
		}
		*/
		
	}
}