package com.musicalInstruments.controller
{
	import com.metronom.Metronome;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.instrument.TapInstrument;

	public class OctaveSetter
	{
		private var _model:NoteSequanceModel;
		private var _view:TapInstrument;
		private var _currentOctave:uint=0;
		public function OctaveSetter(model:NoteSequanceModel,view:TapInstrument){
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
			var note:Vector.<SequancedNote>=_model.getNotesByLocation(Metronome.getTimeModel().currentTick);
			if(note&&(_currentOctave!=note[0].octave)){
				_view.octave=note[0].octave;
				_currentOctave=note[0].octave;
			}
		}
	}
}