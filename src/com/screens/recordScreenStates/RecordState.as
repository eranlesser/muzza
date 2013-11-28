package com.screens.recordScreenStates
{
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.constants.States;
	import com.container.Presenter;
	import com.gskinner.motion.GTween;
	import com.inf.PopUpsManager;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.model.FileProxy;
	import com.musicalInstruments.view.IMusicalInstrumentComp;
	import com.musicalInstruments.view.components.MusicalInstrumentComponent;
	import com.musicalInstruments.view.instrument.TapInstrument;
	import com.screens.mediator.ScoreMediator;
	import com.screens.view.components.Clock;
	import com.screens.view.components.notes.DroppingNote;
	import com.screens.view.components.notes.NotesChannel;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;

	public class RecordState implements IRecordScreenState
	{
		
		public static const fixNum:		uint=16;
		public var scoreSignal:			Signal=new Signal();
		public var pauseSignal:			Signal = new Signal();
		protected var _context:			RecordScreenStateController;
		protected var _complete:		Signal = new Signal();
		protected var _timeModel:		ITimeModel = Metronome.getTimeModel();
		private var _tween:				GTween;
		private var _msk:				Shape = new Shape();
		//private var _toPlayNotes:		Vector.<DroppingNote>;
		private var _toPlayNote:DroppingNote;
		private var _isActive:Boolean = false;
		private var _scoreMediator:		ScoreMediator;
		private var _hintArrow:			Sprite;
		private var _popUpsManager:		PopUpsManager;
		
		public function RecordState(stateController:RecordScreenStateController){
			_context = stateController;
			_msk.graphics.beginFill(0x111111,0.7);
			_msk.graphics.drawRect(0,0,Dimentions.WIDTH,Dimentions.HEIGHT);
			_scoreMediator = new ScoreMediator(this);
			_popUpsManager = new PopUpsManager(_context.guiLayer.parent.parent.parent as Presenter,_context.model.instrumentModel.thumbNail);
		}
		
		
		public function get thumbNail():String{
			return _context.thumbNail;
		}
		
		public function get isActive():Boolean
		{
			return _isActive;
		}

		public function get complete():Signal{
			return _complete;
		}
		
		public function get name():String{
			return States.RECORD;
		}
		
		public function showHint():void{
			if(!_hintArrow){
				_hintArrow = new Sprite();
				var shp:Shape = new Shape();
				shp.graphics.beginFill(0xFFFFFF,0.8);
				shp.graphics.drawRoundRect(0,0,4,_context.model.getRecordInstrumentY()-(_context.model.noteTargetsY+40),2,2);
				shp.graphics.endFill();
				_hintArrow.addChild(shp);
				var arrowHead:Shape = new Shape();
				arrowHead.graphics.beginFill(0xFFFFFF,0.8);
				arrowHead.graphics.lineTo(12,0);
				arrowHead.graphics.lineTo(6,6);
				arrowHead.graphics.lineTo(0,0);
				arrowHead.graphics.endFill();
				_hintArrow.addChild(arrowHead);
				arrowHead.y=shp.height-1;
				arrowHead.x=(shp.width-arrowHead.width)/2;
			}
			if(_toPlayNote && !Session.IMPROVISE_MODE && _context.model.instrumentModel.thumbNail!="loopee"){
				_hintArrow.x = _toPlayNote.x+_toPlayNote.width/2-_hintArrow.width/4;
				_hintArrow.y = _context.model.noteTargetsY+30;
				
				_context.guiLayer.addChild(_hintArrow)
			}
		}
		
		private function checkNotesMatch(noteId:String):void{
			if(Session.IMPROVISE_MODE){
				_tween.paused=false;
				return;
			}
			if(_toPlayNote){
				var curNote:DroppingNote = _toPlayNote;
				//if(noteId==curNote.id){
					if(_tween.paused){// do it before setting the tween to false, this happens .
						pauseSignal.dispatch(false);
					}
					if(_hintArrow&&_hintArrow.parent){
						_context.guiLayer.removeChild(_hintArrow)
					}
					
					//_toPlayNotes.splice(_toPlayNotes.indexOf(curNote),1);
					_context.notes.removeNote(curNote);
					var comp:IMusicalInstrumentComp = _context.instrumentRecorder.getCompById(noteId);
					//trace(noteId,"==",curNote.id);
					if(comp){
						scoreSignal.dispatch(curNote.location,_timeModel.currentTick,noteId==curNote.id,_context.instrumentRecorder.x+comp.x+comp.width/3);
					}else{
						scoreSignal.dispatch(curNote.location,_timeModel.currentTick,noteId==curNote.id);
					}
						//}else{
				//	scoreSignal.dispatch(-1,-1);
				//}
				_toPlayNote=null;
				_tween.paused=false;
			}
		}
		
		public function activate():void{
			_isActive = true;
			_context.recordButton.state="pressed";
			_context.playButton.state="pressed";
			_context.instrumentRecorder.notePlayed.add(checkNotesMatch);
			_context.instrumentRecorder.active = true;
			_context.recordChannelController.reset();
			_context.recordButton.clicked.add(onRecordBtn);
			_context.playButton.clicked.add(onRecordBtn);
			_context.playGlow.visible=false;
			if(_context.instrumentRecorder is TapInstrument){
				//TapInstrument(_context.instrumentRecorder).autoSetOctave(noteSequance);
			}
			_timeModel.tickSignal.add(onTimerTick);
			_context.recordChannelController.beginRecord();
			_tween = Metronome.getTimeControll().play(_context.notes.channel.notesContainer,_context.model.endAtFrame,{y:_context.model.endAtFrame*NotesChannel._notesGap});
			_tween.onComplete = onComplete;
			_context.notes.start();
			Clock.instance.play();
			_context.stageLayer.addChild(_msk);
			_scoreMediator.active=true;
			if(_context.hasBackUps){
				_context.muteBtn.visible=true;
			}
			
		}
		
		public function deActivate():void{
			_isActive = false;
			_context.instrumentRecorder.notePlayed.remove(checkNotesMatch);
			_context.instrumentRecorder.active = false;
			_timeModel.tickSignal.remove(onTimerTick);
			_context.recordChannelController.endRecord();
			_context.stopTimer();
			_context.recordButton.state="idle";
			_context.playButton.state="idle";
			_context.recordButton.clicked.remove(onRecordBtn);
			_context.playButton.clicked.remove(onRecordBtn);
			_context.notes.stop();
			Clock.instance.stop();
			_context.stageLayer.removeChild(_msk);
			if(_tween){
				_tween.onComplete = null;
			}
			if(_hintArrow&&_hintArrow.parent){
				_context.guiLayer.removeChild(_hintArrow)
			}
			
			_scoreMediator.active=false;
			_context.model.score = _scoreMediator.score;
			//Flurry.logEvent("Record Done"+_context.model.instrumentModel.thumbNail+" "+_scoreMediator.score);
			
			
		}

		private function onComplete(t:GTween):void{
			
			stop();
		}
		
		private function stop():void{
			if(!Session.IMPROVISE_MODE&&_isActive){
				FileProxy.setBestScore(_context.model.instrumentModel.thumbNail,_scoreMediator.score);
				_popUpsManager.openPopUp(_scoreMediator.score,FileProxy.getBestScore(_context.model.instrumentModel.thumbNail));
			}
			_complete.dispatch();
		}
		
		public function get view():Sprite{
			return _context.guiLayer;
		}
		
				
		public function get toPlayNote():DroppingNote{
			return _toPlayNote;
		}
		
		private function onTimerTick():void{
			_toPlayNote = (_context.channel as NotesChannel).getNextNote(fixNum,_timeModel.currentTick);
			if(_toPlayNote){
				if(_toPlayNote.location-_timeModel.currentTick > fixNum/8){
					_toPlayNote.setState(1);
				}else{
					_toPlayNote.setState(2);
				}
			}if(Session.IMPROVISE_MODE){
				if(_toPlayNote){
					_context.notes.removeNote(_toPlayNote);
					_toPlayNote=null;
				}
				return;
			}
			//for each(var curNote:DroppingNote in _toPlayNotes){
				if(_toPlayNote && _toPlayNote.location==_timeModel.currentTick){
					pauseSignal.dispatch(true);
					_tween.paused=true;
				}
			//}
		}
		
		
		private function onRecordBtn(buttonState:Boolean):void{
			stop();
		}
		
	}
}