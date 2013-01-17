package com.screens.view.components.notes
{
	import com.gskinner.motion.GTween;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.InstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.representation.RepresentationSizes;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	public class NotesChannel extends Sprite
	{
		private var _instrumentModel:	CoreInstrumentModel;
		private var _notes:				Vector.<DroppingNote>;
		
		private var _bg:				Sprite;
		private var _notesContainer:	Sprite;
		private var _top:				Sprite;
		private var _notesMask:			Shape;
		private var _instrumentY:		uint;
		private var _pointToBasePoint:	Point;
		private var _tween:				GTween;
		private var _notesGap:Number;
		
		public function NotesChannel(model:CoreInstrumentModel,size:Rectangle,notesLength:uint){
			_instrumentModel = model;
			_notes=new Vector.<DroppingNote>();
			_instrumentY = size.height;
			drawFrame(size);
			_notesGap = 30;
		}
		
//		public function setY(yy:int):void{
//			_notesContainer.y=yy-240;//-_notesMask.width/2;
//			moved.dispatch(_notesContainer.y);
//		}
		
		public function start():void{
			this.y=0;
			
			//_tween=new GTween(_notesContainer,notesLength*8,{y:(((RepresentationSizes.notesArea)/128)*(notesLength*2))});
			//_tween.useFrames=true;
		}
		
		public function get notesContainer():Sprite{
			return _notesContainer;
		}
		
		public function stop():void{
			if(_tween)
			_tween.end();
			_notesContainer.y=0;
		}
		
		
		
		public function clearNotes():void{
			while(_notes.length>0){
				var noteView:DroppingNote = _notes.pop();
				_notesContainer.removeChild(noteView);
			}
		}
		
		public function drawNote(noteModel:SequancedNote,thumbNail:String,noteValue:uint,xx:uint):void{
			var note:DroppingNote = new DroppingNote(noteValue,noteModel.location,thumbNail,noteModel.noteId);
			_notesContainer.addChild(note);
			note.y=_instrumentY-note.location*_notesGap;
			if(xx>0){
				note.x=xx-note.width/2;
			}else{
				note.x=(noteValue-1)*_instrumentModel.notesGap+_instrumentModel.leftPad;
			}
			_notes.push(note);
			if(_pointToBasePoint){
//				_notesContainer.graphics.lineStyle(1);
//				_notesContainer.graphics.moveTo(_pointToBasePoint.x,_pointToBasePoint.y+note.height/2);
//				_notesContainer.graphics.lineTo(note.x,note.y+note.height/2);
			}
			if(noteModel.pointToNote!=""){
				_pointToBasePoint = new Point(note.x,note.y);
			}
			else{
				_pointToBasePoint=null;
			}
		}
		
		private function getPrefix(tmbNail:String):String{
			var prefix:String;
			switch(tmbNail){
				case "bottles.png":
					prefix =  "insCircle";
					break;
				case "drum.png":
					prefix =  "insCircle";
					break;
				case "bass_flash.jpg":
					prefix =  "insCircle";
					break;
				case "scratch":
					prefix =  "insRect";
					break;
				case "chelo":
					prefix =  "insRect";
					break;
				case "claps":
					prefix="insRect";
					break;
			}
			return prefix;
		}
		private var _noteTargets:Dictionary = new Dictionary();
		public function drawNoteTarget(noteValue:uint,xx:int,yy:int,yOffset:int,type:String):void{
			var circ:DisplayObject = AssetsManager.getAssetByName(getPrefix(type)+"Fill.png");
			_bg.addChild(circ);
			if(xx>0){
				circ.x=xx-circ.width/2;
			}else{
				circ.x=(noteValue-1)*_instrumentModel.notesGap+_instrumentModel.leftPad-(circ.width-DroppingNote.WIDTH)/2;
			}
			circ.y=yy+yOffset;
			var circTop:DisplayObject = AssetsManager.getAssetByName(getPrefix(type)+".png");
			_top.addChild(circTop);
			if(xx>0){
				circTop.x=xx-circTop.width/2;
			}else{
				circTop.x=(noteValue-1)*_instrumentModel.notesGap+_instrumentModel.leftPad-(circ.width-DroppingNote.WIDTH)/2;
			}
			circTop.y=yy+yOffset;
			circTop.alpha=0.5;
			_noteTargets[noteValue] = circTop;
		}
		
		public function marc(value:uint,good:Boolean):void{
			var feedBackAsset:DisplayObject;
			if(good){
				feedBackAsset = AssetsManager.getAssetByName("insCircleRight.png");
			}else{
				feedBackAsset = AssetsManager.getAssetByName("insCircleWrong.png");
			}
			var idleAsset:DisplayObject = _noteTargets[value];
			_top.addChild(feedBackAsset);
			feedBackAsset.x=idleAsset.x;
			feedBackAsset.y=idleAsset.y;
			var t:GTween = new GTween(feedBackAsset,0.5,{alpha:0});
			t.onComplete = unMarc;
		}
		
		private function unMarc(t:GTween):void{
			_top.removeChild(t.target as DisplayObject);
		}
		
		public function getNoteByLocation(location:uint):DroppingNote{
			for each(var note:DroppingNote in _notes){
				if(note.location==location){
					return note;
				}
			}
			return null;
		};
		
		public function removeNote(note:DroppingNote):void{
			_notes.splice(_notes.indexOf(note),1);
			_notesContainer.removeChild(note);
		}
		
		public function getNotesInRange(range:uint,curTick:uint):Vector.<DroppingNote>{
			var rangeNotes:Vector.<DroppingNote> = new Vector.<DroppingNote>();
			for each(var note:DroppingNote in _notes){
				if(note.location<(curTick+range)&&note.location>=curTick){
					rangeNotes.push(note);
				}
				
			}
			return rangeNotes;
		}
		
		private function drawFrame(size:Rectangle):void{
			_bg=new Sprite();
			
			_bg.graphics.beginFill(0x33CCCC,0);
			_bg.graphics.drawRect(0,0,size.width,size.height)
			addChild(_bg);
			
			_notesMask=new Shape();
			_notesMask.graphics.beginFill(0x333333)
			_notesMask.graphics.drawRect(0,30,size.width,size.height);
			_notesMask.graphics.endFill();
			addChild(_notesMask);
			
			_notesContainer=new Sprite();
//			_notesContainer.graphics.lineStyle(1);
//			_notesContainer.graphics.beginFill(0x33CCCC,0);
//			_notesContainer.graphics.drawRect(0,0,size.width,size.height)
			addChild(_notesContainer);
			_notesContainer.mask=_notesMask;
			
			_top=new Sprite();
			_top.graphics.beginFill(0x33CCCC,0);
			_top.graphics.drawRect(0,0,size.width,size.height)
			addChild(_top);
		}
	}
}