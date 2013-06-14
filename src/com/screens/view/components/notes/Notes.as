package com.screens.view.components.notes
{
	import com.constants.Dimentions;
	import com.gskinner.motion.GTween;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.representation.RepresentationSizes;
	import com.representation.view.SpeedSlider;
	import com.view.gui.ToggleBut;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class Notes extends Sprite{
		
		private var _channel:NotesChannel;
		private var _notesCanvas:Sprite;
		private var _bg:Shape;
		private var _notesLength:uint;
		private var _instrumentY:uint;
		public function Notes(instrumentY:uint)
		{
			//_notesLength=notesLength;
			_instrumentY=instrumentY;
			this.mouseChildren=false;
			this.mouseEnabled=false;
		}
		
		public function start():void{
			_channel.start();
		}
		
		public function stop():void{
			_channel.stop();
		}
		
		
		public function addChannel(model:CoreInstrumentModel,notesLength:uint):NotesChannel{
			_channel = new NotesChannel(model,new Rectangle(0,0,Dimentions.WIDTH,_instrumentY),notesLength);
			addChild(_channel as DisplayObject);
			return _channel;
		}
		public function get channel():NotesChannel{
			return _channel;
		}
		
		public function removeNote(note:DroppingNote):void{
			_channel.removeNote(note)
		}
		
	}
}
