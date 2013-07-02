package com.screens.model {
	import com.model.MainThemeModel;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;

	public class PlayScreenModel extends AbstractScreenModel
	{
		
		private var _instruments:Vector.<InstrumentModel>;
		private var _xml:XML;
		private var _playSequance:uint;
		private var _instrumentsModel:ThemeInstrumentsModel;
		private var _nowPlayingIcon:String;
		
		
		public function PlayScreenModel(xml:XML,instrumentsModel:ThemeInstrumentsModel){
			super(xml);
			_xml = xml;
			_instrumentsModel=instrumentsModel;
		}
		
		private function parse(xml:XML):void{
			_playSequance=xml.@playSequance;
			_nowPlayingIcon=xml.@nowPlaying;
			_instruments = new Vector.<InstrumentModel>();
			for each(var instrument:XML in xml.instrument){
				var insModel:CoreInstrumentModel =_instrumentsModel.getInstrumentByName(instrument.@type);
				var themedInsModel:InstrumentModel = new InstrumentModel(insModel,instrument);
				_instruments.push(themedInsModel);
			}
		}
		
		public function start():void{
			parse(_xml);
		}
		
		public function get playSequance():uint{
			return _playSequance;
		}
		
		public function get instruments():Vector.<InstrumentModel>{
			return _instruments;
		}
		
		public function get nowPlaying():String{
			return _nowPlayingIcon;
		}
	}
}