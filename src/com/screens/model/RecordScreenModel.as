package com.screens.model {
	import com.constants.Directions;
	import com.model.MainThemeModel;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;

	public class RecordScreenModel extends AbstractScreenModel
	{
		private var _instrumentModel:CoreInstrumentModel;
		private var _instruments:ThemeInstrumentsModel;
		private var _recordeSequanceId:uint;
		private var _learnedSequancedId:uint;
		private var _recordInstrumentX:int;
		private var _recordInstrumentY:int;
		private var _playInstrumentX:int;
		private var _playInstrumentY:int;
		private var _bandInsruments:Vector.<InstrumentModel>;
		private var _startAtCurPoint:int;
		
		public function RecordScreenModel(xml:XML,instruments:ThemeInstrumentsModel){
			super(xml);
			_instruments = instruments;
			_bandInsruments=new Vector.<InstrumentModel>();
			parse(xml);
		}
		
		private function parse(xml:XML):void{
			_instrumentModel = _instruments.getInstrumentByName(xml.playerInstrument.@type);
			_recordeSequanceId = xml.playerInstrument.@recordedSequance;
			_learnedSequancedId =  xml.playerInstrument.@learnedSequanced;
			_startAtCurPoint=xml.@startAtCurPoint;
			_recordInstrumentX= xml.playerInstrument.RecordedX;
			_recordInstrumentY= xml.playerInstrument.RecordedY;
			_playInstrumentX= xml.playerInstrument.PlayX;
			_playInstrumentY= xml.playerInstrument.PlayY;
			for each(var instrument:XML in xml.bandInstrument){
				var insModel:CoreInstrumentModel =_instruments.getInstrumentByName(instrument.@type);
				var themedInsModel:InstrumentModel = new InstrumentModel(insModel,instrument);
				_bandInsruments.push(themedInsModel);
			}
		}
		
		public function get startAtCuePoint():int{
			return _startAtCurPoint;
		}
		
		public function getPlayInstrumentX():int{
			return _playInstrumentX;
		}
		
		public function getRecordInstrumentX():int{
			return _recordInstrumentX
		}
		
		public function getPlayInstrumentY():int{
			return _playInstrumentY;
		}
		
		public function getRecordInstrumentY():int{
			return _recordInstrumentY;
		}
		
		public function get instrumentModel():CoreInstrumentModel{
			return _instrumentModel;
		}
		
		public function get bandInstruments():Vector.<InstrumentModel>{
			return _bandInsruments;
		}
		
		public function get recordeSequanceId():uint{
			return _recordeSequanceId;
		}
		
		public function get learnedSequanceId():uint{
			return _learnedSequancedId;
		}
		
		
	}
}