package com.studio
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	
	public class StudioModel
	{
		private var _studioInstruments:Vector.<InstrumentModel>;
		private var _instrumentsModel:ThemeInstrumentsModel;
		public function StudioModel(xml:XML,instrumentsModel:ThemeInstrumentsModel){
			_instrumentsModel=instrumentsModel;
			_studioInstruments=new Vector.<InstrumentModel>();
			parse(xml)
		}
		
		
		private function parse(xml:XML):void{
			for each(var instrument:XML in xml.instrument){
				var insModel:CoreInstrumentModel =_instrumentsModel.getInstrumentByName(instrument.@type);
				var themedInsModel:InstrumentModel = new InstrumentModel(insModel,instrument);
				_studioInstruments.push(themedInsModel);
			}
		}
		
		public function get instruments():Vector.<InstrumentModel>{
			return _studioInstruments;
		}
	}
}