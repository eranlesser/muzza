package com.musicalInstruments.palleta.views
{
	public class Paw extends Pallet
	{
		[Embed(source="assets/notes_sheet.png")] 
		private var _bg:Class;
		[Embed(source="assets/notes_frame.png")] 
		private var _frame:Class;
		public function Paw(data:XML)
		{
			_xml=data;
			super();
		}
		
		override protected function get bg():Class{
			return _bg;
		}
		
		override protected function get frame():Class{
			return _bg;
		}
		
		override public function get instrument():String{
			return "PAW";
		}
		
		override protected function init():void{
			super.init();
			var xx:uint=202;
			for each(var paweXml:XML in _xml.pawee){
				var pawee:Pawee = new Pawee(paweXml,height*0.60);
				addChild(pawee);
				pawee.x=xx;
				xx+=pawee.width+1;
			}
			this.scaleX=0.5;
			this.scaleY=0.5;
			this.rotation=90;
		}
	}
}
import com.gskinner.motion.GTween;
import com.musicalInstruments.palleta.Sounder;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TouchEvent;
import flash.media.SoundChannel;

class Pawee extends Sprite{
	private var _hgt:uint;
	private var _soundPlayer:Sounder;
	private var _channel:SoundChannel;
	public function Pawee(data:XML,hgt:uint){
		_soundPlayer = new Sounder(data.@noteId,data.@sound);
		init(hgt);
	}
	
	private function init(hgt:uint):void{
		this.graphics.beginFill(0x333333,0.4);
		this.graphics.drawRect(0,40,hgt*1.5,hgt);
		this.graphics.endFill();
		_hgt=hgt;
		
		this.addEventListener(TouchEvent.TOUCH_BEGIN,onClick);
		//this.addEventListener(MouseEvent.CLICK,onMouseClick);
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
		play.graphics.drawCircle(0,0,22);
		play.graphics.endFill();
		play.x=(_hgt*1.5)/2;
		play.y=_hgt/2+40+11;
		addChild(play);
		
		
		var tween:GTween = new GTween(play,1,{scaleX:3,scaleY:3,alpha:0})
		tween.onComplete=onTweenEnd;
	}
	
	private function onTweenEnd(t:GTween):void
	{
		t.onComplete=null;
		removeChild(t.target as Sprite)
	}	
	
}