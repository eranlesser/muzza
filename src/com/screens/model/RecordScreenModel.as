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
		private var _recordInstrumentX:Number;
		private var _recordInstrumentY:Number;
		private var _noteTargetsY:uint;
		private var _noteTargetsYOffset:int;
		private var _backUpInsruments:Vector.<InstrumentModel>;
		private var _startAtCurPoint:int;
		public var score:int;
		public function RecordScreenModel(xml:XML,instruments:ThemeInstrumentsModel){
			super(xml);
			_instruments = instruments;
			_backUpInsruments=new Vector.<InstrumentModel>();
			parse(xml);
		}
		
		private function parse(xml:XML):void{
			_instrumentModel = _instruments.getInstrumentByName(xml.playerInstrument.@type);
			_recordeSequanceId = xml.playerInstrument.@recordedSequance;
			_learnedSequancedId =  xml.playerInstrument.@learnedSequanced;
			_startAtCurPoint=xml.@startAtCurPoint;
			_recordInstrumentX= xml.playerInstrument.RecordedX;
			_recordInstrumentY= xml.playerInstrument.RecordedY;
			_noteTargetsY= xml.playerInstrument.@noteTargetsY;
			_noteTargetsYOffset= xml.playerInstrument.@notesTargetYOffset;
			for each(var instrument:XML in xml.backups.instrument){
				var insModel:CoreInstrumentModel =_instruments.getInstrumentByName(instrument.@type);
				var themedInsModel:InstrumentModel = new InstrumentModel(insModel,instrument);
				_backUpInsruments.push(themedInsModel);
			}
		}
		
		public function get startAtCuePoint():int{
			return _startAtCurPoint;
		}
		
		
		public function getRecordInstrumentX():Number{
			return _recordInstrumentX
		}
		
		public function getRecordInstrumentY():Number{
			return _recordInstrumentY;
		}
		
		public function get noteTargetsY():int{
			return _noteTargetsY;
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

		public function get noteTargetsYOffset():int
		{
			return _noteTargetsYOffset;
		}
		
		
	}
}