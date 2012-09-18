package com.notes
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.representation.view.Channel;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class RecordScreenNotes extends Sprite{
		
		private var _cue:DisplayObject;
		private var _channel:INotesChannel;
		public function RecordScreenNotes()
		{
			init();
		}
		
		public function start():void{
			
		}
		
		public function stop():void{
			
		}
		
		public function addChannel(model:CoreInstrumentModel):INotesChannel{
			_channel = new NotesChannel(model);
			addChild(_channel as DisplayObject);
			return _channel;
		}
		
		private function init():void{
			addChild(AssetsManager.getAssetByName("notes_sheet.png"));
			_cue = addChild(AssetsManager.getAssetByName("BLUE_NEEDLE.png"));
			addChild(_cue);
			_cue.x=100;
			addChild(AssetsManager.getAssetByName("notes_frame.png"));
		}
	}
}