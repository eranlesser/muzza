package com.musicalInstruments.view.instrument
{
	import com.metronom.Metronome;
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.view.components.SoundPlayer;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	
	public class TurnTable extends Instrument
	{
		private var _vinylContainer:	Sprite;
		private var _chelo:				Sprite;
		private var _upNoteId:			String;
		private var _downNoteId:		String;
		private var _mouseDownPoint:	Point;
		private var _hey:				Sprite;
		private var _moveCounter:		uint=0;
		private var _isPlaying:			Boolean = false;
		private var _turnDirection:		int;
		
		public function TurnTable(model:NotesInstrumentModel)
		{
			super(model);
			var pole:DisplayObject = AssetsManager.getAssetByName("pole.png");
			addChild(pole);
			pole.y=130;
			if(_model.rawData.vinyl.@image.toString().length>0){
				addVinyl(_model.rawData);
			}
			if(_model.rawData.loopy.@image.toString().length>0){
				addLoop(_model.rawData);
			}
			addChelo(_model.rawData);
			if(_model.rawData.hey.@sound.toString().length>0){
				addHey(_model.rawData);
			}
		}
		
//___________________________________________________________________________________________________________		
//____________________________________________________________________________________________________LOOP
		private function addLoop(xml:XML):void{
			var loopy:Loopy;
			var vBg:DisplayObject = (AssetsManager.getAssetByName(xml.loopy.@image));
			addChild(vBg);
			
			_vinylContainer = new Sprite();
			loopy = new Loopy(AssetsManager.getAssetByName(xml.loopy.@imageTap));
			_vinylContainer.addChild(loopy);
			loopy.x=-loopy.width/2;
			loopy.y=-loopy.height/2;
			addChild(_vinylContainer);
			_vinylContainer.x = xml.loopy.@x;
			_vinylContainer.y = xml.loopy.@y;
			vBg.x = xml.loopy.@x-vBg.width/2;
			vBg.y = xml.loopy.@y-vBg.height/2;
			loopy.onPlay.add(
				function onPlay(flag:Boolean):void{
					if(flag){
						addEventListener(Event.EXIT_FRAME,turn);
					}else{
						removeEventListener(Event.EXIT_FRAME,turn);
					}
				}
			);
			
			//_vinylContainer.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
		}
		
		private function turn (e:Event):void{
			
			
			_vinylContainer.rotation = _vinylContainer.rotation + 1;
		}
		
	
		
//___________________________________________________________________________________________________________		
//____________________________________________________________________________________________________VINYL		
		
		private function addVinyl(xml:XML):void{
			var vinyl:Vinyl;
			var vBg:DisplayObject = (AssetsManager.getAssetByName(xml.vinyl.@image));
			addChild(vBg);
			
			_vinylContainer = new Sprite();
			vinyl = new Vinyl(AssetsManager.getAssetByName(xml.vinyl.@imageTap));
			_vinylContainer.addChild(vinyl);
			vinyl.x=-vinyl.width/2;
			vinyl.y=-vinyl.height/2;
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
			_chelo = new Sprite();
			addChild(_chelo);
			_chelo.x = xml.chelo.@x;
			_chelo.y = xml.chelo.@y;
			for each(var paweXml:XML in xml.chelo.children()){
				var pawee:Pawee = new Pawee(paweXml);
				_chelo.addChild(pawee);
				pawee.notePlayed.add(onNotePlayed);
				pawee.noteStopped.add(onNoteStopped);
			}
			
		}
		
		//___________________________________________________________________________________________________________		
		//____________________________________________________________________________________________________HEY		
		
		private function addHey(xml:XML):void{
			_hey = new Sprite();
			_hey.addChild(AssetsManager.getAssetByName("mic.png"));
			_hey.x = xml.hey.@x;
			_hey.y = xml.hey.@y;
			addChild(_hey);
			var heyOver:DisplayObject = AssetsManager.getAssetByName("hey.png");
			heyOver.x=150;
			heyOver.y=-heyOver.height+10;
			var soundPlayer:SoundPlayer = new SoundPlayer(xml.hey.@sound);
			_hey.addEventListener(MouseEvent.MOUSE_DOWN,function heyClicked():void{
				soundPlayer.play(1);
				if(_hey.numChildren==1){
					_hey.addChild(heyOver);
				}
				onNotePlayed(xml.hey.@noteId);
				var startTime:uint = Metronome.getTimeModel().currentTick;
				soundPlayer.soundComplete.addOnce(
					function soundDone():void{
						if(_hey.numChildren>1){
							_hey.removeChild(heyOver);
						}
						onNoteStopped(xml.hey.@noteId,startTime) 	
					}
				)
			});
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
import com.metronom.Metronome;
import com.musicalInstruments.view.components.SoundPlayer;
import com.view.gui.Btn;
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TouchEvent;
import flash.media.SoundChannel;

import org.osflash.signals.Signal;

class Pawee extends Sprite{
	private var _soundPlayer:SoundPlayer;
	private var _id:String;
	private var _upState:DisplayObject;
	private var _tapState:DisplayObject;
	public var notePlayed:Signal=new Signal();
	public var noteStopped:Signal=new Signal();
	private var _startTick:uint;
	public function Pawee(data:XML){
		_soundPlayer = new SoundPlayer(data.@sound);
		_id=data.@id;
		_upState = AssetsManager.getAssetByName(data.@image);
		_tapState = AssetsManager.getAssetByName(data.@imageTap);
		x=data.@x;
		init();
	}
	
	private function init():void{
		addChild(_upState);
		addChild(_tapState);
		_tapState.visible=false;
		
		this.addEventListener(TouchEvent.TOUCH_BEGIN,onClick);
		this.addEventListener(MouseEvent.MOUSE_DOWN,onClick);
	}
	
	private function onClick(e:Event):void{
		play();
		stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
	}
	private function play():void{
		var channel:SoundChannel = _soundPlayer.play(1);
		notePlayed.dispatch(_id);
		_startTick = Metronome.getTimeModel().currentTick;
		_upState.visible=false;
		_tapState.visible=true;
	}
	
	private function onMouseUp(e:Event):void
	{
		stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
		_upState.visible=true;
		_tapState.visible=false;
		noteStopped.dispatch(_id,_startTick);
	}	
	
	public function get id():String
	{
		return _id;
	}
	
}

class Vinyl extends Sprite{
	private var _tapImage:DisplayObject;
	public function Vinyl(tapImage:DisplayObject){
		_tapImage = tapImage;
		addChild(_tapImage)
		//_tapImage.visible = false;
	}
	
	
}


class Loopy extends Sprite{
	private var _tapImage:DisplayObject;
	private var _playBtn:Btn;
	public var onPlay:Signal = new Signal();
	private var _isPlaying:Boolean=false;
	public function Loopy(tapImage:DisplayObject){
		_tapImage = tapImage;
		addChild(_tapImage)
		//_tapImage.visible = false;
		addEventListener(MouseEvent.CLICK,onClick);
	}
	
	private function onClick(e:MouseEvent):void{
		_isPlaying=!_isPlaying;
		onPlay.dispatch(_isPlaying);
	}
	
	
	
}