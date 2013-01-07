package com.musicalInstruments.palleta.views
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.palleta.Ipallet;
	import com.musicalInstruments.palleta.Sounder;
	import com.musicalInstruments.view.instrument.Instrument;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.media.SoundChannel;
	
	public class TurnTable extends Instrument implements Ipallet
	{
		private var _record:Sprite;
		private var sounders:Vector.<Sounder>;
		private var _hey:Sounder;
		
		public function TurnTable(model:CoreInstrumentModel)
		{
			super(model);
			init();
		}
		
		private function init():void{
			
			sounders = new Vector.<Sounder>();
			sounders.push(new Sounder("1a","scratch/scrach_1_a.mp3"));
			sounders.push(new Sounder("1b","scratch/scrach_1_b.mp3"));
			sounders.push(new Sounder("1c","scratch/scrach_1_c.mp3"));
			sounders.push(new Sounder("1d","scratch/scrach_1_d.mp3"));
			sounders.push(new Sounder("1e","scratch/scrach_1_e.mp3"));
			sounders.push(new Sounder("1f","scratch/scrach_1_f.mp3"));
			//sounders.push(new Sounder("9","scratch/scrach_9.mp3"));
			_hey = new Sounder("hey","scratch/scrach_hey.mp3");
			_record= new Sprite();
			_record.graphics.lineStyle(1,0x111111);
			_record.graphics.beginFill(0x333333);
			_record.graphics.drawCircle(0,0,100);
			_record.graphics.endFill();
			
			var line1:Shape = getLine();
			_record.addChild(line1);
			line1.x=-100;
			var line2:Shape = getLine();
			_record.addChild(line2);
			line2.y=-100;
			line2.rotation = 90 ;
			addChild(_record);
			_record.x=50;
			_record.y=100;
			var top:Shape = new Shape();
			top.graphics.beginFill(0x333333,0);
			top.graphics.drawRect(-50,0,200,200);
			addChild(top);
			_record.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			_record.addEventListener(TouchEvent.TOUCH_BEGIN,onMouseDown);
			_record.addEventListener(MouseEvent.CLICK,onClick);
		}
		
		private function onClick(event:MouseEvent):void
		{
			if(!_wasTurning){
			_hey.play();
			}
		}
		
		private function onMouseDown(e:Event):void{
			addEventListener(MouseEvent.MOUSE_MOVE,rotate);
			stage.addEventListener(TouchEvent.TOUCH_END,onMouseUp);
			stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			_wasTurning = false;
			//playSound(5);
		}
		
		protected function onMouseUp(event:Event):void
		{
			removeEventListener(MouseEvent.MOUSE_MOVE,rotate);
			stage.removeEventListener(TouchEvent.TOUCH_END,onMouseUp);
			stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			
		}
		
		
		
		private function getLine():Shape{
			var line:Shape = new Shape();
			line.graphics.lineStyle(2,0x245364);
			line.graphics.lineTo(200,0);
			return line;
		}
		
		public function onTick(currentTick:int):void
		{
		}
		
		public function set active(value:Boolean):void
		{
		}
		
		private function playSound(newAngleIndex:int,width:uint):void{
			sounders[newAngleIndex].play();
		}
		
		private var _moveCounter:uint=0;
		private var _isPlaying:Boolean = false;
		private var _wasTurning:Boolean = false;
		private function rotate (e:MouseEvent):void{
			var soundFile:String = "1_";
			var theX:int = mouseX - _record.x;
			var theY:int = (mouseY - _record.y) * -1;
			var angle:Number = Math.atan(theY/theX)/(Math.PI/180);
			if (theX<0) {
				angle += 180;
				soundFile+="up";
			}
			if (theX>=0 && theY<0) {
				angle += 360;
				soundFile+="down";
			}
			_moveCounter++;
			if(_moveCounter>5&&!_isPlaying){
				var sounder:Sounder = sounders[Math.round(Math.random()*(sounders.length-1))]; 
				var channel:SoundChannel = sounder.play();
				_isPlaying = true;
				channel.addEventListener(Event.SOUND_COMPLETE,function soundComplete(e:Event):void{
					_isPlaying=false;
				});
				_moveCounter = 0;
				_wasTurning = true;
			}
			
			//trace(_record.rotation-((angle*-1) + 90));
			_record.rotation = (angle*-1) + 90;
			e.updateAfterEvent();
		}
		
	}
}