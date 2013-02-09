package com.musicalInstruments.palleta.views
{
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.view.instrument.Instrument;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	
	public class TurnTable extends Instrument
	{
		private var _vinyl:Sprite;
		private var _chelo:Sprite;
		private var _upNoteId:String;
		private var _downNoteId:String;
		private var _mouseDownPoint:Point;
		public function TurnTable(model:NotesInstrumentModel)
		{
			super(model);
			//init();
			addVinyl(_model.rawData);
			addChelo(_model.rawData)
		}
		
		private function addVinyl(xml:XML):void{
			_vinyl = new Sprite();
			var vinyl:DisplayObject = AssetsManager.getAssetByName(xml.vinyl.@image);
			_vinyl.addChild(vinyl);
			vinyl.x=-vinyl.width/2;
			vinyl.y=-vinyl.height/2;
			addChild(_vinyl);
			_vinyl.x = xml.vinyl.@x;
			_vinyl.y = xml.vinyl.@y;
			
			_upNoteId = xml.vinyl.notes.up.@noteId;
			_downNoteId = xml.vinyl.notes.down.@noteId;
			
			_vinyl.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_vinyl.addEventListener(TouchEvent.TOUCH_BEGIN,onMouseDown);
		}
		private function addChelo(xml:XML):void{
			_chelo = new Sprite();
			var cheloBg:DisplayObject = AssetsManager.getAssetByName(xml.chelo.@image);
			_chelo.addChild(cheloBg);
			addChild(_chelo);
			_chelo.x = xml.chelo.@x;
			_chelo.y = xml.chelo.@y;
			var xx:int=_chelo.x;
			for each(var paweXml:XML in xml.chelo.children()){
				var pawee:Pawee = new Pawee(paweXml,_chelo.width/3);
				addChild(pawee);
				pawee.x=xx;
				pawee.y = _chelo.y;
				xx+=_chelo.width/3;
				pawee.notePlayed.add(onNotePlayed);
				pawee.noteStopped.add(onNoteStopped);
			}
			
		}
		private  function onNotePlayed(id:String):void{
			_notePlayed.dispatch(id);
		}
		private  function onNoteStopped(id:String):void{
			_noteStopped.dispatch(id,_tick,2,0);
		}
		
//		private function init():void{
//			
//			notes = new Vector.<NoteModel>();
//			notes.push(new NoteModel(<noteModel id="1" soundFile="ode/scrach/scratch/scrach_1_a.mp3" animationIndex="1" />));
//			notes.push(new NoteModel(<noteModel id="2" soundFile="ode/scrach/scratch/scrach_1_b.mp3" animationIndex="2" />));
//			notes.push(new NoteModel(<noteModel id="3" soundFile="ode/scrach/scratch/scrach_1_c.mp3" animationIndex="3" />));
//			notes.push(new NoteModel(<noteModel id="4" soundFile="ode/scrach/scratch/scrach_1_d.mp3" animationIndex="4" />));
//			notes.push(new NoteModel(<noteModel id="5" soundFile="ode/scrach/scratch/scrach_1_e.mp3" animationIndex="5" />));
//			notes.push(new NoteModel(<noteModel id="6" soundFile="ode/scrach/scratch/scrach_1_f.mp3" animationIndex="6" />));
//			//sounders.push(new Sounder("9","scratch/scrach_9.mp3"));
//			_hey = new NoteModel(<noteModel id="7" soundFile="ode/scrach/scratch/scrach_hey.mp3" animationIndex="7" />);
//			_record= new Sprite();
//			_record.graphics.lineStyle(1,0x111111);
//			_record.graphics.beginFill(0x333333);
//			_record.graphics.drawCircle(0,0,100);
//			_record.graphics.endFill();
//			
//			var line1:Shape = getLine();
//			_record.addChild(line1);
//			line1.x=-100;
//			var line2:Shape = getLine();
//			_record.addChild(line2);
//			line2.y=-100;
//			line2.rotation = 90 ;
//			addChild(_record);
//			_record.x=50;
//			_record.y=100;
//			var top:Shape = new Shape();
//			top.graphics.beginFill(0x333333,0);
//			top.graphics.drawRect(-50,0,200,200);
//			addChild(top);
//			_record.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
//			_record.addEventListener(TouchEvent.TOUCH_BEGIN,onMouseDown);
//			_record.addEventListener(MouseEvent.CLICK,onClick);
//		}
		
		
		private function onMouseDown(e:Event):void{
			addEventListener(MouseEvent.MOUSE_MOVE,rotate);
			stage.addEventListener(TouchEvent.TOUCH_END,onMouseUp);
			stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_mouseDownPoint = new Point((e as MouseEvent).stageX,(e as MouseEvent).stageY);
			//playSound(5);
		}
		
		protected function onMouseUp(event:Event):void
		{
			removeEventListener(MouseEvent.MOUSE_MOVE,rotate);
			stage.removeEventListener(TouchEvent.TOUCH_END,onMouseUp);
			stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_isPlaying=false;
		}
		
		
		
		private function getLine():Shape{
			var line:Shape = new Shape();
			line.graphics.lineStyle(2,0x245364);
			line.graphics.lineTo(200,0);
			return line;
		}
		private var _tick:uint;
		public function onTick(currentTick:int):void
		{
			_tick = currentTick;
		}
		
		
		private function playSound(note:NoteModel):void{
			_isPlaying = true;
			note.player.play(1);
			var startTick:uint = _tick;
			_notePlayed.dispatch(note.id);
			note.player.soundComplete.addOnce(
				function onSoundComplete():void{
					noteStopped.dispatch(note.id,startTick,_tick-startTick,0);
				}
			)
		}
		
		private var _moveCounter:uint=0;
		private var _isPlaying:Boolean = false;
		private var _turnDirection:int;
		private function rotate (e:MouseEvent):void{
			var theX:int = mouseX - _vinyl.x;
			var theY:int = (mouseY - _vinyl.y) * -1;
			var angle:Number = Math.atan(theY/theX)/(Math.PI/180);
			if (theX<0) {
				angle += 180;
			}
			if (theX>=0 && theY<0) {
				angle += 360;
			}
			_moveCounter++;
			if(_moveCounter>5){
				var noteId:String = _downNoteId;
				var turnDirection:int = -1;
				if(e.stageY > _mouseDownPoint.y){
					noteId = _upNoteId;
					turnDirection = 1;
				}
				if(!_isPlaying || _turnDirection!=turnDirection){
				var note:NoteModel = NotesInstrumentModel(_model).getNoteById(noteId);
					playSound(note);
					_moveCounter = 0;
					_turnDirection = turnDirection;
				}
			}
			
			//trace(_vinyl.rotation-((angle*-1) + 90));
			_vinyl.rotation = (angle*-1) + 90;
			e.updateAfterEvent();
		}
		
	}
}
import com.gskinner.motion.GTween;
import com.musicalInstruments.view.components.SoundPlayer;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.TouchEvent;
import flash.media.SoundChannel;

import org.osflash.signals.Signal;

class Pawee extends Sprite{
	private var _wdt:uint;
	private var _soundPlayer:SoundPlayer;
	private var _id:String;
	public var notePlayed:Signal=new Signal();
	public var noteStopped:Signal=new Signal();
	public function Pawee(data:XML,wdt:uint){
		_soundPlayer = new SoundPlayer(data.@sound);
		_id=data.@id;
		init(wdt);
	}
	
	private function init(wdt:uint):void{
		this.graphics.beginFill(0x000000,0.4);
		this.graphics.drawRect(0,0,wdt,wdt);
		this.graphics.endFill();
		_wdt=wdt;
		
		this.addEventListener(TouchEvent.TOUCH_BEGIN,onClick);
		this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseClick);
	}
	
	private function onClick(e:TouchEvent):void{
		play()
	}
	private function onMouseClick(e:MouseEvent):void{
		play()
	}
	private function play():void{
		var channel:SoundChannel = _soundPlayer.play(1);
		
		//channel.addEventListener(Event.SOUND_COMPLETE,function onSoundComplete():void{
		//	channel.removeEventListener(Event.SOUND_COMPLETE,onSoundComplete)
		notePlayed.dispatch(_id);
		var play:Sprite = new Sprite();
		play.graphics.beginFill(0xFFFFFF,1);
		play.graphics.lineStyle(1,0xEEEEEE);
		play.graphics.drawCircle(0,0,this.width/6);
		play.graphics.endFill();
		play.x=width/2;
		play.y=height/2+4;
		addChild(play);
		
		
		var tween:GTween = new GTween(play,1,{width:width,height:width,alpha:0})
		tween.onComplete=onTweenEnd;
	}
	
	private function onTweenEnd(t:GTween):void
	{
		t.onComplete=null;
		removeChild(t.target as Sprite);
		noteStopped.dispatch(_id);
	}	
	
	public function get id():String
	{
		return _id;
	}
	
}