package com.musicalInstruments.view.components {
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.model.sequances.ISequance;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.IAnimateable;
	import com.musicalInstruments.view.character.Character;
	import com.musicalInstruments.view.character.Musician;
	
	import flash.display.DisplayObject;
	
	import org.osflash.signals.Signal;
	

	public class NoteSequancePlayer{
		
		private var _currenSequance:	NoteSequanceModel;
		private var _timeModel:			ITimeModel;
		private var _noteFetcher:		INoteFetcher;
		private var _playingNote:		SequancedNote;
		public var notePlayed:			Signal;
		public var noteStopped:			Signal;
		private var _isAnimating:		Boolean=false;
		private var _isPlaying:			Boolean=false;
		private var _character:			IAnimateable;
		private var _volume:Number;
		
		public var animationStateChanged:Signal;
		public var sequenceDone:Signal;
		
		public function NoteSequancePlayer(noteFetcher:INoteFetcher, character:IAnimateable=null){
			
			_timeModel = Metronome.getTimeModel();
			_noteFetcher = noteFetcher;
			notePlayed = new Signal();
			noteStopped = new Signal();
			sequenceDone=new Signal();
			_character = character;
			animationStateChanged = new Signal();
			
		}
		
		public function getSequance(id:uint):NoteSequanceModel{
			return NotesInstrumentModel(_noteFetcher).getSequanceById(id) as NoteSequanceModel;
		}
		
		public function play(sequance:NoteSequanceModel,volume:Number):void{
			_currenSequance = sequance;
			_volume=volume;
			if(!_isPlaying){
				_timeModel.tickSignal.add(onMetronomeTick);
				_timeModel.tickSignal.add(onMetronomeUntick);
			}
			_isPlaying = true;
		}
		
		public function set paused(val:Boolean):void{
			if(val){
				_timeModel.tickSignal.remove(onMetronomeTick);
				_timeModel.tickSignal.remove(onMetronomeUntick);
			}else{
				_timeModel.tickSignal.add(onMetronomeTick);
				_timeModel.tickSignal.add(onMetronomeUntick);
			}
		}
		
		public function onClick():void{
			return //
			if(_isPlaying){
				_timeModel.tickSignal.remove(onMetronomeTick);
				_timeModel.tickSignal.remove(onMetronomeUntick);
			}else{
				_timeModel.tickSignal.add(onMetronomeTick);
				_timeModel.tickSignal.add(onMetronomeUntick);
			}
			_isPlaying=!_isPlaying;
		}
		
		public function get isAnimating():Boolean{
			return _isAnimating;
		}
		
		public function set isAnimating(flag:Boolean):void{
			_isAnimating=flag;
		}
		
		public function  stop():void{
			_timeModel.tickSignal.remove(onMetronomeTick);
			_timeModel.tickSignal.remove(onMetronomeUntick);
			_isPlaying = false;
			if(_character){
				_character.animateTo(0,"");
				_isAnimating=false;
				animationStateChanged.dispatch();
			}
			if(_playingNote){
				noteStopped.dispatch(_playingNote.noteId);
			}
			//}
		}
		
		private function animateTo(indx:uint,id:String):void{
			if(!_character){
				return;
			}
			_character.animateTo(indx,id);
			if(indx==0){
				_isAnimating = false;
				animationStateChanged.dispatch()
			}else{
				_isAnimating = true;
				animationStateChanged.dispatch()
			}
		}
		
		private function onMetronomeTick():void{
			if(_currenSequance){
				
				var notes:Vector.<SequancedNote> = _currenSequance.getNotesByLocation( _timeModel.currentTick);
				if(notes.length>0){
					_noteFetcher.octave=notes[0].octave;
					for each (var note:SequancedNote in notes){
						var noteModel:NoteModel = _noteFetcher.getNoteById(note.noteId);
						noteModel.player.play(_volume);
						_playingNote = note;
						notePlayed.dispatch(_playingNote.noteId);
						//trace("",_playingNote.noteId,"<<",_timeModel.currentTick,_currenSequance.thumbNail)
					}
					animateTo(noteModel.animationIndex,notes[0].noteId);
				}else if(_currenSequance.ended(_timeModel.currentTick)){
					//stop();
					sequenceDone.dispatch();
				}
			}else{
				//trace("sequance done",this)
				sequenceDone.dispatch();
				//stop();
			}
		}
		private function onMetronomeUntick():void{
			if(_currenSequance){
				if(_playingNote&&(_playingNote.endLoction == _timeModel.currentTick)){
					var notePlayingModel:NoteModel = _noteFetcher.getNoteById(_playingNote.noteId);
					//notePlayingModel.player.stop();
					animateTo(0,"");
					if(_playingNote){
						noteStopped.dispatch(_playingNote.noteId);
					}
				}
			}
		}
		
	}
}