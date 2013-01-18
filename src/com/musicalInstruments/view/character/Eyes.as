package com.musicalInstruments.view.character
{
	import com.constants.Rhythms;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.view.tools.AssetsManager;
	import com.view.tools.SpriteSheet;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	

	public class Eyes
	{
		private var _view:					Bitmap;
		private var _eyesSheet:				SpriteSheet;
		private var _blinks:				Vector.<BlinkSequance>;
		private var _isAnimating:			Boolean = false;
		private var _currentBlinkSequance:	BlinkSequance;
		private var _currentBlinkIndex:		uint;
		private var _blinkSequanceCounter:	uint=0;
		private var _performer:				IPerformer;
		
		public function Eyes(data:XML,performer:IPerformer=null){
			_eyesSheet = new SpriteSheet(AssetsManager.getBitmap(data.@swfSheet),data.@width,data.@height);
			_view = new Bitmap();
			_view.bitmapData = _eyesSheet.drawTile(0);
			_view.x = data.@x;
			_view.y = data.@y;
			if(performer){
				_performer = performer;
				_performer.animationStateChanged.add(onAnimationStateChanged);
			}
			initBlinks(XML(<blinks>{data.blink}</blinks>));
		}
		
		private function onAnimationStateChanged():void{
			_view.visible = !_performer.isPerforming;
		}
		private function initBlinks(blinks:XML):void{
			
			_blinks = new Vector.<BlinkSequance>();
			for each(var blink:XML in blinks.blink){
				_blinks.push(new BlinkSequance(blink.@start,blink.@end));
			}
		}
		
		public function start():void{
			_view.addEventListener(Event.ENTER_FRAME,animate);
		}
		
		public function stop():void{
			_isAnimating=false;
			_view.removeEventListener(Event.ENTER_FRAME,animate);
			_currentBlinkSequance = _blinks[0];
			_blinkSequanceCounter = 0;
			_view.visible = true;
			_view.bitmapData = _eyesSheet.drawTile(_currentBlinkSequance.startIndex);
		}
		
		public function get view():Bitmap{
			return _view;
		}
		private  var _delayer:uint=0;
		private function animate(e:Event):void{
			_delayer++;
			if(_delayer%6!=0){
				return;
			}
			_delayer=0;
			if(_performer&&_performer.isPerforming){//for bass only
				_view.visible = false;
				return;
			}
			if(!_isAnimating){
				var rand:Number = Math.random();
				if(rand>0.975){
					_isAnimating = true;
					_currentBlinkSequance = _blinks[_blinkSequanceCounter];
					_currentBlinkIndex = _currentBlinkSequance.startIndex;
					_blinkSequanceCounter++;
					if(_blinkSequanceCounter == _blinks.length){
						_blinkSequanceCounter = 0;
					}
				}
			}else{
				_view.visible = true;
				_view.bitmapData = _eyesSheet.drawTile(_currentBlinkIndex);
				if(_currentBlinkIndex == _currentBlinkSequance.endIndex){
					_isAnimating = false;
				}else{
					_currentBlinkIndex++;
				}
			}
		}
	}
}
class BlinkSequance{
	public var startIndex:uint;
	public var endIndex:uint;
	public function BlinkSequance(start:uint,end:uint){
		startIndex = start;
		endIndex = end;
	}
}