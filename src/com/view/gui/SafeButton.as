package com.view.gui
{
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;
	
	public class SafeButton extends Sprite{
		
		private var _icon:			DisplayObject;
		private var _safetyLine:SafetyLine;
		private var _progressBar:	Sprite;
		private var _progress:		uint=0;
		private var _isPressed:		Boolean=false;
		private var _framesCounter:	uint=0;
		private var _safetyFrames:	uint=50;
		private var _width:			uint = 120;
		private var _pressComplete:	Signal = new Signal();
		private var _isPressComplete:Boolean;
		
		public function SafeButton(icon:DisplayObject){
			_icon = icon;
			_width = _icon.width+_icon.width/6;
			init();
		}
		
		private function init():void{
			var bg:Shape = new Shape();
			bg.graphics.beginFill(0xFFFFFF);
			bg.graphics.lineStyle(1,0x999999);
			bg.graphics.drawRoundRect(0,0,_width,_width+_width/12,12,12);
			addChild(bg);
			addChild(_icon);
			_icon.x = _width/12;
			_icon.y = _width/6;
			_safetyLine = new SafetyLine(_width);
			addChild(_safetyLine);
			enable();
			
			
		}
		
		public function reset():void{
			if(_pressComplete){
				enable();
			}
		}
		
		public function get pressComplete():Signal{
			return _pressComplete;
		}
		
		private function onTouchTap(event:TouchEvent):void { 
			activate();

		}
		private function onTouchTapEnd(event:TouchEvent):void { 
			deActivate();
		}
		
		private function onMouseDown(event:MouseEvent):void { 
			activate();
			//_pressComplete.dispatch();
		}
		
		private function onMouseUp(event:MouseEvent):void { 
			deActivate()
		}
		
		private function onEnterFrame(e:Event):void{
			_framesCounter++;
			if(_framesCounter==_safetyFrames){
				setCompleteState();
				
			}
			_safetyLine.value = _framesCounter/_safetyFrames;
			
		}
		
		private function disable():void{
			removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			//removeEventListener(TouchEvent.TOUCH_BEGIN, onTouchTap);
			//removeEventListener(TouchEvent.TOUCH_END, onTouchTapEnd);
			
			
			//DEV
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_isPressComplete = true;
		}
		
		private function enable():void{
			//addEventListener(TouchEvent.TOUCH_BEGIN, onTouchTap);
			//addEventListener(TouchEvent.TOUCH_END, onTouchTapEnd);
			
			
			//DEV
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_isPressComplete = false;
			_framesCounter = 0;
			_safetyLine.reset();
		}
		
		private function setCompleteState():void{
			_pressComplete.dispatch();
			disable();
		}
		
		
		private function deActivate():void{
			_framesCounter=0;
			removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			_safetyLine.reset();
		}
		
		private function activate():void{
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		
		
	}
}
import flash.display.Shape;
import flash.display.Sprite;

class SafetyLine extends Sprite{
	
	private var _line:Shape;
	private var _overLine:Shape;
	private var _endDot:Shape;
	private var _width:uint;
	
	public function SafetyLine(width:uint){
		_width = width;
		init();	
		reset();
	}
	
	public function reset():void{
		value=0;
	}
	
	private function init():void{
		var gap:uint = _width/10;
		
		_line = new Shape();
		_line.graphics.beginFill(0x999999);
		_line.graphics.drawRoundRect(0,0,_width-gap*2,gap,4,4);
		_line.graphics.endFill();
		addChild(_line);
		
		_overLine = new Shape();
		_overLine.graphics.beginFill(0X74C0CF);
		_overLine.graphics.drawRoundRect(0,0,_width-gap*2,gap,4,4);
		_overLine.graphics.endFill();
		addChild(_overLine);
		
		_line.x=gap;
		_line.y=(gap)/2;
		_overLine.x=gap;
		_overLine.y=gap/2;
		
	}
	
	public function set value(val:Number):void{
		_overLine.width=val*_line.width;
	}
	
	
}