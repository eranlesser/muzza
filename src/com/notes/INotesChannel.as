package com.notes
{
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.view.components.NoteView;

	public interface INotesChannel
	{
		function clearNotes():void;
		function drawNote(noteModel:SequancedNote,noteValue:uint,noteWeight:uint,type:String,isFlatOrSharp:String):void;
		function getNoteByLocation(location:uint):NoteView;
	}
}