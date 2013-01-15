package com.musicalInstruments.palleta.views
{
	import com.gskinner.motion.GTween;
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.NotesInstrumentModel;
	import com.musicalInstruments.model.PalletModel;
	import com.musicalInstruments.model.SequancedNote;
	import com.musicalInstruments.palleta.Ipallet;
	import com.musicalInstruments.view.components.SoundPlayer;
	import com.musicalInstruments.view.instrument.Instrument;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.SoundChannel;

	public class Groovee extends Instrument implements Ipallet
	{
		
		[Embed(source="assets/clap_bg.png")] 
		private var _frame:Class;
		
		private var _rhythm:uint;
		private var _soundPlayer:SoundPlayer;
		private var _on:Boolean=false;
		private var _active:Boolean=false;
		
		public function Groovee(model:CoreInstrumentModel)
		{
			_model=model as PalletModel;
			_soundPlayer = new SoundPlayer((_model as PalletModel).getNoteById("22").soundFile);
			_rhythm = (model as PalletModel).rhythm;
			super(model);
			addChild(new _frame() as DisplayObject);
			init();
		}
		
		public function get active():Boolean
		{
			return _active;
		}

		public function set active(value:Boolean):void
		{
			_active = value;
			if(!value){
				_on=false;
			}
		}

		
		
		private function init():void{
			addEventListener(MouseEvent.CLICK,onClick);
		}
		
		private function onClick(e:MouseEvent):void{
			playSound();
			//playRequest.dispatch();
			if(_active){
				_on=true;
			}
		}
		private var _tickValue:uint;
		public function onTick(tickValue:int):void{
			_tickValue=tickValue;
			if((tickValue+(_model as PalletModel).rhythmOffset)%_rhythm==0&&tickValue>(_rhythm+(_model as PalletModel).rhythmOffset)&&_on){
				playSound();
			}
		}
		
		private function playSound():void{
			_soundPlayer.play();
			var playCircle:Sprite = new Sprite();
			playCircle.graphics.beginFill(0xAFBA99,1);
			playCircle.graphics.lineStyle(2,0x038C8C);
			playCircle.graphics.drawCircle(0,0,22);
			playCircle.graphics.endFill();
			playCircle.x=(width)/2//-playCircle.width/2;
			playCircle.y=height/2//-playCircle.height/2;
			addChild(playCircle);
			//this.graphics.beginFill(0x333333);
			//this.graphics.drawRect(0,0,width,height);
			var tween:GTween = new GTween(playCircle,1,{width:this.width,height:this.height,alpha:0})
			tween.onComplete=onTweenEnd;
			notePlayed.dispatch(new SequancedNote("22",_tickValue,2,0));
		}
		
		private function onTweenEnd(t:GTween):void
		{
			t.onComplete=null;
			removeChild(t.target as Sprite)
		}	
	}
}