package com.messages
{
	import com.constants.Dimentions;
	import com.view.gui.PressableButton;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	
	public class AbstractMessage extends Sprite implements IMessage
	{
		private var _closeSignal:Signal;
		private var _closeButton:PressableButton;
		protected var bg:Shape;
		protected var content:Sprite;
		public function AbstractMessage(){
			_closeSignal = new Signal();
			init();
			addContent();
		}
		
		public function get closeSignal():Signal{
			return _closeSignal;
		}
		
		protected function addContent():void{
			
		}
		
		public function start():void{
			
		}
		
		
		private function init():void{
			
			this.graphics.beginFill(0xFFFFFF,0.2);
			this.graphics.drawRect(0,0,Dimentions.WIDTH,Dimentions.HEIGHT);
			bg = new Shape();
			addChild(bg);
			bgColor = 0x111111;
			bg.x = (Dimentions.WIDTH - bg.width)/2;
			bg.y = (Dimentions.HEIGHT - bg.height)/2;
			
			_closeButton = new PressableButton("close.png","close.png");
			addChild(_closeButton);
			_closeButton.x = bg.x + bg.width - _closeButton.width - 15;
			_closeButton.y = bg.y + 15;
			var clickSignal:NativeSignal = new NativeSignal(_closeButton,MouseEvent.CLICK);
			clickSignal.add(onCloseButtonClicked);
			
			content = new Sprite();
			addChild(content);
			content.x=bg.x+15;
			content.y=bg.y+15;
		}
		
		public function set bgColor(color:uint):void{
			bg.graphics.clear();
			bg.graphics.beginFill(color);
			bg.graphics.lineStyle(2,0xFFFFFF);
			bg.graphics.drawRoundRect(0,0,800,600,22,22);
		}
		
		public function set closeable(flag:Boolean):void{
			_closeButton.visible = flag;
		}
		
		private function onCloseButtonClicked(e:MouseEvent):void{
			_closeSignal.dispatch();
		}
	}
}