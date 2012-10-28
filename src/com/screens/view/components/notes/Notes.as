package com.screens.view.components.notes
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.representation.view.Channel;
	import com.representation.view.SpeedSlider;
	import com.view.gui.ToggleBut;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Notes extends Sprite{
		
		private var _cue:DisplayObject;
		private var _channel:INotesChannel;
		private var _notesCanvas:Sprite;
		private var _bg:DisplayObject;
		private var _speedController:SpeedSlider;
		private var _backUpBut:ToggleBut;
		public function Notes()
		{
			init();
		}
		
		public function start():void{
			
		}
		
		public function stop():void{
			
		}
		
		public function addChannel(model:CoreInstrumentModel):INotesChannel{
			_channel = new NotesChannel(model,new Rectangle(0,0,950,height));
			_notesCanvas.addChild(_channel as DisplayObject);
			NotesChannel(_channel).moved.add(onMoved);
			return _channel;
		}
		
		private function onMoved(xx:int):void{
			var newX:int=xx;
			//_bg.x=newX%680;
		}
		
		public function get backUpsBut():ToggleBut{
			return _backUpBut;
		}
		
		
		private function init():void{
			_bg=addChild(AssetsManager.getAssetByName("notes_sheet.png"));
			_bg.scaleX=2;
			_notesCanvas = new Sprite();
			_notesCanvas.addChild(_bg);
			_bg.x=0;
			_bg.y=22;
			addChild(_notesCanvas);
			_cue = _notesCanvas.addChild(AssetsManager.getAssetByName("BLUE_NEEDLE.png"));
			var frame:DisplayObject=addChild(AssetsManager.getAssetByName("notes_frame.png"));
			_cue.x=frame.width/2-90;
			var msk:Shape=new Shape();
			msk.graphics.beginFill(0xFFFFFF);
			msk.graphics.drawRect(40,0,frame.width-100,frame.height);
			msk.graphics.endFill();
			_speedController=new SpeedSlider();
			addChild(_speedController);
			_speedController.x=760;
			_speedController.y=30;
			_notesCanvas.addChild(msk);
			_notesCanvas.mask=msk;
			addChild(_cue);
			_backUpBut = new ToggleBut("SOUND_OFF.png","SOUND_ON.png");
			addChild(_backUpBut);
			_backUpBut.x=860;
			_backUpBut.y=frame.height/2-_backUpBut.height/2;
		}
	}
}
