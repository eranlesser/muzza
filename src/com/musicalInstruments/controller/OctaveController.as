package com.musicalInstruments.controller
{
	import com.metronom.Metronome;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.recordable.TapInstrument;

	public class OctaveController
	{
		private var _model:NoteSequanceModel;
		private var _view:TapInstrument;
		private var _currentOctave:uint=0;
		public function OctaveController(model:NoteSequanceModel,view:TapInstrument){
			_model=model;
			_view=view;
		}
		
		public function start():void{
			Metronome.getTimeModel().tickSignal.add(onTick);
		}
		public function stop():void{
			Metronome.getTimeModel().tickSignal.remove(onTick);
		}
		
		private function onTick():void{
			var note:SequancedNote=_model.getNoteByLocation(Metronome.getTimeModel().currentTick);
			if(note&&(_currentOctave!=note.octave)){
				_view.octave=note.octave;
				_currentOctave=note.octave;
			}
		}
	}
}