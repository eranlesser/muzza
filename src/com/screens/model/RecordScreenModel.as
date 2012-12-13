package com.screens.model {
	import com.constants.Directions;
	import com.model.MainThemeModel;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.PalletModel;
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;

	public class RecordScreenModel extends AbstractScreenModel
	{
		private var _instrumentModel:CoreInstrumentModel;
		private var _instruments:ThemeInstrumentsModel;
		private var _recordeSequanceId:uint;
		private var _learnedSequancedId:uint;
		private var _palletSequanceId:uint;
		private var _recordInstrumentX:int;
		private var _recordInstrumentY:int;
		private var _palletX:int;
		private var _palletY:int;
		private var _backUpInsruments:Vector.<InstrumentModel>;
		private var _startAtCurPoint:int;
		private var _palletModel:CoreInstrumentModel;
		
		public function RecordScreenModel(xml:XML,instruments:ThemeInstrumentsModel){
			super(xml);
			_instruments = instruments;
			_backUpInsruments=new Vector.<InstrumentModel>();
			parse(xml);
		}
		
		public function get palletSequanceId():uint
		{
			return _palletSequanceId;
		}

		private function parse(xml:XML):void{
			_instrumentModel = _instruments.getInstrumentByName(xml.playerInstrument.@type);
			_recordeSequanceId = xml.playerInstrument.@recordedSequance;
			_learnedSequancedId =  xml.playerInstrument.@learnedSequanced;
			_palletSequanceId =  xml.playerInstrument.@palletSequance;
			_startAtCurPoint=xml.@startAtCurPoint;
			_recordInstrumentX= xml.playerInstrument.RecordedX;
			_recordInstrumentY= xml.playerInstrument.RecordedY;
			_palletX= xml.pallet.@x;
			_palletY= xml.pallet.@y;
			if(xml.pallet is XMLList)
			_palletModel =_instruments.getInstrumentByName(xml.pallet.@type);
			for each(var instrument:XML in xml.backups.instrument){
				var insModel:CoreInstrumentModel =_instruments.getInstrumentByName(instrument.@type);
				var themedInsModel:InstrumentModel = new InstrumentModel(insModel,instrument);
				_backUpInsruments.push(themedInsModel);
			}
		}
		
		public function get startAtCuePoint():int{
			return _startAtCurPoint;
		}
		
		
		public function get palletModel():CoreInstrumentModel{
			return _palletModel;
		}
		
		public function getRecordInstrumentX():int{
			return _recordInstrumentX
		}
		public function getPalletX():int{
			return _palletX;
		}
		
		public function getPalletY():int{
			return _palletY;
		}
		
		public function getRecordInstrumentY():int{
			return _recordInstrumentY;
		}
		
		public function get instrumentModel():CoreInstrumentModel{
			return _instrumentModel;
		}
		
		public function get isRecorded():Boolean{
			var insModel:NoteSequanceModel = (_instrumentModel.getSequanceById(_recordeSequanceId) as NoteSequanceModel);
			return insModel && (insModel.notes.length>0);
		}
		
		public function get backUpInsruments():Vector.<InstrumentModel>{
			return _backUpInsruments;
		}
		
		public function get recordeSequanceId():uint{
			return _recordeSequanceId;
		}
		
		public function get learnedSequanceId():uint{
			return _learnedSequancedId;
		}
		
		
	}
}