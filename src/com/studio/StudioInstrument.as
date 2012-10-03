package com.studio
{
	import com.metronom.Metronome;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.view.IMusicalView;
	import com.musicalInstruments.view.components.MusicalInstrumentComponent;
	import com.musicalInstruments.view.character.Musician;
	import com.musicalInstruments.view.character.PlayMusician;
	import com.musicalInstruments.view.instrument.TapInstrument;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TransformGestureEvent;
	
	import org.osflash.signals.Signal;
	
	public class StudioInstrument extends Sprite
	{
		
		private var _cover:Sprite;
		private var _instrumentModel:InstrumentModel;
		private var _musicalView:IMusicalView;
		private var _swapIcon:Sprite;
		private var _musician:Musician;
		private var _instrument:TapInstrument;
		public var swapped:Signal=new Signal();
		public var sequanceDone:	Signal=new Signal();
		public static const INSTRUMENT:String="instrument";
		public static const CHARACTER:String="character";
		
		public function StudioInstrument(model:InstrumentModel)
		{
			
			_musicalView = _instrument = new TapInstrument(model.coreModel as NotesInstrumentModel);
			if((_musicalView as TapInstrument).octaveSelector){
				(_musicalView as TapInstrument).octaveSelector.enabled=true;
			}
			_instrumentModel=model;
			_musicalView.reLayout()
			addChild(_musicalView as Sprite);
			_cover = new Sprite();
			_cover.graphics.lineStyle(1,0,0.5);
			_cover.graphics.beginFill(0xFFFFFF,0.4);
			_cover.graphics.drawRect(-width/2-5,-height/2-5,width+10,height+10);
			addChild(_cover);
			_cover.visible=false;
			
			_swapIcon = new Sprite();
			_swapIcon.graphics.beginFill(0x111111);
			_swapIcon.graphics.drawRect(-10,-10,32,32);
			_swapIcon.graphics.endFill();
			addChild(_swapIcon);
			_swapIcon.x=-this.width/2;
			_swapIcon.y=-this.height/2;
			_swapIcon.addEventListener(MouseEvent.CLICK,swap);
			
		}
		
		private function swap(e:MouseEvent):void{
			swapped.dispatch();
			if(this.removeChild(_musicalView as Sprite) is TapInstrument){
				if(!_musician){
					_musician = new Musician(_instrumentModel.coreModel as NotesInstrumentModel);
					_musician.scaleX=0.6;
					_musician.scaleY=0.6;
					_musician.x=-_musician.width/2*0.6;
					_musician.y=-height/2;
					_musician.mouseEnabled=false;
					_musician.mouseChildren=false;
					_musician.sequanceDone.add(onPlayerDone);
				}
				_musicalView=_musician;
				_musician.play(99,0);
				_swapIcon.x=_musician.x;
			}else{
				if(_musicalView){
					_musicalView.stop();
					_swapIcon.x=-this.width/2;
				}
				_musicalView = _instrument;
				
			}
			addChild(_musicalView as Sprite);
			addChild(_swapIcon);
		}
		
		public function play():void{
			_musician.play(99,1);
		}
		
		public function stop():void{
			if(_musicalView == _musician){
				_musician.stop();
				swap(null);
			}
		}
		
		private function onPlayerDone():void{
			sequanceDone.dispatch();
		}
		
		private function onRotate(e:TransformGestureEvent):void{
			this.rotation += e.rotation;
		}
		
		public function getX(layoutType:uint):int{
			return _instrumentModel.getX(layoutType)+width/2;
		}
		
		public function getY(layoutType:uint):int{
			return _instrumentModel.getY(layoutType)+height/2;
		}
		public function getRotation(layoutType:uint):int{
			return _instrumentModel.getRotation(layoutType);
		}
		
		public function get viewType():String{
			if(_musicalView==_instrument){
				return INSTRUMENT;
			}else{
				return CHARACTER;
			}
		}
		
		
		public function get done():Boolean{
			return (_musician.done)
		}
		
		public function set mode(str:String):void{
			if(str=="layout"){
				_cover.visible=true;
				addEventListener(TransformGestureEvent.GESTURE_ROTATE,onRotate);
			}else{
				_cover.visible=false;
				removeEventListener(TransformGestureEvent.GESTURE_ROTATE,onRotate);
			}
		}
	}
}