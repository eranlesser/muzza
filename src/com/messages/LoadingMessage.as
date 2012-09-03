package com.messages
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class LoadingMessage extends AbstractMessage
	{
		public function LoadingMessage()
		{
			super();
			init();
		}
		
		private function init():void{
			super.bgColor = 0xFFFFFF;
			super.bg.alpha=0.5;
			super.closeable = false;
			addText();
		}
		
		private function addText():void{
			var txt:TextField = new TextField();
			txt.text = "LOADING";
			txt.autoSize = TextFieldAutoSize.CENTER;
			txt.y = bg.y + (bg.height-txt.height)/2;
			txt.x = bg.x + (bg.width-txt.width)/2;
			txt.setTextFormat( new TextFormat(null,32,0x444444));
			addChild(txt);
		}
	}
}