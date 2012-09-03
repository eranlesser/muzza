package com.musicalInstruments.view.components
{
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.noteflight.standingwave2.elements.AudioDescriptor;
	import com.noteflight.standingwave2.elements.IAudioSource;
	import com.noteflight.standingwave2.output.AudioPlayer;
	import com.noteflight.standingwave2.performance.AudioPerformer;
	import com.noteflight.standingwave2.performance.ListPerformance;
	import com.noteflight.standingwave2.sources.SoundSource;
	import com.view.tools.SpriteSheet;
	
	import flash.display.Sprite;

	public class NotesSequancePlayer{
		private var _sequance:ListPerformance;
		private var _volume:Number;
		private var _isPlaying:Boolean = false;
		private var _noteFetcher:		INoteFetcher;
		private var _player:AudioPlayer;
		public function NotesSequancePlayer(noteFetcher:INoteFetcher, spriteSheet:SpriteSheet, container:Sprite)
		{
			_noteFetcher = noteFetcher;
			_player = new AudioPlayer();
		}
		
		
		
		public function play(sequance:NoteSequanceModel,volume:Number=1):void{
			
			if(!_isPlaying&&sequance){
				_volume = volume;
				_sequance = new ListPerformance();
				for each(var note:SequancedNote in sequance.notes){
					var noteModel:NoteModel = _noteFetcher.getNoteById(note.noteId);
					_sequance.addSourceAt(note.location/8,new SoundSource(noteModel.sound));
				}
				_isPlaying = true;
				var source:IAudioSource = new AudioPerformer(_sequance);
				_player.play(source);
			}
		}
		
		public function get isAnimating():Boolean{
			return false;
		} 
		
		public function stop():void{
			_player.stop();
		}
	}
}