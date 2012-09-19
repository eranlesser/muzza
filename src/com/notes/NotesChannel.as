package com.notes
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.view.components.NoteView;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class NotesChannel extends Sprite implements INotesChannel
	{
		private var _instrumentModel:	CoreInstrumentModel;
		private var _notes:				Vector.<BigNote>;
		private var _notesContainer:	Sprite;
		private var _notesMask:			Shape;
		
		
		
		public function NotesChannel(model:CoreInstrumentModel,size:Rectangle){
			_instrumentModel = model;
			_notes=new Vector.<BigNote>();
			drawFrame(size);
		}
		
		public function setX(xx:int):void{
			_notesContainer.x=xx;
		}
		
		public function clearNotes():void{
		
		}
		
		public function drawNote(noteModel:SequancedNote,noteValue:uint,noteWeight:uint,type:String,isFlatOrSharp:String):void{
			var note:BigNote = new BigNote(noteValue,noteWeight,type,noteModel.location,_instrumentModel.thumbNail,isFlatOrSharp);
			_notesContainer.addChild(note);
			note.x=noteModel.location*(_notesMask.width/64);
			note.y=80;
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