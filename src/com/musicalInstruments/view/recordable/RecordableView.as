package com.musicalInstruments.view.recordable {
	
	import com.metronom.Metronome;
	import com.musicalInstruments.controller.recorders.IRecorder;
	import com.musicalInstruments.controller.recorders.InstrumentRecorder;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.InstrumentComponentModel;
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.model.sequances.IRecordableSequance;
	import com.musicalInstruments.model.sequances.ISequance;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.IAnimateable;
	import com.musicalInstruments.view.components.MusicalInstrumentComponent;
	import com.musicalInstruments.view.components.NoteSequancePlayer;
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;


	
	public class RecordableView extends Sprite implements IAnimateable{
		
		protected var _musicalComponents:	Vector.<MusicalInstrumentComponent>;
		private var _endAtFrame:			uint;
		private var _startTick:				uint;
		private var _octave:				uint;

		protected var _insRecorder:			IRecorder;
		protected var _model:				CoreInstrumentModel;
		protected var _beginAtFrame:		uint;
		protected var _recordedSequanceId:	uint;
		protected var tuch:					Signal=new Signal();
		private var unTuch:					Signal=new Signal();
		private var _sequanceDone:			Signal=new Signal();
		protected var _notePlayed:			Signal;
		protected var _noteStopped:			Signal;
		private var _player:				NoteSequancePlayer;
		public var added:Signal = new Signal();
		public function RecordableView(model:CoreInstrumentModel,recordedSequanceId:uint=0){
			_notePlayed = new Signal();
			_noteStopped = new Signal();
			_musicalComponents = new Vector.<MusicalInstrumentComponent>();
			_model = model as CoreInstrumentModel;
			_player=new NoteSequancePlayer(NotesInstrumentModel(_model),this);
			_recordedSequanceId = recordedSequanceId;
			addComponents(_model.components);
			
		}
		
		public function get sequanceDone():Signal{
			return _sequanceDone;
		}
		
		public function get sequance():ISequance{
			return _insRecorder.sequance;
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
		
		public function animateTo(indx:uint,id:uint):void{
			for each(var component:MusicalInstrumentComponent in _musicalComponents){
				component.state = "idle";
			}
			if(indx>0)
				getComponent(id).state="play";
		}
		
		public function set octave(oct:uint):void{
			_octave=oct;
			NotesInstrumentModel(_model).octave=oct;
		}
		
		public function get octave():uint{
			return _octave;
		}
		
		private function getComponent(id:uint):MusicalInstrumentComponent{
			for each(var component:MusicalInstrumentComponent in _musicalComponents){
				if(component.noteId == id){
					return component;
				}
			}
			return null;
		}
		
		public function play(sequanceId:uint,beginAtFrame:uint,volume:Number=1):Boolean{
			_player.play(_model.getSequanceById(sequanceId) as NoteSequanceModel,volume);
			return false;
		}
		
		public function stop():void{
			_player.stop();
			for each(var component:MusicalInstrumentComponent in _musicalComponents){
				component.state = "idle";
			}
		}
		
		public function set ableState(state:String):void{ // disabled , practice , record
			if(state){
				
			}else{
				
			}
			for each(var component:MusicalInstrumentComponent in _musicalComponents){
				//component.ableState = state;
			}
		}
		
		public function setRecordable(beginAtFrame:uint,endAtFrame:uint):void{
			_beginAtFrame = beginAtFrame;
			_endAtFrame = endAtFrame;
			addRecordButton();
		}
		
		public function addRecordedSequance(sequance:IRecordableSequance,beginAtFrame:uint,endAtFrame:uint):void{
			_model.addRecordedSequance(sequance, beginAtFrame,endAtFrame);
		}
		
		
		public function animateNote(noteId:uint,state:String):void{
			getComponentById(noteId).state = state;
		}
		
		public function beginRecord():void{
			_insRecorder.beginRecord();
		}
		
		public function endRecord():void{
			_insRecorder.endRecord();
		}
		
		protected function decorate():void{
			_insRecorder =  new InstrumentRecorder(this,_recordedSequanceId,_beginAtFrame,_endAtFrame);
			_insRecorder.added.add(onAdded);
		}
		
		protected function playNote(noteId:uint):void{
			var note:NoteModel = NotesInstrumentModel(_model).getNoteById(noteId);
			note.player.play();
			animateNote(noteId , "play");
			_startTick = Metronome.getTimeModel().currentTick;
			_notePlayed.dispatch(noteId);
		}
		
		private function unPlayNote(noteId:uint):void{
			animateNote( noteId , "idle");
			//var note:NoteModel = NotesInstrumentModel(_model).getNoteById(noteId);
			//note.player.stop();
			var soundLength:uint = (Metronome.getTimeModel().currentTick-_startTick);
			if(soundLength==0){  // in case of fast tap
				soundLength=1;
			}
			if(soundLength>4){   // in case of slow tap
				soundLength = 4;
			}
			if(soundLength==3){   // no 3 soundlength yet
				soundLength = 2;
			}
			//if(!Metronome.getTimeModel().isPreTicking){
			//}
			
			_noteStopped.dispatch(noteId,_startTick,soundLength,_octave);
		}
		
		public function getComponentById(id:uint):MusicalInstrumentComponent{
			for each(var comp:MusicalInstrumentComponent in _musicalComponents){
				if(comp.noteId == id){
					return comp;
				}
			}
			return null;
		}
		
		private function addComponents(components:Vector.<InstrumentComponentModel>):void{
			for each(var compModel:InstrumentComponentModel in components){
				var comp:MusicalInstrumentComponent;
				comp = new MusicalInstrumentComponent(compModel,_model as INoteFetcher);
				addChild(comp);
				comp.tuch.add(onTouch);
				comp.unTuch.add(onUnTouch);
				comp.x = compModel.x;
				comp.y = compModel.y;
				if(comp.clickable){
					_musicalComponents.push(comp)
				}else{
					comp.mouseChildren = false;
					comp.mouseEnabled = false;
				}
				this.mouseEnabled = false;
			}
		}
		private function onTouch(mc:MusicalInstrumentComponent):void{
			tuch.dispatch(mc);
		}
		private function onUnTouch(mc:MusicalInstrumentComponent):void{
			unPlayNote(mc.noteId);
		}
		
		private function addRecordButton():void{
			decorate();
		}
		
		private function onAdded(sequancedNote:SequancedNote):void{
			added.dispatch(sequancedNote);
		}
	}
}
