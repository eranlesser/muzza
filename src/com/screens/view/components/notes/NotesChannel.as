package com.screens.view.components.notes
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class NotesChannel extends Sprite
	{
		private var _instrumentModel:	CoreInstrumentModel;
		private var _notes:				Vector.<DroppingNote>;
		
		private var _bg:				Sprite;
		private var _notesContainer:	Sprite;
		private var _top:				Sprite;
		private var _notesMask:			Shape;
		private var _instrumentY:		uint;
		public static var _notesGap:int;
		
		public function NotesChannel(model:CoreInstrumentModel,size:Rectangle,notesLength:uint){
			_instrumentModel = model;
			_notes=new Vector.<DroppingNote>();
			_instrumentY = size.height;
			drawFrame(size);
			_notesGap = 6;
		}
		
		public function start():void{
			this.y=0;
		}
		
		public function get notesContainer():Sprite{
			return _notesContainer;
		}
		
		public function stop():void{
			_notesContainer.y=0;
		}
		
		public function clearNotes():void{
			while(_notes.length>0){
				var noteView:DroppingNote = _notes.pop();
				_notesContainer.removeChild(noteView);
			}
		}
		
		public function drawNote(noteModel:SequancedNote,thumbNail:String,noteValue:uint,xx:uint):void{
			var note:DroppingNote = new DroppingNote(noteValue,noteModel.location,thumbNail,noteModel.noteId,noteModel.mandatory);
			_notesContainer.addChild(note);
			note.y=_instrumentY-note.location*_notesGap+16.5;
			if(xx>0){
				note.x=xx-note.width/2;
			}else{
				note.x=(noteValue-1)*_instrumentModel.notesGap+_instrumentModel.leftPad-6;
			}
			_notes.push(note);
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
				case "turnTable":
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
		public function drawNoteTarget(yy:int,yOffset:int,addLine:Boolean):void{
			if(addLine){
				var lne:DisplayObject = AssetsManager.getAssetByName("line.png");
				lne.y=yy+yOffset-29; //tutorial - timing
				lne.x=-12;
				addChild(lne);
			}
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
			note.destroy();
			_notes.splice(_notes.indexOf(note),1);
			_notesContainer.removeChild(note);
		}
		
		private var _lastRangeNote:uint;
		public function getNextNote(range:uint,curTick:uint):DroppingNote{
			//var rangeNotes:Vector.<DroppingNote> = new Vector.<DroppingNote>();
			for(var i:uint=_lastRangeNote;i<_notes.length;i++){
				var note:DroppingNote = _notes[i];
				if(note.location<(curTick+range)&&note.location>=curTick-range){
					_lastRangeNote=i;
					return (note);
				}
				
			}
			return null;
		}
		
		private function drawFrame(size:Rectangle):void{
			_bg=new Sprite();
			
			_bg.graphics.beginFill(0x33CCCC,0);
			_bg.graphics.drawRect(0,0,size.width,size.height+8)
			addChild(_bg);
			
			_notesMask=new Shape();
			_notesMask.graphics.beginFill(0x333333)
			_notesMask.graphics.drawRect(0,120,size.width,size.height+15);
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