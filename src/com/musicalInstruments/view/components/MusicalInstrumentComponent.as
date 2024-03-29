package com.musicalInstruments.view.components
{
	import com.musicalInstruments.model.InstrumentComponentModel;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.view.IMusicalInstrumentComp;
	import com.view.tools.AssetsManager;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import org.osflash.signals.Signal;
	
	public class MusicalInstrumentComponent extends Sprite implements IMusicalInstrumentComp {
		
		private var _model:			InstrumentComponentModel;
		private var _idleImage:		Bitmap;
		private var _playImage:		Bitmap;
		private var _noteFetcher:	INoteFetcher;
		private var _isPressed:		Boolean=false;
		private var _startLocation:uint;
		public var tuch:			Signal=new Signal();
		public var unTuch:			Signal=new Signal();
		
		public function MusicalInstrumentComponent(model:InstrumentComponentModel,noteFetcher:INoteFetcher){
			_model = model;
			_noteFetcher = noteFetcher;
			init();
		}
		
		public function get startLocation():uint
		{
			return _startLocation;
		}

		public function set startLocation(value:uint):void
		{
			_startLocation = value;
		}

		private function init():void{
			_idleImage = AssetsManager.getBitmap(_model.image,true);
			_playImage = AssetsManager.getBitmap(_model.playImage,true);
			_idleImage.smoothing=true;
			addChild(_idleImage);
			if(_playImage){ // its a playable component (not bg etc.)
				addChild(_playImage);
				state="idle";
				
				//circ.scaleX=0.9;
				//circ.scaleY=0.9;
			}
			
			
			//addChild(_mark)
			//dev
			this.addEventListener(MouseEvent.MOUSE_DOWN,onTouch);
			this.addEventListener(MouseEvent.MOUSE_UP,onUnTouch);
			addEventListener(TouchEvent.TOUCH_BEGIN, onTouchTap);
			addEventListener(TouchEvent.TOUCH_ROLL_OVER, onTouchTap);
			addEventListener(TouchEvent.TOUCH_END, onTouchTapEnd);
			addEventListener(TouchEvent.TOUCH_ROLL_OUT, onTouchTapEnd);
		}
		
		private function onTouch(e:MouseEvent):void{
			if(_isPressed){return;}
			_isPressed=true;
			tuch.dispatch(this);
			e.updateAfterEvent();
		}
		private function onUnTouch(e:MouseEvent):void{
			_isPressed=false;
			unTuch.dispatch(this);
			state="idle";
			e.updateAfterEvent();
		}
		public function onTouchTap(e:Event):void{
			if(_isPressed){return;}
			_isPressed=true;
			tuch.dispatch(this);
			if(e is KeyboardEvent){
				(e as KeyboardEvent).updateAfterEvent();
			}else{
				(e as TouchEvent).updateAfterEvent();
			}
			
		}
		public function onTouchTapEnd(e:Event):void{
			if(!_isPressed){return;}
			_isPressed=false;
			unTuch.dispatch(this);
			state="idle";
			if(e is KeyboardEvent){
				(e as KeyboardEvent).updateAfterEvent();
			}else{
				(e as TouchEvent).updateAfterEvent();
			}
		}
		
		
		public function set state(curState:String):void{
			if(curState=="play"){
				_idleImage.visible = false;
				_playImage.visible = true;
			}else{
				_idleImage.visible = true;
				_playImage.visible = false;
			}
		}
		
		public function get clickable():Boolean{
			return _model.clickable;
		}
		
		public function get octave():int{
			return _model.octave;
		}
		
		public function get noteId():String{
			return _model.noteId;
		}
		
		public function updateDisplay():void{
		}
		
		
	}
}