package com.musicalInstruments.palleta.views
{
	import com.musicalInstruments.model.CoreInstrumentModel;
	import com.musicalInstruments.model.PalletModel;
	import com.musicalInstruments.palleta.Ipallet;
	import com.musicalInstruments.view.instrument.Instrument;
	
	import flash.display.DisplayObject;

	public class Paw extends Instrument implements Ipallet
	{
		[Embed(source="assets/notes_sheet_v.png")] 
		private var _bg:Class;
		public function Paw(model:CoreInstrumentModel)
		{
			
			super(model);
			init();
		}
		
		public function onTick(val:int):void{
			
		}
		public function set active(flag:Boolean):void{
			
		}
		
		private function init():void{
			var yy:uint=0;
			addChild(new _bg() as DisplayObject)
			for each(var paweXml:XML in (_model as PalletModel).data.data.children()){
				var pawee:Pawee = new Pawee(paweXml,height/3);
				addChild(pawee);
				pawee.y=yy;
				pawee.x = (width-pawee.width)/2;
				yy+=height/3;
			}
		}
	}
}
import com.gskinner.motion.GTween;
import com.musicalInstruments.palleta.Sounder;
import com.musicalInstruments.view.components.SoundPlayer;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TouchEvent;
import flash.media.SoundChannel;

class Pawee extends Sprite{
	private var _hgt:uint;
	private var _soundPlayer:SoundPlayer;
	private var _channel:SoundChannel;
	public function Pawee(data:XML,hgt:uint){
		_soundPlayer = new SoundPlayer(data.@sound);
		init(hgt);
	}
	
	private function init(hgt:uint):void{
		this.graphics.beginFill(0x000000,0);
		this.graphics.drawRect(0,0,hgt,hgt);
		this.graphics.endFill();
		_hgt=hgt;
		
		this.addEventListener(TouchEvent.TOUCH_BEGIN,onClick);
		//this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseClick);
	}
	
	private function onClick(e:TouchEvent):void{
		play()
	}
	private function onMouseClick(e:MouseEvent):void{
		play()
	}
	
	private function play():void{
		_channel=_soundPlayer.play();
		//_channel.addEventListener(Event.SOUND_COMPLETE,onSoundComplete)
		var play:Sprite = new Sprite();
		play.graphics.beginFill(0xFFFFFF,1);
		play.graphics.lineStyle(1,0xEEEEEE);
		play.graphics.drawCircle(0,0,this.width/6);
		play.graphics.endFill();
		play.x=width/2;
		play.y=height/2+4;
		addChild(play);
		
		
		var tween:GTween = new GTween(play,1,{width:width,height:width,alpha:0})
		tween.onComplete=onTweenEnd;
	}
	
	private function onTweenEnd(t:GTween):void
	{
		t.onComplete=null;
		removeChild(t.target as Sprite)
	}	
	
}