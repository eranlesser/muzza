package com.musicalInstruments.view.character {
	
	import com.musicalInstruments.Band;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.IMusicalView;
	import com.musicalInstruments.view.components.NoteSequancePlayer;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;
	
	// internal class accessed from playmusician to reuse character in different screens .
	
	public class Musician extends Sprite implements IMusicalView,IPerformer
	{
		private var _character:		Character;
		private var _player:		NoteSequancePlayer;
		private var _model:			NotesInstrumentModel;
		private var _eyes:			Eyes;
		private var _sequanceDone:	Signal;
		private var _done:			Boolean=false;
		public var notePlayed:		Signal;
		public var noteStopped:		Signal;
		
		public function Musician(model:CoreInstrumentModel){
			var animatedModel:NotesInstrumentModel = model as NotesInstrumentModel;
			//_character = new Character(animatedModel.spriteSheet,animatedModel.notesLength,animatedModel.width,animatedModel.height,animatedModel.bubbleX,animatedModel.bubbleY);
			_character=Band.instance.getCharacter(animatedModel);
			_player = new NoteSequancePlayer(animatedModel, _character);
			_player.notePlayed.add(onNotePlayed);
			_player.noteStopped.add(onNoteStopped);
			notePlayed = new Signal();
			noteStopped = new Signal();
			_sequanceDone=new Signal();
			_model = model as NotesInstrumentModel;
			addEyes();
			 start();
			//this.addEventListener(MouseEvent.CLICK,onClick);
		}
		
		public function start():void{
			addChildAt(_character,0);
		}
		
		public function set paused(val:Boolean):void{
			_player.paused=val;
		}
		
//		private function onClick(e:MouseEvent):void{
//			_player.onClick();
//		}
		
		public function get sequanceDone():Signal{
			return _sequanceDone;
		}
		
		
		public function get thumbnail():String{
			return _model.thumbNail;
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
				addChild(_eyes.view);
			}else if(CoreInstrumentModel(_model).eyes){
				_eyes = new Eyes(CoreInstrumentModel(_model).eyes);
				addChild(_eyes.view);
			}
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
	
		
		public function get done():Boolean{
			return _done;
		}
		
		
		public function play(sequanceId:uint,beginAtFrame:uint):Boolean{
			_player.play(_model.getSequanceById(sequanceId) as NoteSequanceModel,1);
			_player.sequenceDone.add(onSequenceDone);
			if(_eyes){
				_eyes.start();
			}
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
				if(_eyes){
					_eyes.stop();
				}
			}
		}
		
		public function destroy():void{
			stop();
			if(_player){
				_player.sequenceDone.remove(onSequenceDone);
				_player.notePlayed.remove(onNotePlayed);
				_player.noteStopped.remove(onNoteStopped);
			}
		}
	}
}
