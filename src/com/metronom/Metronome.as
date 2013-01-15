package com.metronom
{
	import com.constants.Rhythms;
	import com.gskinner.motion.GTween;
	import com.screens.view.IScreen;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Metronome is a singelton class that handles the bit rate of the application
	 * it can be used via 3 inerfaces
	 * ITimeModel - has only viewing pemissions, can be used from any component in the application.
	 * ITimeController - has start/stop/reset permissions, only screens can access it. 
	 * IDelaySetter - has bitrate conteoll (change rhythm of application), can only be accessed via main class (TheRecyclers)
	 * @author eranlesser
	 * 
	 */	

	public class Metronome implements ITimeModel, ITimeControll{
		
		private var _tickSignal:			Signal;
		private var _tickValue:				uint = 0;
		private var _beginAtFrame:			uint = 0;
		private var _isPlaying:				Boolean = false;
		private var _playActivated:			Boolean = false;
		private var _stopPosition:			uint = 0;
		private var _gtween:				GTween;
		private var _soundTick:				Signal = new Signal();
		private var _metronomeSignal:		Signal=new Signal();
		 
		public function Metronome(){
			_tickSignal = new Signal();
			
			if (!allowInstantiation) {
				throw new Error("Error: Instantiation failed: Use SingletonDemo.getInstance() instead of new.");
			}
		}
//______________________________________________________________________________________
//_____________________________________________________SINGELTON STUFF
		
		private static var instance:Metronome;
		private static var allowInstantiation:Boolean;
		
		public static function getTimeModel():ITimeModel {
			if (instance == null) {
				allowInstantiation = true;
				instance = new Metronome();
				allowInstantiation = false;
			}
			return instance;
		}
		
		// screen is an attribute to protect play/stop being called from anywhere but screen
		public static function getTimeControll(screen:IScreen):ITimeControll {
			if (instance == null) {
				allowInstantiation = true;
				instance = new Metronome();
				allowInstantiation = false;
			}
			return instance;
		}
		
		
//_____________________________________________________SINGELTON STUFF
//______________________________________________________________________________________
		
		
//__________________________________________________________________
//___________________________________________ITimeModel  Methods
		
		
		public function get tickSignal():Signal{
			return _tickSignal;
		}
		
		public function get soundTick():Signal{
			return _soundTick;
		}
		public function get metronomeTick():Signal{
			return _metronomeSignal;
		}
		
		
		public function get currentTick():uint{
			return Math.round(_tickValue/2);
		}
		
		
		
		//____________________________________________________________
		//________________ITimeControll  Methods
		
		
		public function play(duration:int):void{
			if(_isPlaying){
				trace("metronom is playing")
			}else{
				_isPlaying = true;
				_playActivated = true;
				_gtween = new GTween(this,duration);
				_gtween.onChange = onTick;
				//_gtween.repeatCount = 0;
				_gtween.useFrames=true;
			}
		}
		
		public function set beginAtFrame(frame:uint):void{
			_beginAtFrame = frame-1;//metronome dispaches first tick signal with frame+1 as value (because 0 is never played)
			_tickValue = _beginAtFrame*2;
		}
		
		public function get stopPosition():uint{
			return _stopPosition;
		}
		
		public function stop():void{
			_stopPosition = _tickValue;
			_playActivated=false;
			_isPlaying = false;
			reset();
		}
		
		public function pause():void{
			_playActivated=false;
			_isPlaying = false;
		}
		public function unPause():void{
			_playActivated=true;
			_isPlaying = true;
		}
		
		public function get isPlaying():Boolean{
			return _isPlaying;
		}
		
		//________________ITimeControll  Methods
		//____________________________________________________________
		
		
		private function reset():void{
			_tickValue = _beginAtFrame*2;
			_tickSignal.dispatch();
		}
		private var _miniTick:uint=0;
		private function onTick(tween:GTween):void{
			_miniTick++;
			if(_miniTick%4>0){
				return;
			}
			if(_playActivated){
				if(_tickValue/2 == Math.round(_tickValue/2)){
					soundTick.dispatch();
				}else{
					tickSignal.dispatch();
				}
				_tickValue++;
			}
			_metronomeSignal.dispatch();
			
		}
		
		
	}
}