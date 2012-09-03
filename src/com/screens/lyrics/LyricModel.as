package com.screens.lyrics
{
	public class LyricModel
	{
		private var _cycle:uint;
		private var _lines:Vector.<Line>;
		public function LyricModel(xml:XML){
			_cycle=xml.@cycle;
			_lines = new Vector.<Line>();
			for each(var line:XML in xml.line){
				_lines.push(new Line(line.@value,line.@location));
			}
		}
		public function get cycle():uint{
			return _cycle;
		}
		public function get lines():Vector.<Line>{
			return _lines;
		}
	}
}

