package com.model
{
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.screens.model.ScreensModel;
	
	import org.osflash.signals.Signal;
	/**
	 *Composes screens with instruments, each song learned has a mainthememodel
	 * the idea is that since the instruments graphics are the same they will be reused in other songs for performance 
	 * @author eranlesser
	 * 
	 */
	public class MainThemeModel implements IThemeModel{
		
		private var _screens:				ScreensModel;
		private var _rhythm:				uint;

		private  var _instruments:	ThemeInstrumentsModel;
		public var ready:					Signal = new Signal();
		
		
		public function MainThemeModel(xml:XML){
			parse(xml);
		}
		
		public function get screensModel():ScreensModel{
			return _screens;
		}
		
		public  function get instrumentsModel():ThemeInstrumentsModel{
			return _instruments;
		}
		
		public function get rhythm():uint{
			return _rhythm;
		}
		
		public function reset():void{
			_instruments.reset();
		}
		
		private function onInstrumentsReady():void{
			ready.dispatch();
		}
		
		private function parse(xml:XML):void{
			_rhythm = xml.@rhythm;
			_instruments = new ThemeInstrumentsModel(xml.instruments[0]);
			_screens = new ScreensModel(xml,_instruments);		
			_instruments.ready.addOnce(onInstrumentsReady)
			
		}
	}
}