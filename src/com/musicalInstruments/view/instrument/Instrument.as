package com.musicalInstruments.view.instrument {
	
	import com.metronom.Metronome;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.InstrumentComponentModel;
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.IAnimateable;
	import com.musicalInstruments.view.components.MusicalInstrumentComponent;
	import com.musicalInstruments.view.components.NoteSequancePlayer;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.ui.Keyboard;
	
	import org.osflash.signals.Signal;
	


	
	public class Instrument extends Sprite implements IAnimateable{
		
		protected var _musicalComponents:	Vector.<MusicalInstrumentComponent>;
		private var _endAtFrame:			uint;
		protected var _model:				CoreInstrumentModel;
		protected var _beginAtFrame:		uint;
		protected var _recordedSequanceId:	uint;
		protected var tuch:					Signal=new Signal();
		private var unTuch:					Signal=new Signal();
		private var _sequanceDone:			Signal=new Signal();
		protected var _notePlayed:			Signal;
		protected var _noteStopped:			Signal;
		private var _player:				NoteSequancePlayer;
		
		private var _tField:TextField;
		
		public function Instrument(model:CoreInstrumentModel){
			_notePlayed = new Signal();
			_noteStopped = new Signal();
			_musicalComponents = new Vector.<MusicalInstrumentComponent>();
			_model = model as CoreInstrumentModel;
			_player=new NoteSequancePlayer(NotesInstrumentModel(_model),this);
			addEventListener(KeyboardEvent.KEY_DOWN,onKeyPressed);
			addEventListener(Event.ADDED_TO_STAGE,onAdded);
			_tField = new TextField();
			_tField.type = TextFieldType.INPUT;
			addChild(_tField);
			_tField.alpha=0;
		}
		
		private function onAdded(e:Event):void{
			
			stage.focus = _tField;
			_tField.addEventListener(FocusEvent.FOCUS_OUT,onFocusOut);
		}
		
		private function onFocusOut(e:Event):void{
			if(stage)
				stage.focus = e.target as TextField;
		}
		
		protected function onKeyPressed(e:KeyboardEvent):void{
			var compValue:int;
			var keyValue:int = getValueFromChar(e.keyCode);
			for each(var comp:MusicalInstrumentComponent in _musicalComponents){
				compValue = NotesInstrumentModel(_model).getNoteById(comp.noteId).value
				if(compValue == keyValue){
					comp.onTouchTap(e);
					addEventListener(KeyboardEvent.KEY_UP, function keyUp(event:Event):void{
						removeEventListener(KeyboardEvent.KEY_UP,  keyUp);
						comp.onTouchTapEnd(event);
					}
					);
					break;
				}
			}
			TextField(e.target).text="";
		}
		
		protected function getValueFromChar(char:int):int{
			var val:int;
			switch(char){
				case Keyboard.NUMBER_0:
					val =  0;
					break;
				case Keyboard.NUMBER_1:
					val =  1;
					break;
				case Keyboard.NUMBER_2:
					val =  2;
					break;
				case Keyboard.NUMBER_3:
					val =  3;
					break;
				case Keyboard.NUMBER_4:
					val =  4;
					break;
				case Keyboard.NUMBER_5:
					val =  5;
					break;
				case Keyboard.NUMBER_6:
					val =  6;
					break;
				case Keyboard.NUMBER_7:
					val =  7;
					break;
				case Keyboard.NUMBER_8:
					val =  8;
					break;
				case Keyboard.NUMBER_9:
					val =  9;
					break;
			}
			return val;
		}
		
		public function get sequanceDone():Signal{
			return _sequanceDone;
		}
		
		
		public function get instrumentName():String{
			return _model.thumbNail;
		}
		
		public function get notePlayed():Signal{
			return _notePlayed;
		}
		public function get noteStopped():Signal{
			return _noteStopped;
		}
		
		public function animateTo(indx:uint,id:String):void{
			for each(var component:MusicalInstrumentComponent in _musicalComponents){
				component.state = "idle";
			}
			//if(indx>0)
				//getComponent(id).state="play";
		}
		
		
		
		public function set active(flag:Boolean):void{
			if(flag && stage.focus != _tField){
				stage.focus = _tField;
				_tField.addEventListener(FocusEvent.FOCUS_OUT,onFocusOut);
			}
		}
		
		
		public function stop():void{
			_player.stop();
			for each(var component:MusicalInstrumentComponent in _musicalComponents){
				component.state = "idle";
			}
			if(stage){
				_tField.removeEventListener(FocusEvent.FOCUS_OUT,onFocusOut);
				stage.focus=null;
			}
		}
		
		
		public function setRecordable(beginAtFrame:uint,endAtFrame:uint):void{
			_beginAtFrame = beginAtFrame;
			_endAtFrame = endAtFrame;
		}
		
//		public function addRecordedSequance(sequance:IRecordableSequance,beginAtFrame:uint,endAtFrame:uint):void{
//			_model.addRecordedSequance(sequance, beginAtFrame,endAtFrame);
//		}
//		
		
//		public function animateNote(noteId:String,state:String):void{
//			getComponentById(noteId).state = state;
//		}
		
		
		
	}
}
