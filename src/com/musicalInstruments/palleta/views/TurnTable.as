package com.musicalInstruments.palleta.views
{
	import com.gskinner.motion.GTween;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.palleta.Ipallet;
	import com.musicalInstruments.palleta.Sounder;
	import com.musicalInstruments.view.instrument.Instrument;
	
	import flash.display.Shader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	
	public class TurnTable extends Instrument implements Ipallet
	{
		private var _record:Sprite;
		private var sounders:Vector.<Sounder>;
		
		public function TurnTable(model:CoreInstrumentModel)
		{
			super(model);
			init();
		}
		
		private function init():void{
			
			sounders = new Vector.<Sounder>();
			sounders.push(new Sounder("1a","scratch/scrach_1a.mp3"));
			sounders.push(new Sounder("1b","scratch/scrach_1b.mp3"));
			sounders.push(new Sounder("1c","scratch/scrach_1c.mp3"));
			sounders.push(new Sounder("1d","scratch/scrach_1d.mp3"));
			sounders.push(new Sounder("1e","scratch/scrach_1e.mp3"));
			//sounders.push(new Sounder("9","scratch/scrach_9.mp3"));
			
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
			//addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			addEventListener(TouchEvent.TOUCH_BEGIN,onMouseDown);
		}
		
		private var _downPoint:Point;
		private function onMouseDown(e:TouchEvent):void{
			_downPoint = new Point(e.localX,e.localY);
			addEventListener(TouchEvent.TOUCH_MOVE,onMouseMove);
			stage.addEventListener(TouchEvent.TOUCH_END,onMouseUp);
			//playSound(5);
		}
		
		protected function onMouseUp(event:TouchEvent):void
		{
			// TODO Auto-generated method stub
			removeEventListener(TouchEvent.TOUCH_MOVE,onMouseMove);
			stage.removeEventListener(TouchEvent.TOUCH_END,onMouseUp);
			
		}
		
		protected function onMouseMove(event:TouchEvent):void
		{
			trace(event.localY-_downPoint.y)
			if(Math.abs(event.localY-_downPoint.y)>44){
			var soundId:int=-1;
			if(event.localY-_downPoint.y > 88){
				soundId=0;
			}else if(event.localY-_downPoint.y < -88){
				soundId=1;
				
			}else if(event.localY-_downPoint.y > 44){
				soundId=2;
			}else if(event.localY-_downPoint.y < -44){
				soundId=3;
				
			}
			trace(soundId,"<<")
			if(soundId>=0){
				playSound(soundId,Math.abs(event.localY - _downPoint.y))
				new GTween(_record,0.2,{rotation:180*((event.localY - _downPoint.y)/100)});
			}
			_downPoint.x = event.localX;
			_downPoint.y = event.localY;
			}
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
		
	}
}