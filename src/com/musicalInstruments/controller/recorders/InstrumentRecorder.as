package com.musicalInstruments.controller.recorders
{
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.model.FileProxy;
	import com.musicalInstruments.model.sequances.ISequance;
	import com.musicalInstruments.model.sequances.RecordableNotesSequance;
	import com.musicalInstruments.view.recordable.RecordableView;
	
	import org.osflash.signals.Signal;
	

	public class InstrumentRecorder implements IRecorder{
		
		private var _instrument:	RecordableView;
		private var _sequance:		RecordableNotesSequance;
		private var _model:			ITimeModel;
		private var _beginAtFrame:	uint;
		private var _endAtFrame:	uint;
		private var _added:			Signal = new Signal();
		
		public function InstrumentRecorder(instrument:RecordableView,recordingSequanceId:uint, beginAtFrame:uint,endAtFrame:uint){
			_instrument = instrument;
			_sequance = new RecordableNotesSequance(recordingSequanceId);
			_model = Metronome.getTimeModel();
			_beginAtFrame = beginAtFrame;
			_endAtFrame = endAtFrame;
		}
		
		public function get sequance():ISequance{
			return _sequance;
		}
		
		public function get added():Signal{
			return _added;
		}
		
		public function set enabled(able:String):void{
			_instrument.ableState = able;
		}
		
		public function beginRecord():void{
			_sequance.reset();
			_instrument.noteStopped.add(onNoteStopped);
		}
		
		public function endRecord():void{
			recordingDone();
		}
		
		private function recordingDone():void{
			_instrument.noteStopped.remove(onNoteStopped);
			if(!_sequance.isEmpty){
				//write sequance somewhere
				_instrument.addRecordedSequance(_sequance, _beginAtFrame,_endAtFrame);
				FileProxy.exportSequance(_sequance, _instrument.instrumentName);
			}
		}
		
		private function onNoteStopped(noteId:uint,startLocation:uint,soundLength:uint,octave:uint):void{
			if(startLocation<_beginAtFrame){  // in case of autorecord the first note is at 0 (or 64)
				startLocation = _beginAtFrame;
			}
			
			var location:uint = startLocation-1;
			if(location%4>2){
				location=startLocation+location%4;
			}else{
				location=startLocation-location%4;
			}
			_added.dispatch(_sequance.add(noteId,location,soundLength,octave));
		}
	}
}