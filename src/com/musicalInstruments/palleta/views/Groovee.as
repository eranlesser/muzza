package com.musicalInstruments.palleta.views
{
	import com.gskinner.motion.GTween;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.PalletModel;
	import com.musicalInstruments.view.components.SoundPlayer;
	import com.musicalInstruments.view.instrument.Instrument;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.SoundChannel;

	public class Groovee extends Instrument
	{
		
		[Embed(source="assets/clap_bg.png")] 
		private var _frame:Class;
		
		private var _rhythm:uint;
		private var _soundPlayer:SoundPlayer;
		private var _channel:SoundChannel;
		private var _on:Boolean=false;
		private var _active:Boolean=false;
		
		public function Groovee(model:CoreInstrumentModel)
		{
			_model=model as PalletModel;
			//_soundPlayer = new SoundPlayer(_model.);
			_rhythm = (model as PalletModel).rhythm;
			super(model);
			addChild(new _frame() as DisplayObject);
		}
		
		public function get active():Boolean
		{
			return _active;
		}

		public function set active(value:Boolean):void
		{
			_active = value;
		}

		
		
		protected function init():void{
			addEventListener(MouseEvent.CLICK,onClick);
		}
		
		private function onClick(e:MouseEvent):void{
			playSound();
			//playRequest.dispatch();
			if(_active){
				_on=true;
			}
		}
		
		public function onTick(tickValue:uint):void{
			if(tickValue%_rhythm==0&&tickValue>_rhythm&&_on){
				playSound();
			}
		}
		
		private function playSound():void{
			_channel=_soundPlayer.play();
			var playCircle:Sprite = new Sprite();
			playCircle.graphics.beginFill(0x038C8C,1);
			playCircle.graphics.lineStyle(2,0xAFBA99);
			playCircle.graphics.drawCircle(0,0,22);
			playCircle.graphics.endFill();
			playCircle.x=(width)/2+11;
			playCircle.y=width/2+5;
			addChild(playCircle);
			
			var tween:GTween = new GTween(playCircle,1,{scaleX:3,scaleY:3,alpha:0})
			tween.onComplete=onTweenEnd;
			notePlayed.dispatch(this);
		}
		
		private function onTweenEnd(t:GTween):void
		{
			t.onComplete=null;
			removeChild(t.target as Sprite)
		}	
	}
}