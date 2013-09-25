package com.musicalInstruments.view.instrument {
	
	import com.metronom.Metronome;
	import com.musicalInstruments.controller.OctaveSetter;
	import com.musicalInstruments.model.InstrumentComponentModel;
	import com.musicalInstruments.model.NoteModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.model.sequances.NoteSequanceModel;
	import com.musicalInstruments.view.IMusicalView;
	import com.musicalInstruments.view.components.MusicalInstrumentComponent;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;

	/**
	 * @author eranlesser
	 */
	public class TapInstrument extends Instrument implements IMusicalView {
		private var _octvSelector:OctaveSelector;
		private var _octaveController:OctaveSetter;
		private var _octave:uint;
		public function TapInstrument(model:NotesInstrumentModel) {
			super(model);
			addTapComponents(_model.components);
		}
		
		protected function addTapComponents(components:Vector.<InstrumentComponentModel>):void{
			var addSelector:Boolean=false;
			for each(var compModel:InstrumentComponentModel in components){
				var comp:MusicalInstrumentComponent;
				comp = new MusicalInstrumentComponent(compModel,_model as INoteFetcher);
				addChild(comp);
				comp.tuch.add(onTouch);
				comp.unTuch.add(onUnTouch);
				comp.x = compModel.x;
				comp.y = compModel.y;
				if(compModel.octave!=1){
					comp.visible=false;
					addSelector=true;
				}
				if(comp.clickable){
					_musicalComponents.push(comp)
				}else{
					comp.mouseChildren = false;
					comp.mouseEnabled = false;
				}
				this.mouseEnabled = false;
			}
			if(addSelector){
				addOctaveSelector();
			}
		}
		
		
		public function getComponentById(id:String):MusicalInstrumentComponent{
			for each(var comp:MusicalInstrumentComponent in _musicalComponents){
				if(comp.noteId == id){
					return comp;
				}
			}
			return null;
		}
		
		override protected function onKeyPressed(e:KeyboardEvent):void{
			var compValue:int;
			var keyValue:int = getValueFromChar(e.keyCode);
			for each(var comp:MusicalInstrumentComponent in _musicalComponents){
				compValue = NotesInstrumentModel(_model).getNoteById(comp.noteId).value
				if(compValue == keyValue && comp.octave==_octvSelector.selectedOctave){
					comp.onTouchTap(e);
					addEventListener(KeyboardEvent.KEY_UP, function keyUp(event:Event):void{
						removeEventListener(KeyboardEvent.KEY_UP,  keyUp);
						comp.onTouchTapEnd(event);
					}
					);
					break;
				}
			}
			TextField(e.target).text="";
		}
		
		
		private function animateNote(noteId:String,state:String):void{
			getComponentById(noteId).state = state;
			
		}
		private function onTouch(comp:MusicalInstrumentComponent):void{
			var note:NoteModel = NotesInstrumentModel(_model).getNoteById(comp.noteId);
			note.player.play(1);
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
			
			_noteStopped.dispatch(comp.noteId,comp.startLocation,soundLength,0);
		}
		
		private function addOctaveSelector():void{
			_octvSelector = new OctaveSelector();
			addChild(_octvSelector);
			_octvSelector.changed.add(onOctavChanged);
			layoutOctaveSelector();
			_octvSelector.octave=1;
			//_octvSelector.visible=false;
		}
		
		public function layoutOctaveSelector():void{
			_octvSelector.y=-200;
			_octvSelector.x=0//(this.width-_octvSelector.width)/2
		}
		
		public function get octaveSelector():OctaveSelector{
			return _octvSelector;
		}
		//AUTOSWAP IN PRACTICE STATE
		public function autoSetOctave(sequance:NoteSequanceModel):void{
//			if((_model as NotesInstrumentModel).octavesLength>1){
//				_octaveController=new OctaveSetter(sequance,this);
//				_octaveController.start();
//			}
		}
		//END AUTOSWAP IN PRACTICE STATE
		public function deAutoSetOctave():void{
			if(_octaveController)
				_octaveController.stop();
		}
		
		
		private function onOctavChanged():void{
			if(_octave == _octvSelector.selectedOctave){
				return;
			}
			octave=_octvSelector.selectedOctave;
			for(var i:uint=0;i<_musicalComponents.length;i++){
				_musicalComponents[i].visible=(_musicalComponents[i].octave==_octave)
			}
		}
		
		public function set octave(oct:uint):void{
			_octave=oct;
			//NotesInstrumentModel(_model).octave=oct;
			if(_octvSelector){
				_octvSelector.octave=oct;
			}
		}
		
		public function reLayout():void{
			var wdt:Number=width/2;
			var hgt:Number=height/2;
			for each(var comp:MusicalInstrumentComponent in  _musicalComponents){
				comp.x-=wdt;
				comp.y-=hgt;
			}
			if(_octvSelector){
				_octvSelector.y=-150;
				_octvSelector.x=(-_octvSelector.width)/2
			}
		}
		public function get octave():uint{
			return _octave;
		}

		
		
	}
}
import flash.display.Sprite;
import flash.events.MouseEvent;

import org.osflash.signals.Signal;

class OctaveSelector extends Sprite{
	private var _rects:Vector.<Sprite>;
	private var _enabled:Boolean=true;
	private var _selectedOctave:uint;
	public var changed:Signal=new Signal();
	public function OctaveSelector(){
		init();
		_selectedOctave=1;
	}
	
	public function set enabled(value:Boolean):void{
		_enabled=value;
	}
	
	public function get selectedOctave():uint{
		return _selectedOctave;
	}
	
	private function init():void{
		_rects=new Vector.<Sprite>();
		var rect1:Sprite=rect();
		addChild(rect1);
		var rect2:Sprite=rect();
		addChild(rect2);
		rect2.x=rect1.width;
		_rects.push(rect1);
		_rects.push(rect2);
	}
	
	private function onRectClicked(e:MouseEvent):void{
		if(!_enabled){
			return;
		}
		if(e.target.x==0){
			_selectedOctave=1;
		}else{
			_selectedOctave=2;
		}
		changed.dispatch();
	}
	
	public function rect():Sprite{
		var spr:Sprite=new Sprite();
		spr.graphics.lineStyle(1);
		spr.graphics.drawRect(0,0,40,30);
		spr.addEventListener(MouseEvent.CLICK,onRectClicked);
		return spr;
	}
	public function set octave(indx:uint):void{
		var alphaLevel:Number=1;
		if(!_enabled){
			alphaLevel=0.6;
		}
		for each(var rect:Sprite in _rects){
			rect.graphics.beginFill(0xFFFFFF,alphaLevel);
			rect.graphics.drawRect(0,0,rect.width-1,rect.height-1);
			rect.graphics.endFill();
		}
		_rects[indx-1].graphics.beginFill(0x333333,alphaLevel);
		_rects[indx-1].graphics.drawRect(0,0,_rects[indx-1].width-1,_rects[indx-1].height-1);
		_rects[indx-1].graphics.endFill();
		_selectedOctave=indx;
	}
}
