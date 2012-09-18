package com.notes
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.view.components.NoteView;
	
	import flash.display.Sprite;
	
	public class NotesChannel extends Sprite implements INotesChannel
	{
		private var _instrumentModel:	CoreInstrumentModel;
		private var _notes:			Vector.<NoteView>;
		
		public function NotesChannel(model:CoreInstrumentModel){
			_instrumentModel = model;
		}
		
		public function clearNotes():void{};
		public function drawNote(noteModel:SequancedNote,noteValue:uint,noteWeight:uint,type:String,isFlatOrSharp:String):void{};
		public function getNoteByLocation(location:uint):NoteView{
			for each(var note:NoteView in _notes){
				if(note.location==location){
					return note;
				}
			}
			return null;
		};
	}
}