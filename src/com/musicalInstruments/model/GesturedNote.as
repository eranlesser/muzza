package com.musicalInstruments.model
{
	public class GesturedNote
	{
		private var _name:String;
		private var _id:String;
		
		public function GesturedNote(name:String,id:String)
		{
			_id=id;
			_name=name;
		}

		public function get id():String
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}


	}
}