package com.screens.view.components.notes
{
	import com.gskinner.motion.easing.Sine;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.view.components.NoteView;
	import com.representation.ChanelNotesType;
	import com.representation.RepresentationSizes;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import org.osflash.signals.Signal;
	
	public class NotesChannel extends Sprite implements INotesChannel
	{
		private var _instrumentModel:	CoreInstrumentModel;
		private var _notes:				Vector.<BigNote>;
		private var _notesContainer:	Sprite;
		private var _notesMask:			Shape;
		public var moved:Signal=new Signal();
		
		
		public function NotesChannel(model:CoreInstrumentModel,size:Rectangle){
			_instrumentModel = model;
			_notes=new Vector.<BigNote>();
			drawFrame(size);
		}
		
		public function setY(yy:int):void{
			_notesContainer.y=yy-240;//-_notesMask.width/2;
			moved.dispatch(_notesContainer.y);
		}
		
		public function clearNotes():void{
			while(_notes.length>0){
				var noteView:BigNote = _notes.pop();
				_notesContainer.removeChild(noteView);
			}
		}
		
		public function drawNote(noteModel:SequancedNote,noteValue:uint,type:String,isFlatOrSharp:String):void{
			var note:BigNote = new BigNote(noteValue,type,noteModel.location,_instrumentModel.thumbNail,noteModel.noteId, isFlatOrSharp);
			_notesContainer.addChild(note);
			note.y=-(noteModel.location*2)*((RepresentationSizes.notesArea)/128)+950/2-80;
			note.x=(noteValue-1)*_instrumentModel.notesGap+_instrumentModel.leftPad;
			_notes.push(note);
			
		}
		
		public function getNoteByLocation(location:uint):BigNote{
			for each(var note:BigNote in _notes){
				if(note.location==location){
					return note;
				}
			}
			return null;
		};
		
		public function getNotesInRange(range:uint,curTick:uint):Vector.<BigNote>{
			var rangeNotes:Vector.<BigNote> = new Vector.<BigNote>();
			for each(var note:BigNote in _notes){
				if(note.location>=(curTick-range)){
					rangeNotes.push(note);
				}
				
			}
			return rangeNotes;
		}
		
		private function drawFrame(size:Rectangle):void{
			_notesMask=new Shape();
			_notesMask.graphics.beginFill(0x333333)
			_notesMask.graphics.drawRect(0,0,size.width,size.height);
			_notesMask.graphics.endFill();
			addChild(_notesMask);
			
			_notesContainer=new Sprite();
			_notesContainer.graphics.beginFill(0x33CCCC,0);
			_notesContainer.graphics.drawRect(0,0,size.width,size.height)
			addChild(_notesContainer);
			_notesContainer.mask=_notesMask;
		}
	}
}