package com.musicalInstruments.palleta.views
{
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.palleta.views.components.Pali;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	
	public class Pallet extends Sprite
	{
		
		
		public var playRequest:Signal = new Signal();
		private var _pallis:Vector.<Pali>=new Vector.<Pali>();
		public var isPlaying:Boolean=false;
		protected var _model:NotesInstrumentModel;
		public var notePlayed:Signal = new Signal();
		public function Pallet()
		{
			init();
		}
		
		protected function get bg():Class{
			return null;
		}
		
		protected function get frame():Class{
			return null;
		}
		
		protected function init():void{
			var bg:DisplayObject=addChild(new bg());
			var frame:DisplayObject = addChild(new frame());
			frame.scaleX=-1;
			bg.scaleX=-1;
			bg.x=bg.width;
			frame.x = frame.width;
			
		}
		
		public function get instrument():String{
			return "";
		}
		
		public function onTick(tickValue:uint):void{
			
		}
		
		public function set active(value:Boolean):void
		{
		}

		
		
	}
}