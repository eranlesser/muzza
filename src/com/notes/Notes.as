package com.notes
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.representation.view.Channel;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class Notes extends Sprite{
		
		private var _cue:DisplayObject;
		private var _channel:INotesChannel;
		private var _notesCanvas:Sprite;
		public function Notes()
		{
			init();
		}
		
		public function start():void{
			
		}
		
		public function stop():void{
			
		}
		
		public function addChannel(model:CoreInstrumentModel):INotesChannel{
			_channel = new NotesChannel(model,new Rectangle(0,0,width,height));
			_notesCanvas.addChild(_channel as DisplayObject);
			return _channel;
		}
		
		private function init():void{
			var bg:DisplayObject=addChild(AssetsManager.getAssetByName("notes_sheet.png"));
			_notesCanvas = new Sprite();
			addChild(_notesCanvas);
			_cue = addChild(AssetsManager.getAssetByName("BLUE_NEEDLE.png"));
			addChild(_cue);
			_cue.x=width/2-_cue.width/2;
			addChild(AssetsManager.getAssetByName("notes_frame.png"));
		}
	}
}