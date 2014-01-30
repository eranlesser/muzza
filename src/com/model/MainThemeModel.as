package com.model
{
	import com.container.Presenter;
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
		private var _guiLayer:Presenter;
		private  var _instruments:			ThemeInstrumentsModel;
		private var _isTutorial:Boolean;
		public var ready:					Signal = new Signal();
		
		
		public function MainThemeModel(xml:XML,guiLayer:Presenter){
			_guiLayer=guiLayer;
			parse(xml);
		}
		
		public function get isTutorial():Boolean
		{
			return _isTutorial;
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
			_guiLayer.menu.instruments = _instruments;
		}
		
		private function onInstrumentsReady():void{
			ready.dispatch();
		}
		
		private function parse(xml:XML):void{
			_rhythm = xml.@rhythm;
			_isTutorial = xml.@tutorial == "true" ? true : false; 
			_instruments = new ThemeInstrumentsModel(xml.instruments[0]);
			_screens = new ScreensModel(xml,_instruments);	
			_instruments.ready.addOnce(onInstrumentsReady)
			_guiLayer.menu.instruments = _instruments;
		}
	}
}