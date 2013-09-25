package com.musicalInstruments.model
{

	public class InstrumentComponentModel
	{
		public var image:String;
		public var playImage:String;
		public var x:int;
		public var y:int;
		private var _noteId:String;
		private var _noteX:int;
		private var _noteY:int;
		private var _clickable:Boolean=true;
		private var _octave:uint=1;
		
		public function InstrumentComponentModel(xml:XML){
			image = xml.@image;
			playImage = xml.@playImage;
			x = xml.@x;
			y = xml.@y;
			_noteX = xml.@noteX;
			_noteY = xml.@noteY;
			_noteId = xml.tap.@noteId;
			if(xml.@clickable=="false"){
				_clickable=false;
			}
			if(xml.@octave>0){
				_octave = xml.@octave; 
			}
		}
		
		public function get octave():uint{
			return _octave;
		}
		
		public function get clickable():Boolean{
			return _clickable;
		}
		
		public function get noteId():String{
			return _noteId;
		}
		
		public function get noteX():int{
			return _noteX;
		}
		public function get noteY():int{
			return _noteY;
		}
	}
}