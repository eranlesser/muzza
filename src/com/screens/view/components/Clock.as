package com.screens.view.components
{
	import com.constants.Rhythms;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.view.tools.AssetsManager;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	import org.osflash.signals.natives.NativeSignal;
	
	public class Clock extends Sprite{
		
		private var _timeModel:ITimeModel;
		private var _smallTicker:Sprite;
		private var _bigTicker:Sprite;
		private var _soundButton:DisplayObject;
		private var _muteButton:DisplayObject;
		private var _preTickSound:Sound;
		private var _tickSound:Sound;
		private var _innerCount:uint = 0;
		
		private static var _instance:Clock;
		private static var allowInstantiation:Boolean=true;
		
		public function Clock(){
			_timeModel = Metronome.getTimeModel();
			init();
			if (!allowInstantiation) {
				throw new Error("Error: Instantiation failed: Use SingletonDemo.getInstance() instead of new.");
			}
		}
		
		public static function get instance():Clock{
			if(allowInstantiation){
				_instance = new Clock();
				allowInstantiation = false;
			}
			return _instance;
		}
		
		
		
		public function stop():void{
			_timeModel.tickSignal.remove(onTick);
//			_timeModel.cycleSignal.remove(rotateCycle);
		}
		
		public function reset():void{
			_innerCount = 0;
			_bigTicker.rotation = 360;
			_smallTicker.rotation = 360;
		}
		
		public function play():void{
			_timeModel.tickSignal.add(onTick);
//			_timeModel.cycleSignal.add(rotateCycle);
			_bigTicker.rotation = 360/(128/_timeModel.currentTick/2);
			_smallTicker.rotation = _bigTicker.rotation;
		}
		
		
		private function init():void{
			addChild(AssetsManager.getAssetByName("clock.png"));
			_smallTicker = new Sprite();
			var smallTickAsset:Bitmap = AssetsManager.getBitmap("mahog_small.png",true);
			smallTickAsset.smoothing = true;
			_smallTicker.addChild(smallTickAsset);
			smallTickAsset.x=-50;
			smallTickAsset.y=-50
			
			_bigTicker = new Sprite();
			var bigTickAsset:Bitmap = AssetsManager.getBitmap("mahog_big.png",true);
			bigTickAsset.smoothing = true;
			_bigTicker.addChild(bigTickAsset);
			bigTickAsset.x=-50;
			bigTickAsset.y=-50
			//_bigTicker.transform.matrix = new Matrix(1,0,0,1,_bigTicker.width/2,_bigTicker.height/2);
			
			
			addChild(_bigTicker);
			addChild(_smallTicker);
			addChild(AssetsManager.getBitmap("clock_highLight.png",true));
			_bigTicker.x=49;
			_bigTicker.y=46;
			_smallTicker.x=49;
			_smallTicker.y=46;
			_soundButton = AssetsManager.getBitmap("SOUND_ON.png",true);
			_muteButton = AssetsManager.getBitmap("SOUND_OFF.png",true);
			//addChild(_soundButton)
			//addChild(_muteButton)
			_soundButton.x=-29;
			_soundButton.y=26;
			_muteButton.x=-29;
			_muteButton.y=26;
			
			var onClickSignal:NativeSignal = new NativeSignal(this,MouseEvent.CLICK);
			//onClickSignal.add(onClick);
			
			_preTickSound = new Sound(new URLRequest("../../../../assets/sounds/theme/tick.mp3"));
			_tickSound = new Sound(new URLRequest("../../../../assets/sounds/theme/preTick.mp3"));
			//toggleSoundState("on")
			
		}
		
		private function onClick(e:MouseEvent):void{
			toggleSoundState("");
		}
		
		public function toggleSoundState(state:String):void{
			switch(state){
				case "": // toggle
					if(_soundButton.visible){
						toggleSoundState("off");
					}else{
						toggleSoundState("on");
					}
					break;
				case "on":
					_soundButton.visible = true;
					_muteButton.visible = false;
					break;
				case "off":
					_soundButton.visible = false;
					_muteButton.visible = true;
					break;
			}
		}
		
		
		
		private function onTick():void{
			_bigTicker.rotation = 360/(128/_timeModel.currentTick)/2;
			_smallTicker.rotation = (360/(128/_timeModel.currentTick)/2)/8
			//trace(_smallTicker.rotation,_bigTicker.rotation)
			_innerCount++;
			if(_innerCount==16){
				_innerCount=0;
				if(_soundButton.visible){
					var channel:SoundChannel = _preTickSound.play();
					if(channel){
						var sndTansform:SoundTransform = channel.soundTransform;
						sndTansform.volume = 0.2;
						channel.soundTransform = sndTansform;
					}else{
						trace("no channel available!! (clock)")
					}
				}
			}
		}
		
		
	}
}