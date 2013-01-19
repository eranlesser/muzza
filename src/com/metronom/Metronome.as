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
		private var _gtween:				GTween;
		public function Metronome(){
			_tickSignal = new Signal();
//			_gtween = new GTween(this,100);
//			_gtween.onChange = onTick;
//			_gtween.repeatCount = 0;
//			_gtween.useFrames=true;
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
		
		public static function getTimeControll():ITimeControll {
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
		
		
		
		public function get currentTick():uint{
			return (_tickValue);
		}
		
		
		
		//____________________________________________________________
		//________________ITimeControll  Methods
		
		
		public function play(target:Object,duration:uint,props:Object):GTween{
			if(_gtween){
				_gtween.end();
				_gtween.onChange=null;
				_gtween.init();
			}
			_gtween = new GTween(target,duration*2,props);
			_gtween.onChange = onTick;
			_gtween.useFrames=true;
			return _gtween;
		}
		
		public function pause():void{
			_gtween.paused = !_gtween.paused;
		}
		
		public function set beginAtFrame(frame:uint):void{
			_beginAtFrame = frame-1;//metronome dispaches first tick signal with frame+1 as value (because 0 is never played)
		}
		public function toZero():void{
			_gtween.paused=true;
			_gtween.position=0;
		}
		
		public function stop():void{
			reset();
		}
		
		
		
		//________________ITimeControll  Methods
		//____________________________________________________________
		
		
		private function reset():void{
			_tickValue = _beginAtFrame*2;
			_tickSignal.dispatch();
			if(_gtween){
				_gtween.onChange=null;
				_gtween.end();
				_gtween.init();
			}
		}
		private function onTick(tween:GTween):void{
			if(Math.round(tween.position/2)==_tickValue){
				return;
			}
			_tickValue = Math.round(tween.position/2);
			_tickSignal.dispatch();
			trace(_tickValue,"met")
		}
		
		
	}
}