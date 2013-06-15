package com.screens.recordScreenStates
{
	import com.constants.Dimentions;
	import com.constants.States;
	import com.gskinner.motion.GTween;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.instrument.TapInstrument;
	import com.representation.ChanelNotesType;
	import com.screens.mediator.ScoreMediator;
	import com.screens.view.components.Clock;
	import com.screens.view.components.notes.DroppingNote;
	import com.screens.view.components.notes.NotesChannel;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	
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
		private var _toPlayNotes:		Vector.<DroppingNote>;
		private var _isActive:Boolean = false;
		private var _scoreMediator:ScoreMediator;
		private var _hintArrow:Sprite;
		
		public function RecordState(stateController:RecordScreenStateController){
			_context = stateController;
			_msk.graphics.beginFill(0x111111,0.8);
			_msk.graphics.drawRect(0,0,Dimentions.WIDTH,Dimentions.HEIGHT);
			_scoreMediator = new ScoreMediator(this);
			_context.improviseMode.add(onImprovise);
		}
		
		private function onImprovise(val:Boolean):void{
			_scoreMediator.visible=val;
			if(val){
				if(_hintArrow&&_hintArrow.parent){
					_context.guiLayer.removeChild(_hintArrow)
				}
			}
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
			
			_hintArrow.x = _toPlayNotes[0].x+_toPlayNotes[0].width/2-_hintArrow.width/2;
			_hintArrow.y = _context.model.noteTargetsY+30;
			
			_context.guiLayer.addChild(_hintArrow)
		}
		
		private function checkNotesMatch(noteId:String):void{
			if(!_context.notes.visible){
				_tween.paused=false;
				return;
			}
			if(_toPlayNotes.length>0){
				var curNote:DroppingNote = _toPlayNotes[0];
				if(noteId==curNote.id){
					if(_tween.paused){// do it before setting the tween to false, this happens .
						pauseSignal.dispatch(false);
					}
					if(_hintArrow&&_hintArrow.parent){
						_context.guiLayer.removeChild(_hintArrow)
					}
					_tween.paused=false;
					_toPlayNotes.splice(_toPlayNotes.indexOf(curNote),1);
					_context.notes.removeNote(curNote);
					scoreSignal.dispatch(curNote.location,_timeModel.currentTick);
				}else{
					scoreSignal.dispatch(-1,-1);
				}
			}
		}
		
		public function activate():void{
			_context.recordButton.state="pressed";
			_context.instrumentRecorder.notePlayed.add(checkNotesMatch);
			_context.instrumentRecorder.active = true;
			_context.recordChannelController.reset(ChanelNotesType.TEACHER_PLAYING);
			_context.recordButton.clicked.add(onRecordBtn);
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
			_isActive = true;
		}
		
		public function deActivate():void{
			_context.instrumentRecorder.notePlayed.remove(checkNotesMatch);
			_context.instrumentRecorder.active = false;
			_timeModel.tickSignal.remove(onTimerTick);
			_context.recordChannelController.endRecord();
			_context.stopTimer();
			_context.recordButton.state="idle";
			_context.recordButton.clicked.remove(onRecordBtn);
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
			_isActive = false;
			
		}

		private function onComplete(t:GTween):void{
			stop();
		}
		
		private function stop():void{
			_complete.dispatch();
		}
		
		public function get view():Sprite{
			return _context.guiLayer;
		}
		
		private function onTimerTick():void{
			if(!_context.notes.visible){
				return;
			}
			_toPlayNotes=(_context.channel as NotesChannel).getNotesInRange(fixNum,_timeModel.currentTick);
			if(_toPlayNotes.length>0){
				_toPlayNotes[0].selected=true;
			}
			for each(var curNote:DroppingNote in _toPlayNotes){
				if(curNote.location==_timeModel.currentTick){
					pauseSignal.dispatch(true);
					_tween.paused=true;
					break;
				}
			}
		}
		
		
		private function onRecordBtn(buttonState:Boolean):void{
			stop();
		}
		
	}
}