package com.musicalInstruments.model {
	import org.osflash.signals.Signal;
	/**
	 * 
	 * @author eranlesser
	 * access point for all instrument models per theme, since they are all the same throughout the theme
	 * there is no need to reparse them, they are created in th mainthememodel and called from screens.
	 */
	public class ThemeInstrumentsModel
	{
		private var _instruments:Vector.<CoreInstrumentModel>;
		private var _loadedInstruments:uint = 0;
		public var ready:Signal = new Signal();
		public function ThemeInstrumentsModel(instruments:XML)
		{
			_instruments = new Vector.<CoreInstrumentModel>;
			parse(instruments);
		}
		
		public function getInstrumentByName(name:String):CoreInstrumentModel{
			for each(var ins:CoreInstrumentModel in _instruments){
				trace(ins.thumbNail,name)
				if(ins.thumbNail == name){
					return ins;
				}
			}
			throw new Error("no instrument found error :"+name);
			return null;
		}
		
		///
		public function get instruments():Vector.<CoreInstrumentModel>{
			return _instruments;
		}
		
		public function reset():void{
			for each(var instrument:CoreInstrumentModel in _instruments){
				instrument.reset();
			}
		}
		
		private function parse(instruments:XML):void{
			var instrumentModel:CoreInstrumentModel;
			for each(var instrument:XML in instruments.children()){
				if(instrument.@type == "voice"){
					//instrumentModel = new VoiceInstrumentModel(instrument);
				}else if(instrument.@type == "pallet"){
					instrumentModel = new PalletModel(instrument);
				}else{
					instrumentModel = new NotesInstrumentModel(instrument);
				}
				instrumentModel.ready.addOnce(onInstrumentReady);
				trace(instrumentModel.thumbNail)
				_instruments.push(instrumentModel);
			}
		}
		
		private function onInstrumentReady():void{
			_loadedInstruments++;
			if(_loadedInstruments == _instruments.length-1){//-1 for singer
				ready.dispatch();
			}
		}
		
		
		
	}
}