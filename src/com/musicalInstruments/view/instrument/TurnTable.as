package com.musicalInstruments.view.instrument
{
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.view.components.Pawee;
	import com.musicalInstruments.view.components.SoundPlayer;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	public class TurnTable extends Instrument
	{
		private var _vinylContainer:	Sprite;
		private var _chelo:				Chelo;
		private var _upNoteId:			String;
		private var _downNoteId:		String;
		private var _mouseDownPoint:	Point;
		private var _hey:				Sprite;
		private var _moveCounter:		uint=0;
		private var _isPlaying:			Boolean = false;
		private var _turnDirection:		int;
		private var _vinyl:Vinyl;
		
		public function TurnTable(model:NotesInstrumentModel)
		{
			super(model);
			var pole:DisplayObject = AssetsManager.getAssetByName("pole.png");
			addChild(pole);
			pole.y=130;
			if(_model.rawData.vinyl.@image.toString().length>0){
				addVinyl(_model.rawData);
			}
			addChelo(_model.rawData);
			if(_model.rawData.hey.@sound.toString().length>0){
				addHey(_model.rawData);
			}
		}
		
	
//___________________________________________________________________________________________________________		
//____________________________________________________________________________________________________VINYL		
		
		private function addVinyl(xml:XML):void{
			
			var vBg:DisplayObject = (AssetsManager.getAssetByName(xml.vinyl.@image));
			addChild(vBg);
			
			_vinylContainer = new Sprite();
			_vinyl = new Vinyl(AssetsManager.getAssetByName(xml.vinyl.@imageTap));
			_vinylContainer.addChild(_vinyl);
			_vinyl.x=-_vinyl.width/2;
			_vinyl.y=-_vinyl.height/2;
			addChild(_vinylContainer);
			_vinylContainer.x = xml.vinyl.@x;
			_vinylContainer.y = xml.vinyl.@y;
			vBg.x = xml.vinyl.@x-vBg.width/2;
			vBg.y = xml.vinyl.@y-vBg.height/2;
			_upNoteId = xml.vinyl.notes.up.@noteId;
			_downNoteId = xml.vinyl.notes.down.@noteId;
			
			_vinylContainer.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_vinylContainer.addEventListener(TouchEvent.TOUCH_BEGIN,onMouseDown);
		}
		
		private function onMouseDown(e:Event):void{
			addEventListener(MouseEvent.MOUSE_MOVE,rotate);
			stage.addEventListener(TouchEvent.TOUCH_END,onMouseUp);
			stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_mouseDownPoint = new Point((e as MouseEvent).stageX,(e as MouseEvent).stageY);
		}
		
		private function onMouseUp(event:Event):void
		{
			removeEventListener(MouseEvent.MOUSE_MOVE,rotate);
			stage.removeEventListener(TouchEvent.TOUCH_END,onMouseUp);
			stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_isPlaying=false;
		}
		
		override protected function onKeyPressed(e:KeyboardEvent):void{
			var compValue:int;
			var keyValue:int = getValueFromChar(e.keyCode);
			switch(keyValue){
				case 1:
				case 2:
				case 3:
					_chelo.playNote(keyValue)
					break;
				case 4:
					playHey();
					break;
				case 5:
					var note:NoteModel = NotesInstrumentModel(_model).getNoteById("E_5");
					_vinylContainer.rotation = _vinylContainer.rotation-60;
					playSound(note);
					break;
				case 6:
					var noteb:NoteModel = NotesInstrumentModel(_model).getNoteById("D_5");
					_vinylContainer.rotation =_vinylContainer.rotation +  60;
					playSound(noteb);
					break;
			}
			
			TextField(e.target).text="";
		}
		
		private function rotate (e:MouseEvent):void{
			var theX:int = mouseX - _vinylContainer.x;
			var theY:int = (mouseY - _vinylContainer.y) * -1;
			var angle:Number = Math.atan(theY/theX)/(Math.PI/180);
			if (theX<0) {
				angle += 180;
			}
			if (theX>=0 && theY<0) {
				angle += 360;
			}
			_moveCounter++;
			if(_moveCounter>2){
				var noteId:String = _downNoteId;
				var turnDirection:int = -1;
				if(e.stageY > _mouseDownPoint.y){
					noteId = _upNoteId;
					turnDirection = 1;
				}
				if(e.stageY == _mouseDownPoint.y){
					turnDirection = 0;
				}
				if(!_isPlaying && _turnDirection!=turnDirection){
					var note:NoteModel = NotesInstrumentModel(_model).getNoteById(noteId);
					playSound(note);
					_moveCounter = 0;
					_turnDirection = turnDirection;
					_mouseDownPoint = new Point((e as MouseEvent).stageX,(e as MouseEvent).stageY);
				}
				
			}
			_vinylContainer.rotation = (angle*-1) + 90;
			e.updateAfterEvent();
		}
		
		private function playSound(note:NoteModel):void{
			_isPlaying = true;
			note.player.play(1);
			var startTick:uint = Metronome.getTimeModel().currentTick;
			_notePlayed.dispatch(note.id);
			note.player.soundComplete.addOnce(
				function onSoundComplete():void{
					_isPlaying=false;
					_noteStopped.dispatch(note.id,startTick,Metronome.getTimeModel().currentTick-startTick,0);
				}
			)
		}
		
		//___________________________________________________________________________________________________________		
		//____________________________________________________________________________________________________CHELO		
		
		private function addChelo(xml:XML):void{
			_chelo = new Chelo(xml,onNotePlayed,onNoteStopped);
			addChild(_chelo);
			_chelo.x = xml.chelo.@x;
			_chelo.y = xml.chelo.@y;
			
		}
		
		//___________________________________________________________________________________________________________		
		//____________________________________________________________________________________________________HEY		
		
		private function addHey(xml:XML):void{
			_hey = new Sprite();
			_hey.addChild(AssetsManager.getAssetByName("mic.png"));
			_hey.x = xml.hey.@x;
			_hey.y = xml.hey.@y;
			addChild(_hey);
			_hey.addEventListener(MouseEvent.MOUSE_DOWN,playHey);
		}
		
		private function playHey(e:Event=null):void{
			var heyOver:DisplayObject = AssetsManager.getAssetByName("hey.png");
			heyOver.x=150;
			heyOver.y=-heyOver.height+10;
			var soundPlayer:SoundPlayer = new SoundPlayer(_model.rawData.hey.@sound);
			soundPlayer.play(1);
			if(_hey.numChildren==1){
				_hey.addChild(heyOver);
			}
			onNotePlayed(_model.rawData.hey.@noteId);
			var startTime:uint = Metronome.getTimeModel().currentTick;
			soundPlayer.soundComplete.addOnce(
				function soundDone():void{
					if(heyOver.parent==_hey){
						_hey.removeChild(heyOver);
					}
					onNoteStopped(_model.rawData.hey.@noteId,startTime) 	
				}
			)
		}

		
		//___________________________________________________________________________________________________________		
		//____________________________________________________________________________________________________GENERAL		
		
		private  function onNotePlayed(id:String):void{
			_notePlayed.dispatch(id);
		}
		private  function onNoteStopped(id:String,startTime:uint):void{
			_noteStopped.dispatch(id,startTime,2,0);
		}
		
		
		
	}
}
import com.musicalInstruments.view.components.IKeyPlayer;
import com.musicalInstruments.view.components.Pawee;
import com.view.gui.Btn;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;

import org.osflash.signals.Signal;


class Vinyl extends Sprite implements IKeyPlayer{
	private var _tapImage:DisplayObject;
	public function Vinyl(tapImage:DisplayObject){
		_tapImage = tapImage;
		addChild(_tapImage)
		//_tapImage.visible = false;
	}
	
	public function playNote(val:uint):void{
		
	}
	
	
}

class Chelo extends Sprite implements IKeyPlayer{
	
	function Chelo(xml:XML,onNotePlayed:Function,onNoteStopped:Function){
		for each(var paweXml:XML in xml.chelo.children()){
			var pawee:Pawee = new Pawee(paweXml);
			addChild(pawee);
			pawee.notePlayed.add(onNotePlayed);
			pawee.noteStopped.add(onNoteStopped);
		}
	}
	
	public function playNote(val:uint):void{
		for(var i:uint=0;i<this.numChildren;i++){
			var pawee:Pawee=getChildAt(i) as Pawee
			if(pawee.value==val){
				pawee.play();
				stage.addEventListener(KeyboardEvent.KEY_UP, function keyUp(event:Event):void{
					stage.removeEventListener(KeyboardEvent.KEY_UP,  keyUp);
					pawee.stop();
				});
				break;
			}
		}
	}
	
}


	
