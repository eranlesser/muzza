package com.screens.recordScreenStates
{
	import com.constants.Rhythms;
	import com.constants.Session;
	import com.constants.States;
	import com.freshplanet.nativeExtensions.Flurry;
	import com.gskinner.motion.GTween;
	import com.inf.PopUpModel;
	import com.inf.PopUpsManager;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.components.NoteSequancePlayer;
	import com.musicalInstruments.view.instrument.TapInstrument;
	import com.representation.ChanelNotesType;
	import com.representation.RepresentationSizes;
	import com.representation.controller.RecordChannelController;
	import com.screens.view.AbstractScreen;
	import com.screens.view.components.notes.DroppingNote;
	import com.screens.view.components.notes.NotesChannel;
	import com.testflightapp.sdk.TestFlight;
	import com.view.MetronomView;
	
	import flash.events.Event;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;

	public class RecordState implements IRecordScreenState
	{
		
		protected var _context:		RecordScreenStateController;
		protected var _complete:		Signal = new Signal();
		protected var _timeModel:		ITimeModel = Metronome.getTimeModel();
		private var _toPlayNotes:Vector.<DroppingNote>;
		private var _practiceMode:Boolean;
		private var _tween:GTween;
		private var _timerTween:GTween;
		public static const fixNum:uint=6;
		public static const PASS_PERCENT:Number = 6/8;
		
		public function RecordState(stateController:RecordScreenStateController){
			_context = stateController;
			//=new MetronomView();
		}
		
		public function get complete():Signal{
			return _complete;
		}
		
		public function deActivate():void{
			TapInstrument(_context.instrumentRecorder).deAutoSetOctave();
			//_context.instrumentRecorder.notePlayed.remove(record);
			_timeModel.tickSignal.remove(onTimerTick);
			_context.recordChannelController.endRecord();
			_context.stopTimer();
			_context.recordButton.state="idle";
			_context.recordButton.clicked.remove(onRecordBtn);
			_context.practiceButton.clicked.remove(onPracticeClicked);
			//_context.frameRate = Rhythms.DELAY_COUNT;
			_context.notes.stop();
			_context.recordChannelController.stop();
			//_preTicker.active=false;
			//_context.notes.backUpsBut.clicked.remove(setBackUps);
			for each(var noteSequencePlayer:NoteSequancePlayer in _context.backUps){
				noteSequencePlayer.stop();
			}
//			var popUpModel:PopUpModel = PopUpsManager.getPopUpModel(PopUpsManager.END_RECORD);
//			var title:String = strReplace(popUpModel.title,"$",getTitleFromScore(_context.score,_context.recordChannelController.length));
//			var content:String = strReplace(popUpModel.content,"$points",_context.score.toString());
//			content = strReplace(popUpModel.content,"$points",_context.score.toString());
//			content = strReplace(content,"$total", _context.recordChannelController.length.toString());
//			PopUpsManager.openPopUp(PopUpsManager.END_RECORD,title,content).nextSignal.addOnce(
//				function():void{
//					if(_context.score/_context.recordChannelController.length>PASS_PERCENT){
//						PopUpsManager.openPopUp(PopUpsManager.LISTEN);
//						Session.instance.registerGoodrecoredScreen(_context.model);
//						TestFlight.passCheckpoint("Recorded GOOD");
//						Flurry.getInstance().logEvent("Recorded GOOD");
//					}else{
//						var tryAgainPopUp:PopUpModel = PopUpsManager.getPopUpModel(PopUpsManager.TRY_AGAIN);
//						var hitsContent:String = strReplace(tryAgainPopUp.content,"$hits",Math.ceil(_context.notesLength*PASS_PERCENT).toString());
//						PopUpsManager.openPopUp(PopUpsManager.TRY_AGAIN,"",hitsContent)
//						TestFlight.passCheckpoint("Recorded BAD");
//						Flurry.getInstance().logEvent("Recorded BAD");
//					}
//				}
//			);
			//TestFlight.submitFeedback(_context.model.instrumentModel.thumbNail+" Recording done score= "+ _context.score+" / "+_context.recordChannelController.length);
			
		}
		private function strReplace(str:String, search:String, replace:String):String {
			return str.split(search).join(replace);
		}
		
		private function getTitleFromScore(score:uint,total:uint):String{
			var fb:String;
			if(score==total){
				fb = "Awsome !";
			}
			else if(score/total>PASS_PERCENT){
				fb = "Great Job";
			}
			else if(score/total>1/2){
				fb = "Not Bad";
			}
			else{
				fb = "Lets Try Again";
			}
			return fb;
		}
		
		private function setBackUps():void{
			for each(var noteSequencePlayer:NoteSequancePlayer in _context.backUps){
				//if(_context.notes.backUpsBut.selected){
					noteSequencePlayer.play(noteSequencePlayer.getSequance(_context.model.recordeSequanceId),0.3);
				//}else{
				//	noteSequencePlayer.stop();
				//}
			}
		}
		
		public function get name():String{
			return States.RECORD;
		}
		private function onPracticeClicked(buttonState:Boolean):void{
			_context.practice();
		}
		
		private function checkNotesMatch(noteId:String):void{
			var match:Boolean = false;
			//for each(var curNote:DroppingNote in _toPlayNotes){
			if(_toPlayNotes.length>0){
			var curNote:DroppingNote = _toPlayNotes[0];
				if(noteId==curNote.id){
					//trace("good");
					//_context.addScore(1);
					_tween.paused=false;
					_toPlayNotes.splice(_toPlayNotes.indexOf(curNote),1);
					_context.notes.removeNote(curNote);
					//_context.notes.marc(curNote.value,true);
					//_context.recordChannelController.fix(noteId,curNote.location,5);
					match = true;
					//break;
				}
			}
			//}
//			if(!match){
//				//_context.notes.marc(NotesInstrumentModel(_context.model.instrumentModel).getNoteById(noteId).value,false);
//				_goodNotes--;				
//			}
		}
		
		public function activate():void{
			PopUpsManager.closePopUp();
			_context.recordButton.state="pressed";
			_context.instrumentRecorder.notePlayed.add(checkNotesMatch);
			_context.recordChannelController.reset(ChanelNotesType.TEACHER_PLAYING);
			_context.recordChannelController.start();
			_context.recordButton.clicked.add(onRecordBtn);
			//_context.practiceButton.clicked.add(onPracticeClicked);
			var noteSequance:NoteSequanceModel=NoteSequanceModel(NotesInstrumentModel(_context.model.instrumentModel).getSequanceById(_context.model.learnedSequanceId));
			TapInstrument(_context.instrumentRecorder).autoSetOctave(noteSequance);
			//_preTicker.active=true;
			_context.speed=Rhythms.RECORD_SPEED;
			//_context.notes.backUpsBut.clicked.add(setBackUps);
			_timeModel.tickSignal.add(onTimerTick);
			_context.startTimer();
			_context.recordChannelController.beginRecord();
			setBackUps();
			_tween = Metronome.getTimeControll().play(_context.notes.channel.notesContainer,_context.model.endAtFrame,{y:_context.model.endAtFrame*NotesChannel._notesGap});
			_tween.onComplete = onComplete;
			_context.notes.start();
			_timerTween = new GTween(_context.timeSlider,_context.model.endAtFrame*3,{value:100});
			_timerTween.useFrames = true;
			_timerTween.onComplete = onTimeOut;
			_timerTween.onChange = onTimeChanged;
			_context.timeField.setTextFormat(new TextFormat("Helvetica",20,0xFFFFFF));
			//_context.resetScore();
			_practiceMode = true;//(Session.instance.goodScreensLength<3 && !Session.instance.recordScreenGood(_context.model)) ;
			//_goodNotes=0;
		}
		private var _timeEnding:Boolean=false;
		private function onTimeChanged(t:GTween):void{
			if(t.position>=t.duration*7/8){
				if(Math.round(t.position)%10==0){
					_timeEnding = !_timeEnding;
				}
				if(_timeEnding)
					_context.timeField.setTextFormat(new TextFormat("Helvetica",20,0xFFB244));
				else
					_context.timeField.setTextFormat(new TextFormat("Helvetica",20,0xFFFFFF));
			}
		}
		
		private function onTimeOut(t:GTween):void{
			stop();
			TestFlight.passCheckpoint("Recorded BAD");
			Flurry.getInstance().logEvent("Recorded BAD");
			PopUpsManager.openPopUp(PopUpsManager.TIME_OUT).nextSignal.addOnce(
				function():void{
					var tryAgainPopUp:PopUpModel = PopUpsManager.getPopUpModel(PopUpsManager.TRY_AGAIN);
					PopUpsManager.openPopUp(PopUpsManager.TRY_AGAIN)
					
				}
			);
		}
		private function onCompleteBeforeTimer():void{
			if(_context.recordChannelController.recordedLength >= _context.recordChannelController.learnedLength ){
				var popUpModel:PopUpModel = PopUpsManager.getPopUpModel(PopUpsManager.END_RECORD);
				Session.instance.registerGoodrecoredScreen(_context.model);
				TestFlight.passCheckpoint("Recorded GOOD");
				Flurry.getInstance().logEvent("Recorded GOOD onCompleteBeforeTimer");
				PopUpsManager.openPopUp(PopUpsManager.END_RECORD).nextSignal.addOnce(
					function():void{
						PopUpsManager.openPopUp(PopUpsManager.LISTEN);
						
					}
				);
			}else{
				PopUpsManager.openPopUp(PopUpsManager.TRY_AGAIN);
				Flurry.getInstance().logEvent("Recorded BAD onCompleteBeforeTimer");
			}
		}
		private function onComplete(t:GTween):void{
			stop();
			onCompleteBeforeTimer();
		}
		
		private function stop():void{
			_complete.dispatch();
			_timerTween.paused=true;
			_timerTween.onComplete = null;
			_timerTween.onChange = null;
			_timerTween.init();
		}
		
		private function onTimerTick():void{
			if(_context.model.endAtFrame == _timeModel.currentTick){
				//stop();
			}
			_toPlayNotes=(_context.channel as NotesChannel).getNotesInRange(fixNum,_timeModel.currentTick);
			//var curNote:BigNote=getNoteByDistance(4);
			if(_practiceMode){
				if(_toPlayNotes.length>0){
					_toPlayNotes[0].selected=true;
				}
			for each(var curNote:DroppingNote in _toPlayNotes){
				//curNote.state="selected";
				//_context.instrumentRecorder.marc(curNote.id,4);
				if(curNote.location==_timeModel.currentTick){
					_tween.paused=true;
					//curNote.selected=true;
				}
			}
			}
			
			//if(curNote!=_currentNote){
			//	_currentNote=curNote;
			//	_currentNoteIndx=_timeModel.currentTick;
				
		}
		
		
		private function onRecordBtn(buttonState:Boolean):void{
			stop();
			onCompleteBeforeTimer();
		}
		
		
	}
}