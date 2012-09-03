package com.screens.model
{
	import com.screens.lyrics.LyricModel;

	public class AbstractScreenModel
	{
		private var _beginAtFrame:	uint;
		private var _endAtFrame:	uint;
		private var _lyrics:		Vector.<LyricModel>;
		public function AbstractScreenModel(xml:XML){
			parse(xml);
		}
		
		private function parse(xml:XML):void{
			_beginAtFrame = xml.@beginAtFrame;
			_endAtFrame = xml.@endAtFrame;
			_lyrics = new Vector.<LyricModel>();
			for each(var lyric:XML in xml.lyrics.lyric){
				_lyrics.push(new LyricModel(lyric));
			}
		}
		
		public function get lyrics():Vector.<LyricModel>{
			return _lyrics;
		}
		
		
		public function get beginAtFrame():uint{
			return _beginAtFrame;
		}
		
		public function get endAtFrame():uint{
			return _endAtFrame;
		}
	}
}