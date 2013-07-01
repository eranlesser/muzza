package com.model
{
	public class HighScoreModel
	{
		private var _instrumentsScores:Vector.<InstrumentHighScore>;
		public function HighScoreModel()
		{
			_instrumentsScores = new Vector.<InstrumentHighScore>();
		}
		
		public function update(scoreData:XML):XML{
			var newXml:XML;
			
			return newXml;
		}
	}
}

class InstrumentHighScore{
	public var id:String;
	public var score:int;
	
}