package com.musicalInstruments.model
{
	public class PalletModel extends NotesInstrumentModel
	{
		private var _rhythm:uint;
		private var _palletType:String;
		public function PalletModel(instrument:XML)
		{
			_palletType=instrument.@palletType;
			_rhythm=instrument.@rhythm;
			super(instrument);
		}

		public function get palletType():String
		{
			return _palletType;
		}

		public function set palletType(value:String):void
		{
			_palletType = value;
		}

		public function get rhythm():uint
		{
			return _rhythm;
		}

		public function set rhythm(value:uint):void
		{
			_rhythm = value;
		}

	}
}