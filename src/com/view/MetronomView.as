package com.view
{
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	public class MetronomView extends Sprite
	{
		private var _timeModel:ITimeModel;
		private var _sound:Sound;
		private var _active:Boolean=false;
		private var _value:uint=0;
		private var _fmt:SoundTransform;
		private var _tickView:DisplayObject;
		public function MetronomView(){
			_timeModel=Metronome.getTimeModel();
			init();
		}
		
		private function init():void{
			_tickView=AssetsManager.getBitmap("mahog_small2.png");
			var bg:Shape=new Shape();
			bg.graphics.lineStyle(1);
			bg.graphics.beginFill(0x888888);
			bg.graphics.drawRoundRect(0,0,30,30,12,12);
			bg.graphics.endFill();
			addChild(bg);
			addChild(_tickView);
			//_tickView.rotation=270;
			_tickView.x=(bg.width-_tickView.width)/2;
			//_tickView.y=_tickView.height;
			
			
			_sound=new Sound(new URLRequest("../../../assets/sounds/theme/tick.mp3"));
			_fmt=new SoundTransform(0.6);;
			_timeModel.metronomeTick.add(onTick);
		}
		
		public function set active(val:Boolean):void{
			_value=0;
			_active=val;
		}
		
		private function onTick():void{
			if(!_active){
				return;
			}
			if(_value/16==Math.round(_value/16)){
				_sound.play(0,0,_fmt);
				if(_tickView.rotation==30){
					_tickView.rotation=330;
					_tickView.x=0;
					_tickView.y=2;
				}else{
					_tickView.rotation=30;
					_tickView.x=22;
					_tickView.y=0;
				}
			}
			
			_value++;
		}
	}
}