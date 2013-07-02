package com.screens.model
{

	public class AbstractScreenModel
	{
		private var _beginAtFrame:	uint;
		private var _endAtFrame:	uint;
		public function AbstractScreenModel(xml:XML){
			parse(xml);
		}
		
		private function parse(xml:XML):void{
			_beginAtFrame = xml.@beginAtFrame;
			_endAtFrame = xml.@endAtFrame;
			
		}
		
		
		public function get beginAtFrame():uint{
			return _beginAtFrame;
		}
		
		public function get endAtFrame():uint{
			return _endAtFrame;
		}
	}
}