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
	
	import org.osflash.signals.Signal;
	

	public class NoteSequancePlayer{
		
		private var _currenSequance:	NoteSequanceModel;
		private var _timeModel:			ITimeModel;
		private var _noteFetcher:		INoteFetcher;
		private var _playingNote:		SequancedNote;
		private var _volume:			Number;
		public var notePlayed:			Signal;
		public var noteStopped:			Signal;
		private var _isAnimating:		Boolean=false;
		private var _isPlaying:			Boolean=false;
		private var _character:			IAnimateable;
		
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
		
		public function play(sequance:NoteSequanceModel,volume:Number=1):void{
			_currenSequance = sequance;
			_volume = volume;
			if(!_isPlaying){
				_timeModel.soundTick.add(onMetronomeTick);
			}
			_isPlaying = true;
		}
		
		public function onClick():void{
			if(_isPlaying){
				_timeModel.soundTick.remove(onMetronomeTick);
			}else{
				_timeModel.soundTick.add(onMetronomeTick);
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
			_timeModel.soundTick.remove(onMetronomeTick);
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
				if(_playingNote&&(_playingNote.endLoction == _timeModel.currentTick)){
					var notePlayingModel:NoteModel = _noteFetcher.getNoteById(_playingNote.noteId);
					notePlayingModel.player.stop();
					animateTo(0,"");
					if(_playingNote){
						noteStopped.dispatch(_playingNote.noteId);
					}
				}
				var note:SequancedNote = _currenSequance.getNoteByLocation( _timeModel.currentTick);
				if(note){
					_noteFetcher.octave=note.octave;
					var noteModel:NoteModel = _noteFetcher.getNoteById(note.noteId);
					noteModel.player.play(_volume);
					_playingNote = note;
					notePlayed.dispatch(_playingNote.noteId);
					animateTo(noteModel.animationIndex,note.noteId);
				}else if(_currenSequance.ended(_timeModel.currentTick)){
					stop();
					sequenceDone.dispatch();
				}
			}else{
				trace("sequance done",this)
				sequenceDone.dispatch();
				stop();
			}
		}
		
	}
}