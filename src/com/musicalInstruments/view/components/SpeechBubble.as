package com.musicalInstruments.view.components
{
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import flashx.textLayout.formats.TextAlign;
	
	public class SpeechBubble extends Sprite{
		private var _textField:TextField;
		private var _speechTimer:Timer;
		public function SpeechBubble(){
			init();
		}
		
		private function init():void{
			var bubbleBg:DisplayObject=AssetsManager.getAssetByName("Bubble_talk.png");
			addChild(bubbleBg);
			bubbleBg.scaleX=-1.5;
			bubbleBg.scaleY=1.5;
			bubbleBg.x=2*bubbleBg.width;
			bubbleBg.y=0.5*bubbleBg.height
			_textField=new TextField();
			_textField.width=bubbleBg.width-48;
			_textField.multiline=true;
			_textField.wordWrap=true;
			var fmt:TextFormat = new TextFormat();
			fmt.size=36;
			fmt.align=TextAlign.CENTER;
			_textField.defaultTextFormat=fmt;
			addChild(_textField);
			_textField.x=bubbleBg.x-bubbleBg.width+48;
			_textField.y=bubbleBg.y+4;
			_textField.text="LETS GOOOO";
			_speechTimer=new Timer(1200,1);
			_speechTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onSpeechEnd);
		}
		
		private function onSpeechEnd(e:TimerEvent):void{
			this.visible=false;
		}
		
		public function setText(txt:String,permanent:Boolean):void{
			_speechTimer.reset();
			_textField.text=txt;
			this.visible=true;
			//if(!permanent){
				_speechTimer.start();
			//}
		}
		
		public function clear():void{
			_speechTimer.reset();
			this.visible=false;
		}
	}
}