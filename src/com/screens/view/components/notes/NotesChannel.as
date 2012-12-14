package com.screens.view.components.notes
{
	import com.gskinner.motion.GTween;
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
	
	public class NotesChannel extends Sprite
	{
		private var _instrumentModel:	CoreInstrumentModel;
		private var _notes:				Vector.<BigNote>;
		private var _notesContainer:	Sprite;
		private var _notesMask:			Shape;
		private var _instrumentY:uint;
		public var moved:Signal=new Signal();
		private var _tween:GTween;
		
		
		public function NotesChannel(model:CoreInstrumentModel,size:Rectangle){
			_instrumentModel = model;
			_notes=new Vector.<BigNote>();
			_instrumentY = size.height;
			drawFrame(size);
		}
		
//		public function setY(yy:int):void{
//			_notesContainer.y=yy-240;//-_notesMask.width/2;
//			moved.dispatch(_notesContainer.y);
//		}
		
		public function start(notesLength:uint):void{
			this.y=0;
			
			_tween=new GTween(_notesContainer,notesLength*2,{y:(((RepresentationSizes.notesArea)/128))*(notesLength*2)});
			_tween.useFrames=true;
		}
		
		public function stop():void{
			if(_tween)
			_tween.end();
			_notesContainer.y=0;
		}
		
		public function pause():void{
			_tween.paused = true;
		}
		
		public function clearNotes():void{
			while(_notes.length>0){
				var noteView:BigNote = _notes.pop();
				_notesContainer.removeChild(noteView);
			}
		}
		
		public function drawNote(noteModel:SequancedNote,noteValue:uint,xx:uint):void{
			var note:BigNote = new BigNote(noteValue,noteModel.location,_instrumentModel.thumbNail,noteModel.noteId);
			_notesContainer.addChild(note);
			note.y=-(noteModel.location*2)*((RepresentationSizes.notesArea)/128)+_instrumentY;
			if(xx>0){
				note.x=xx-note.width/2;
			}else{
				note.x=(noteValue-1)*_instrumentModel.notesGap+_instrumentModel.leftPad;
			}
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
				if(note.location<=(curTick+range)&&note.location>curTick){
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