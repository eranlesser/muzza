package com.musicalInstruments.view.components
{
	import com.constants.States;
	import com.gamification.INoteDisplayer;
	import com.gamification.RepresentationtypeController;
	import com.musicalInstruments.model.InstrumentComponentModel;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.representation.ChanelNotesType;
	import com.view.tools.AssetsManager;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	import org.osflash.signals.Signal;
	
	public class MusicalInstrumentComponent extends Sprite implements INoteDisplayer{
		
		private var _model:		InstrumentComponentModel;
		private var _idleImage:	Bitmap;
		private var _playImage:	Bitmap;
		private var _note:		NoteView;
		private var _noteFetcher:INoteFetcher;
		public var tuch:Signal=new Signal();
		public var unTuch:Signal=new Signal();
		private var _isPressed:Boolean=false;
		public function MusicalInstrumentComponent(model:InstrumentComponentModel,noteFetcher:INoteFetcher,showNumbers:Boolean){
			_model = model;
			_noteFetcher = noteFetcher;
			init(showNumbers);
		}
		
		private function init(showNumbers:Boolean):void{
			_idleImage = AssetsManager.getBitmap(_model.image,true);
			_playImage = AssetsManager.getBitmap(_model.playImage,true);
			_idleImage.smoothing=true;
			addChild(_idleImage);
			if(_playImage){ // its a playable component (not bg etc.)
				addChild(_playImage);
				state="idle";
				if(_noteFetcher&&_model.noteX>0&&showNumbers){
					initNote();
				}
			}
			RepresentationtypeController.getInstane().register(this);
			//dev
			this.addEventListener(MouseEvent.MOUSE_DOWN,onTouch);
			this.addEventListener(MouseEvent.MOUSE_UP,onUnTouch);
//			
//			addEventListener(TouchEvent.TOUCH_BEGIN, onTouchTap);
//			addEventListener(TouchEvent.TOUCH_OVER, onTouchTap);
//			addEventListener(TouchEvent.TOUCH_END, onTouchTapEnd);
//			addEventListener(TouchEvent.TOUCH_OUT, onTouchTapEnd);
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
			e.updateAfterEvent();
		}
		private function onTouchTap(e:TouchEvent):void{
			if(_isPressed){return;}
			_isPressed=true;
			tuch.dispatch(this);
			e.updateAfterEvent();
		}
		private function onTouchTapEnd(e:TouchEvent):void{
			_isPressed=false;
			unTuch.dispatch(this);
			e.updateAfterEvent();
		}
		
		private function initNote():void{
			_note = new NoteView(_noteFetcher.getNoteById(_model.noteId).value,1,ChanelNotesType.U_PLAYING,1);
			addChild(_note);
			_note.x = _model.noteX;
			_note.y = _model.noteY;
			_note.mouseEnabled = false;
			_note.mouseChildren = false;
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
		
		public function get noteId():uint{
			return _model.noteId;
		}
		
		public function updateDisplay():void{
			if(_note){
				_note.updateDisplay();
			}
		}
		
		
	}
}