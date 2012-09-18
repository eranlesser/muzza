package com.screens.recordScreenStates
{
	import com.constants.States;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.components.NoteView;
	import com.musicalInstruments.view.recordable.TapInstrument;
	import com.representation.RepresentationSizes;
	import com.representation.view.Channel;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;
	
	public class PracticeState implements IRecordScreenState
	{
		protected var _context:			RecordScreenStateController;
		protected var _currentNote:		NoteView;
		private var _channel:			Channel;
		private var _currentNoteIndx:	uint=0;
		private var _noteFetcher:		INoteFetcher;
		private var _complete:			Signal = new Signal();
		private var _timeModel:			ITimeModel = Metronome.getTimeModel();
		private var _answerTimer:		Timer;
		private var _correctAnswerTime:	uint=0;
		private var _totalAnswerTime:	uint;
		private var _wrongAnswers:		uint=0;
		private var _ofBeatNotes:		uint=0;
		private var _correctAnswers:	uint=0;
		private var _goodAnsersInARow:	uint=0;

		public function PracticeState(stateController:RecordScreenStateController){
			_context = stateController;
			_channel=_context.channel;
			_noteFetcher=NotesInstrumentModel(_context.model.instrumentModel);
			_answerTimer=new Timer(30);
			_answerTimer.addEventListener(TimerEvent.TIMER,onAnswerTimer);
		}
		
		public function get name():String{
			return States.PRACTICE;
		}
		
		public function activate():void{
			_context.instrumentRecorder.notePlayed.add(onNotePlayed);
			_context.practiceButton.clicked.add(onStop);
			_timeModel.tickSignal.add(highLightNext);
			_context.startTimer();
			_context.instrumentRecorder.notePlayed.addOnce(onInstrumentPlayed);
			_context.bubble.setText("Look up!",false)
			_totalAnswerTime=0;
			_ofBeatNotes=0;
			_correctAnswers=0;
			_context.recordChannelController.start();
			_context.notes.start();
			var noteSequance:NoteSequanceModel=NoteSequanceModel(NotesInstrumentModel(_context.model.instrumentModel).getSequanceById(_context.model.learnedSequanceId));
			TapInstrument(_context.instrumentRecorder).autoSetOctave(noteSequance);
			_context.recordChannelController.reset();
		}
		
		private function onInstrumentPlayed(noteId:String):void{
			_answerTimer.start();
		}
		
		public function deActivate():void{
			TapInstrument(_context.instrumentRecorder).deAutoSetOctave();
			if(_timeModel.currentTick>100){
			if(_wrongAnswers<3&&_totalAnswerTime<50&&(_ofBeatNotes-_correctAnswers)<3){
				_context.bubble.setText("You're ready to record!",true)
			}else{
				_context.bubble.setText("Practice some more",true)
			}
			}
			
			_context.notes.stop();
			_context.recordChannelController.stop();
			_currentNoteIndx=0;
			_wrongAnswers=0;
			_context.practiceButton.state="pressed";
			_context.practiceButton.clicked.remove(onStop);
			_context.instrumentRecorder.notePlayed.remove(onInstrumentPlayed);
			_context.instrumentRecorder.notePlayed.remove(onNotePlayed);
			_timeModel.tickSignal.remove(highLightNext);
			_context.stopTimer();
			_answerTimer.stop();
			_context.recordChannelController.reset();
		}
		
		public function get complete():Signal{
			return _complete;
		}
		
		private function onAnswerTimer(e:TimerEvent):void{
			_correctAnswerTime++;
		}
		
		private function onStop(stt:String):void{
			_wrongAnswers=5;
			_complete.dispatch();
		}
		
		protected function getNoteByDistance(distance:uint):NoteView{
			var curNote:NoteView;
			for(var i:uint=0;i<distance;i++){//was i<4
				if(_channel.getNoteByLocation(_timeModel.currentTick+i)){
					curNote=_channel.getNoteByLocation(_timeModel.currentTick+i);
					break;
				}
			}
			return curNote;
		}
		
		protected function highLightNext():Boolean{
			var noteChanged:Boolean=false;
			if(_timeModel.currentTick==_context.model.endAtFrame){
				_complete.dispatch();
				return false;
			}
			
			var curNote:NoteView=getNoteByDistance(20);
			if(!curNote){return false}
			
			if(curNote!=_currentNote){
				_currentNote=curNote;
				_currentNoteIndx=_timeModel.currentTick;
				_currentNote.highLight();
				_correctAnswerTime=2;
				noteChanged=true;
			}
			if((_currentNote.location==_timeModel.currentTick)&&_currentNote.isHighLight){
				_context.pauseTimer();
				_correctAnswerTime=0;
			}
			return noteChanged;
		}
		
		
		private function onNotePlayed(id:uint):void{
			if(!_currentNote){
				_ofBeatNotes++;
				return;
			}
			if((_noteFetcher.getNoteById(id).value==_currentNote.value)&&_currentNote.isHighLight){
				calculateGoodFeedback();
			}else{
				calculateBadFeedback();
			}
			
		}
		
		private function calculateGoodFeedback():void{
			_wrongAnswers=0;
			_goodAnsersInARow++;
			_totalAnswerTime+=_correctAnswerTime;
			_correctAnswers++;
			_currentNote.deLight();
			_currentNoteIndx++;
			_context.unPauseTimer();
			if(_correctAnswerTime<=1){
				if(Math.random()>0.5){
					_context.bubble.setText("excellent!",false)
				}else{
					_context.bubble.setText("Amazing!",false)
				}
			}else if(_correctAnswerTime<2){
				_context.bubble.setText("all right!",false)
			}
			else if(_correctAnswerTime<3){
				_context.bubble.setText("ok!",false)
			}else if(_goodAnsersInARow>6){
				if(Math.random()>0.5){
					_context.bubble.setText("Keep it up!",false);
				}else if(Math.random()>0.5){
					_context.bubble.setText("You're good!",false);
				}
				_goodAnsersInARow=0;
			}
		}
		
		private function calculateBadFeedback():void{
			_wrongAnswers++;
			_goodAnsersInARow=0;
			if(_wrongAnswers/3==Math.round(_wrongAnswers/3)){
				if(Math.random()>0.7){
					_context.bubble.setText("Pay attention to the numbers above",false);
				}else if(Math.random()>0.3){
					_context.bubble.setText("Ouuch! !",false);
				}else{
					_context.bubble.setText("Look Up",false);
				}
			}
		}
		
		
		
	}
}