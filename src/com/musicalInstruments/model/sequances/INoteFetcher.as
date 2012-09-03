package com.musicalInstruments.model.sequances
{
	import com.musicalInstruments.model.NoteModel;

	public interface INoteFetcher
	{
	function getNoteById(noteId:uint):NoteModel;
	 function set octave(level:uint):void;
	}
}