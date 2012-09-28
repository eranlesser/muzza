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
		private var _speedController:SpeedController;
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
			return _channel;
		}
		
		private function init():void{
			var bg:DisplayObject=addChild(AssetsManager.getAssetByName("notes_sheet.png"));
			_notesCanvas = new Sprite();
			addChild(_notesCanvas);
			_cue = addChild(AssetsManager.getAssetByName("BLUE_NEEDLE.png"));
			addChild(_cue);
			_cue.x=950/2-80;
			addChild(AssetsManager.getAssetByName("notes_frame.png"));
			_speedController=new SpeedController();
			addChild(_speedController);
			_speedController.x=760;
			_speedController.y=30;
			
		}
	}
}
import com.view.gui.Btn;
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;

class SpeedController extends Sprite{
	private var _btn:Btn;
	public function SpeedController(){
		init();
	}
	
	private function init():void{
		addChild(AssetsManager.getAssetByName("SPEED.png"));
		var blueSlider:DisplayObject=AssetsManager.getAssetByName("SPEED_SLIDER.png");
		addChild(blueSlider);
		blueSlider.x=50;
		blueSlider.y=-250;
		var mask:DisplayObject = AssetsManager.getAssetByName("SPEED_SLIDER_mask.png");
		mask.x=50;
		mask.y=30;
		addChild(mask);
		blueSlider.mask=mask;
		_btn = new Btn("SPEED_SLIDER_button.png","SPEED_SLIDER_button.png");
		_btn.x=35;
		_btn.y=15;
		addChild(_btn);
		
	}
}