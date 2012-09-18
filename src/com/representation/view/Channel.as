package com.representation.view {
	import com.constants.Dimentions;
	import com.gamification.INoteDisplayer;
	import com.gamification.RepresentationtypeController;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.model.sequances.INoteFetcher;
	import com.musicalInstruments.view.components.NoteView;
	import com.representation.RepresentationSizes;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	
	public class Channel extends Sprite implements INoteDisplayer
	{
		private var _instrument:	CoreInstrumentModel;
		private var _notesFetcher:	INoteFetcher;
		private var _notes:			Vector.<NoteView>;
		private var _icon:			Sprite;
		private var _notesContainer:Sprite;
		private var _notesMask:Shape;
		public var clicked:			Signal=new Signal();
		
		public function Channel(instrumeModel:CoreInstrumentModel){
			_instrument = instrumeModel;
			_notes = new Vector.<NoteView>();
			_notesFetcher = _instrument as NotesInstrumentModel;
			drawFrame();
			RepresentationtypeController.getInstane().register(this);
		}
		
		public function showData():String{
			//return (_sequance as NoteSequanceModel).toXML();
			var xml:String="";
			for each(var note:NoteView in _notes){
				xml = xml+"<note id="+note.value+" location="+note.location+" soundLength="+note.soundLength+"/>"+"\n";
			}
			return xml;
		}
		
		public function get thumbNail():String{
			return _instrument.thumbNail;
		}
		
		
		
		public function updateDisplay():void{
			for each(var noteView:NoteView in _notes){
				noteView.updateDisplay();
			}
		}
		
		public function setX(xx:int):void{
			_notesContainer.x=xx+RepresentationSizes.thumbNailWidth+RepresentationSizes.cueWidth/2;
		}
		
		public function clearNotes():void{
			while(_notes.length>0){
				var noteView:NoteView = _notes.pop();
				noteView.destroy();
				_notesContainer.removeChild(noteView);
			}
			
		}
		
		public function drawNote(noteModel:SequancedNote,noteValue:uint,noteWeight:uint,type:String,isFlatOrSharp:String):void{
			var note:NoteView = new NoteView(noteValue,noteWeight,type,noteModel.location,isFlatOrSharp);
			_notesContainer.addChild(note);
			note.x=noteModel.location*(RepresentationSizes.notesArea)/128
			_notes.push(note);
		}
		
		public function getNoteByLocation(location:uint):NoteView{
			for each(var note:NoteView in _notes){
				if(note.location==location){
					return note;
				}
			}
			return null;
		}
		
		
		private function drawFrame():void{
			_icon=new Sprite();
			_notesMask=new Shape();
			_notesMask.graphics.beginFill(0xFFFFFF)
			_notesMask.graphics.drawRect(RepresentationSizes.thumbNailWidth,0,Dimentions.WIDTH-48,RepresentationSizes.channelHeight);
			_notesMask.graphics.endFill();
			addChild(_notesMask);
			
			_notesContainer=new Sprite();
			_notesContainer.x=RepresentationSizes.thumbNailWidth;
			addChild(_notesContainer);
			_notesContainer.mask=_notesMask;
			switch(_instrument.thumbNail){
				case "bottles.png":
					_icon.addChild(AssetsManager.getAssetByName("icon_bottles.png"));
					break;
				case "bottles2.png":
					_icon.addChild(AssetsManager.getAssetByName("icon_bottles.png"));
					break;
				case "bottles3.png":
					_icon.addChild(AssetsManager.getAssetByName("icon_bottles.png"));
					break;
				case "drum.png":
					_icon.addChild(AssetsManager.getAssetByName("icon_drums.png"));
					break;
				case "bass_flash.jpg":
					_icon.addChild(AssetsManager.getAssetByName("icon_bass.png"));
					break;
				case "singer.png":
					_icon.addChild(AssetsManager.getAssetByName("icon_mic.png"));
					break;
				case "singeret.png":
					_icon.addChild(AssetsManager.getAssetByName("icon_mic.png"));
					break;
				
			}
			
			addChild(_icon);
			_icon.addEventListener(MouseEvent.CLICK,onIconClick);
			
		}
		public function set thumbNailVisible(flag:Boolean):void{
			_icon.visible=flag;
		}
		private function onIconClick(e:Event):void{
			clicked.dispatch(this);
			
		}
		
		
		
	}
}