package com.screens.view.components
{
	import com.constants.Session;
	import com.view.gui.Btn;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import org.osflash.signals.Signal;

	public class RecordScreenButton extends Sprite{
		public var clicked:Signal=new Signal();
		private var _enabled:Boolean=true;
		private var _button:Btn;
		private var _label:TextField;
		private var _bg:Shape;
		public function RecordScreenButton(txt:String,type:String){
			createButton(txt)
			//addGui(type);
		}
		public function set enabled(flag:Boolean):void{
			if(flag){
				this.alpha=1;
			}else{
				this.alpha=0.6;
			}
		}
		
		private function onClick(e:MouseEvent):void{
			if(_enabled){
				clicked.dispatch("on");
			}
		}
		
		public function set state(stt:String):void{
			_bg.graphics.clear();
			if(stt=="on"){
				_label.setTextFormat(new TextFormat(null,null,0xFFFFFF))
				_bg.graphics.beginFill(0x888888);
				_bg.graphics.lineStyle(0.2);
			}else{
				_label.setTextFormat(new TextFormat(null,null,0x111111))
				_bg.graphics.beginFill(0xCCCCCC);
				_bg.graphics.lineStyle(2);
			}
			_bg.graphics.drawRect(0,0,70,_label.height+22); 
			_bg.graphics.endFill();
		}
		private function createButton(txt:String):void{
			var btn:Sprite = new Sprite();
			_label = new TextField();
			_label.text = txt;
			_label.multiline=true;
			_label.wordWrap=true;
			_label.x=2;
			_label.y=3;
			var fmt:TextFormat=new TextFormat("Arial",15);
			if(Session.LANGUAGE=="hebrew")
				fmt.align=TextFormatAlign.CENTER;
			_label.setTextFormat(fmt);
			_label.height=40;
			_label.width=64;
			//tFiled.autoSize = TextFieldAutoSize.CENTER;
			_bg=new Shape();
			_bg.graphics.beginFill(0xEEEEEE);
			_bg.graphics.lineStyle(0.2);
			_bg.graphics.drawRect(0,0,70,40); 
			_bg.graphics.endFill();
			btn.addChild(_bg);
			btn.addChild(_label);
			btn.addEventListener(MouseEvent.CLICK,onClick);
			addChild(btn);
		}
		private function addGui(type:String):void{
			if(type=="play"){
				_button=new Btn("play_idle.png","stop_idle.png");
			}else{
				_button=new Btn("record_idle.png","stop_idle.png");
			}
			addChild(_button);
			_button.x=2;
			_button.y=(this.height-_button.height)/2;
		}
	}
}