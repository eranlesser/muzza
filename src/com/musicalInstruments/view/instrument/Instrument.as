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
	
	import org.osflash.signals.Signal;
	


	
	public class Instrument extends Sprite implements IAnimateable{
		
		protected var _musicalComponents:	Vector.<MusicalInstrumentComponent>;
		private var _endAtFrame:			uint;
		private var _octave:				uint;
		protected var _model:				CoreInstrumentModel;
		protected var _beginAtFrame:		uint;
		protected var _recordedSequanceId:	uint;
		protected var tuch:					Signal=new Signal();
		private var unTuch:					Signal=new Signal();
		private var _sequanceDone:			Signal=new Signal();
		protected var _notePlayed:			Signal;
		private var _noteStopped:			Signal;
		private var _player:				NoteSequancePlayer;
		
		public function Instrument(model:CoreInstrumentModel){
			_notePlayed = new Signal();
			_noteStopped = new Signal();
			_musicalComponents = new Vector.<MusicalInstrumentComponent>();
			_model = model as CoreInstrumentModel;
			_player=new NoteSequancePlayer(NotesInstrumentModel(_model),this);
			addComponents(_model.components);
			
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
		
		
		
		private function getComponent(id:String):MusicalInstrumentComponent{
			for each(var component:MusicalInstrumentComponent in _musicalComponents){
				if(component.noteId == id){
					return component;
				}
			}
			return null;
		}
		
		public function play(sequanceId:uint,beginAtFrame:uint):Boolean{
			_player.play(_model.getSequanceById(sequanceId) as NoteSequanceModel);
			return false;
		}
		
		public function stop():void{
			_player.stop();
			for each(var component:MusicalInstrumentComponent in _musicalComponents){
				component.state = "idle";
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
		
		public function animateNote(noteId:String,state:String):void{
			getComponentById(noteId).state = state;
		}
		
		
		
	
		private function onTouch(comp:MusicalInstrumentComponent):void{
			var note:NoteModel = NotesInstrumentModel(_model).getNoteById(comp.noteId);
			note.player.play();
			animateNote(comp.noteId , "play");
			comp.startLocation = Metronome.getTimeModel().currentTick;
			_notePlayed.dispatch(comp.noteId);
		}
		private function onUnTouch(comp:MusicalInstrumentComponent):void{
			animateNote( comp.noteId , "idle");
			//var note:NoteModel = NotesInstrumentModel(_model).getNoteById(noteId);
			//note.player.stop();
			var soundLength:uint = (Metronome.getTimeModel().currentTick-comp.startLocation);
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
			
			_noteStopped.dispatch(comp.noteId,comp.startLocation,soundLength,_octave);
		}
		
		public function getComponentById(id:String):MusicalInstrumentComponent{
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
		
		
		
		
		
	}
}
