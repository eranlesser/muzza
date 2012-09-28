package com.musicalInstruments.view.playable {
	
	import com.musicalInstruments.Band;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.IMusicalView;
	import com.musicalInstruments.view.components.NoteSequancePlayer;
	import com.musicalInstruments.view.components.SpeechBubble;
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	// internal class accessed from playmusician to reuse character in different screens .
	
	public class Musician extends Sprite implements IMusicalView,IPerformer
	{
		private var _character:		Character;
		private var _player:		NoteSequancePlayer;
		private var _model:			NotesInstrumentModel;
		private var _eyes:			Eyes;
		private var _sequanceDone:	Signal;
		private var _speachBubble:	SpeechBubble;
		private var _done:			Boolean=false;
		public var notePlayed:		Signal;
		public var noteStopped:		Signal;
		
		public function Musician(model:CoreInstrumentModel){
			var animatedModel:NotesInstrumentModel = model as NotesInstrumentModel;
			//_character = new Character(animatedModel.spriteSheet,animatedModel.notesLength,animatedModel.width,animatedModel.height,animatedModel.bubbleX,animatedModel.bubbleY);
			_character=Band.instance.getCharacter(animatedModel);
			addBubble(animatedModel.bubbleX,animatedModel.bubbleY);
			_player = new NoteSequancePlayer(animatedModel, _character);
			_player.notePlayed.add(onNotePlayed);
			_player.noteStopped.add(onNoteStopped);
			notePlayed = new Signal();
			noteStopped = new Signal();
			_sequanceDone=new Signal();
			_model = model as NotesInstrumentModel;
			addEyes();
			 start();
		}
		
		public function start():void{
			addChildAt(_character,0);
		}
		
		public function get sequanceDone():Signal{
			return _sequanceDone;
		}
		
		
		public function get thumbnail():String{
			return _model.thumbNail;
		}
		
		public function reLayout():void{
			
		}
		
		private function onNotePlayed(noteId:String):void{
			notePlayed.dispatch(noteId);
		}
		
		private function onNoteStopped(noteId:String):void{
			noteStopped.dispatch(noteId);
		}
		
		private function addEyes():void{
			if(_model.thumbNail=="bass_flash.jpg"){
				_eyes = new Eyes(CoreInstrumentModel(_model).eyes,this);
			}else{
				_eyes = new Eyes(CoreInstrumentModel(_model).eyes);
			}
			addChild(_eyes.view);
		}
		
		public function set octave(level:uint):void{
			_model.octave=level;
		}
		
		public function get isPerforming():Boolean{
			return _player.isAnimating;
		}
		
		public function get animationStateChanged():Signal{
			return _player.animationStateChanged;
		}
		
		public function get bubble():SpeechBubble{
			return _speachBubble;
		}
		private function addBubble(bubbleX:int,bubbleY:int):void{
			_speachBubble=new SpeechBubble();
			addChild(_speachBubble);
			_speachBubble.x=bubbleX;
			_speachBubble.y=bubbleY;
			_speachBubble.visible=false;
		}
		public function get done():Boolean{
			return _done;
		}
		
		
		public function play(sequanceId:uint,beginAtFrame:uint,volume:Number=1):Boolean{
			_player.play(_model.getSequanceById(sequanceId) as NoteSequanceModel,volume);
			_player.sequenceDone.add(onSequenceDone);
			_done=false;
			return (sequanceId>0);
		}
		
		private function onSequenceDone():void{
			_done=true;
			_sequanceDone.dispatch();
		}
		
		public function stop():void{
			if(_player){
				_player.stop();
				_eyes.stop();
			}
		}
	}
}
