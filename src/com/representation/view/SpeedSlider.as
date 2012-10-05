package com.representation.view {
	import com.constants.Rhythms;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class SpeedSlider extends Sprite{
		
		private var _btn:Btn;
		private var _shadow:DisplayObject;
		private var _blueSlider:DisplayObject;
		private var _mask:DisplayObject;
		private var _value:Number;
		public function SpeedSlider(){
			init();
		}
		
		private function init():void{
			var bg:DisplayObject = addChild(AssetsManager.getAssetByName("SPEED.png"));
			_blueSlider=AssetsManager.getAssetByName("SPEED_SLIDER.png");
			addChild(_blueSlider);
			_blueSlider.x=50;
			_mask = AssetsManager.getAssetByName("SPEED_SLIDER_mask.png");
			_mask.x=50;
			_mask.y=30;
			addChild(_mask);
			_blueSlider.mask=_mask;
			var contrur:DisplayObject = AssetsManager.getAssetByName("SPEED_SLIDER_contour_highlight.png");
			addChild(contrur);
			contrur.x=40;
			contrur.y=20;
			_shadow = AssetsManager.getAssetByName("BUTTON_SHADOW.png");
			addChild(_shadow);
			_shadow.x=50;
			_btn = new Btn("SPEED_SLIDER_button.png","SPEED_SLIDER_button.png");
			addChild(_btn);
			_btn.x=35;
			_btn.addEventListener(MouseEvent.MOUSE_DOWN,onBtnDown);
			setValue(1/2);
			_btn.y=_mask.height*1/2-_btn.height/2+30;
		}
		
		private function setValue(val:Number):void{
			_value=val;
			_blueSlider.y=_mask.y-(_blueSlider.height*1/2)+((val)*_mask.height);
			//_btn.y=_mask.height*_value-_btn.height/2+30;
			_shadow.y=_btn.y-3;
			_shadow.visible=(_shadow.y>_mask.y);
			Rhythms.RECORD_SPEED=1-val*3/4;
			if(stage)
			stage.frameRate=Rhythms.FRAME_RATE*Rhythms.RECORD_SPEED;
		}
		
		private function onBtnDown(e:MouseEvent):void{
			_btn.startDrag(false,new Rectangle(_btn.x,_mask.y-_btn.height/2,0,_mask.height));
			stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void{
			setValue((_btn.y-(_mask.y-_btn.height/2))/_mask.height);
		}
		
		private function onMouseUp(e:MouseEvent):void{
			removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_btn.stopDrag();
		}
		
	}
}