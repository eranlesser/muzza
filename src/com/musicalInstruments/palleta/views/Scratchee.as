package com.musicalInstruments.palleta.views
{
	import com.musicalInstruments.palleta.Sounder;
	
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	

	public class Scratchee extends Pallet
	{
		[Embed(source="assets/notes_sheet.png")] 
		private var _bg:Class;
		[Embed(source="assets/notes_frame.png")] 
		private var _frame:Class;
		
		private var touchMoveID:int;
		private var _startPoint:Point;
		private var _angleIndex:int;
		private const UP_RIGHT:uint=0;
		private const UP_LEFT:uint=1;
		private const DOWN_RIGHT:uint=2;
		private const DOWN_LEFT:uint=3;
		private var _direction:String;
		private var _lastY:int;
		
		private var sounders:Vector.<Sounder>;
		
		public function Scratchee()
		{
			super();
			sounders = new Vector.<Sounder>();
			sounders.push(new Sounder("1a","scratch/scrach_1a.mp3"));
			sounders.push(new Sounder("1b","scratch/scrach_1b.mp3"));
			sounders.push(new Sounder("1c","scratch/scrach_1c.mp3"));
			sounders.push(new Sounder("1d","scratch/scrach_1d.mp3"));
			sounders.push(new Sounder("1e","scratch/scrach_1e.mp3"));
			sounders.push(new Sounder("9","scratch/scrach_9.mp3"));
		}
		
		override protected function get bg():Class{
			return _bg;
		}
		
		override protected function get frame():Class{
			return _bg;
		}
		
		override public function get instrument():String{
			return "SCRATCHEE";
		}
		
		override protected function init():void{
			super.init();
			this.scaleX=0.6;
			this.scaleY=0.6;
			this.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin); 
			//this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseBegin); 
			this.addEventListener(MouseEvent.CLICK,onClick);
		}
		
		private function onClick(e:MouseEvent):void{
			sounders[4].play();
		}
		
		private function getAngle (x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			return Math.atan2(dy,dx)* 180/Math.PI;
		}
		
		private function getLength(x1:Number, y1:Number, x2:Number, y2:Number):Number{
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			return Math.sqrt(  dx * dx  +  dy * dy  );
		}
		
		private function onTouchBegin(event:TouchEvent):void { 
			if(touchMoveID != 0) { 
				trace("already moving. ignoring new touch"); 
				playSound(5);
				return; 
			} 
			//touchMoveID = event.touchPointID; 
			_startPoint = new Point(event.localX,event.localY);
//			this.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove); 
//			stage.addEventListener(TouchEvent.TOUCH_END, onTouchEnd); 
			//dev
			this.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove); 
			stage.addEventListener(TouchEvent.TOUCH_END, onTouchEnd); 
		} 
		private function onMouseBegin(event:MouseEvent):void { 
			if(touchMoveID != 0) { 
				trace("already moving. ignoring new touch");     
				return; 
			} 
			//touchMoveID = event.touchPointID; 
			_startPoint = new Point(event.localX,event.localY);
//			this.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove); 
//			stage.addEventListener(TouchEvent.TOUCH_END, onTouchEnd); 
			//dev
			this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove); 
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseEnd); 
		} 
		
		private function playSound(newAngleIndex:int):void{
			trace("playing "+newAngleIndex);
			sounders[newAngleIndex].play();
		}
		private function onTouchMove(event:TouchEvent):void { 
			var angle:Number = getAngle(_startPoint.x,_startPoint.y,event.localX,event.localY);
			var length:Number = getLength(_startPoint.x,_startPoint.y,event.localX,event.localY);
			var newAngleIndex:uint;
			var direction:String;
			if(angle>-90&&angle<0){
				newAngleIndex=UP_RIGHT;
			}
			else if(angle>0&&angle<90){
				newAngleIndex=DOWN_RIGHT;
			}
			else if(angle>90&&angle<180){
				newAngleIndex=DOWN_LEFT;
			}
			else if(angle>-180&&angle<-90){
				newAngleIndex=UP_LEFT;
			}
			if(event.localY>_lastY){
				direction="down";
			}else{
				direction="up";
			}
			
			if(length>50 && _angleIndex!=newAngleIndex){
				playSound(newAngleIndex);
				_angleIndex=newAngleIndex;
			}
			
			if(direction!=_direction){
				_direction=direction;
				_startPoint = new Point(event.localX,event.localY);
			}
			
			_lastY=event.localY;
			var myTextField:String="";
			myTextField += "touch angle  " + angle+  "  " + newAngleIndex+"\n"; 
			myTextField += "touch length  " + length +"\h"; 
			myTextField += "touch direction  " + _direction +"\h"; 
			//trace(myTextField)
			var circ:LineCircle = new LineCircle();
			circ.x=event.localX;
			circ.y=event.localY;
			addChild(circ);
		} 
		private function onTouchEnd(event:TouchEvent):void { 
			//			if(event.touchPointID != touchMoveID) { 
			//				myTextField.text = "ignoring unrelated touch end"; 
			//				return; 
			//			} 
			touchMoveID = 0; 
			//			mySprite.removeEventListener(TouchEvent.TOUCH_MOVE, onTouchMove); 
			//			mySprite.removeEventListener(TouchEvent.TOUCH_END, onTouchEnd); 
			this.removeEventListener(TouchEvent.TOUCH_MOVE, onTouchMove); 
			stage.removeEventListener(TouchEvent.TOUCH_END, onTouchEnd); 
			_angleIndex=-1;
			//myTextField.text = "touch end" + event.touchPointID; 
		}
		//MOUSE
		private function onMouseMove(event:MouseEvent):void { 
			var angle:Number = getAngle(_startPoint.x,_startPoint.y,event.localX,event.localY);
			var length:Number = getLength(_startPoint.x,_startPoint.y,event.localX,event.localY);
			var newAngleIndex:uint;
			var direction:String;
			if(angle>-90&&angle<0){
				newAngleIndex=UP_RIGHT;
			}
			else if(angle>0&&angle<90){
				newAngleIndex=DOWN_RIGHT;
			}
			else if(angle>90&&angle<180){
				newAngleIndex=DOWN_LEFT;
			}
			else if(angle>-180&&angle<-90){
				newAngleIndex=UP_LEFT;
			}
			if(event.localY>_lastY){
				direction="down";
			}else{
				direction="up";
			}
			
			if(length>this.height/3 && _angleIndex!=newAngleIndex){
				playSound(newAngleIndex);
				//_angleIndex=newAngleIndex;
				_startPoint = new Point(event.localX,event.localY);
			}
			
			if(direction!=_direction){
				_direction=direction;
				_startPoint = new Point(event.localX,event.localY);
			}
			
			_lastY=event.localY;
			var myTextField:String="";
			myTextField += "touch angle  " + angle+  "  " + newAngleIndex+"\n"; 
			myTextField += "touch length  " + length +"\h"; 
			myTextField += "touch direction  " + _direction +"\h"; 
		//	trace(myTextField)
			var circ:LineCircle = new LineCircle();
			circ.x=event.localX;
			circ.y=event.localY;
			addChild(circ);
		} 
		private function onMouseEnd(event:MouseEvent):void { 
			//			if(event.touchPointID != touchMoveID) { 
			//				myTextField.text = "ignoring unrelated touch end"; 
			//				return; 
			//			} 
			touchMoveID = 0; 
			//			mySprite.removeEventListener(TouchEvent.TOUCH_MOVE, onTouchMove); 
			//			mySprite.removeEventListener(TouchEvent.TOUCH_END, onTouchEnd); 
			this.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove); 
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseEnd); 
			_angleIndex=-1;
			//myTextField.text = "touch end" + event.touchPointID; 
		}
	}
}

import com.gskinner.motion.GTween;

import flash.display.Shape;

class LineCircle extends Shape{
	public function LineCircle(){
		this.graphics.beginFill(0xFFFFFF);
		this.graphics.drawCircle(0,0,2);
		this.graphics.endFill();
		var tween:GTween=new GTween(this,0.6,{alpha:0,scaleX:4,scaleY:4});
		tween.onComplete = removeSelf;
	}
	
	private function removeSelf(t:GTween):void{
		parent.removeChild(this);
	}
}