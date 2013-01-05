package com.screens.view.components.notes
{
	import com.constants.Dimentions;
	import com.gskinner.motion.GTween;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.representation.RepresentationSizes;
	import com.representation.view.SpeedSlider;
	import com.view.gui.ToggleBut;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class Notes extends Sprite{
		
		private var _cue:DisplayObject;
		private var _channel:NotesChannel;
		private var _notesCanvas:Sprite;
		private var _bg:Shape;
		private var _speedController:SpeedSlider;
		private var _backUpBut:ToggleBut;
		private var _notesLength:uint;
		private var _instrumentY:uint;
		public function Notes(notesLength:uint,instrumentY:uint)
		{
			_notesLength=notesLength;
			_instrumentY=instrumentY;
			init();
			this.mouseChildren=false;
			this.mouseEnabled=false;
		}
		
		public function start():void{
			_channel.start(_notesLength);
		}
		
		public function stop():void{
			_channel.stop();
		}
		public function set paused(val:Boolean):void{
			_channel.paused=val;
		}
		
		public function addChannel(model:CoreInstrumentModel):NotesChannel{
			_channel = new NotesChannel(model,new Rectangle(0,0,Dimentions.WIDTH,_instrumentY+44));
			_notesCanvas.addChild(_channel as DisplayObject);
			return _channel;
		}
		
		
		public function get backUpsBut():ToggleBut{
			return _backUpBut;
		}
		
		public function removeNote(note:DroppingNote):void{
			_channel.removeNote(note)
		}
		
		
		private function init():void{
			_bg=new Shape();
			_bg.graphics.beginFill(0x333333);
			_bg.graphics.drawRect(0,0,Dimentions.WIDTH,_instrumentY+44);
			_bg.graphics.endFill();
			_bg.alpha=0;
			_notesCanvas = new Sprite();
			_notesCanvas.addChild(_bg);
			_bg.x=0;
			addChild(_notesCanvas);
//			_cue = _notesCanvas.addChild(AssetsManager.getAssetByName("BLUE_NEEDLE.png"));
//			var frame:DisplayObject=addChild(AssetsManager.getAssetByName("notes_frame.png"));
//			_cue.x=frame.width/2-90;
//			var msk:Shape=new Shape();
//			msk.graphics.beginFill(0xFFFFFF);
//			msk.graphics.drawRect(40,0,frame.width-100,frame.height);
//			msk.graphics.endFill();
//			_speedController=new SpeedSlider();
//			addChild(_speedController);
//			_speedController.x=760;
//			_speedController.y=30;
//			_notesCanvas.addChild(msk);
//			_notesCanvas.mask=msk;
//			addChild(_cue);
//			_backUpBut = new ToggleBut("SOUND_OFF.png","SOUND_ON.png");
//			addChild(_backUpBut);
//			_backUpBut.x=860;
//			_backUpBut.y=frame.height/2-_backUpBut.height/2;
		}
		
		public function marc(value:uint,good:Boolean):void{
			_channel.marc(value,good);
		}
	}
}
