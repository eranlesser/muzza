package com.screens.lyrics
{
	import com.constants.Dimentions;
	import com.representation.RepresentationSizes;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class LyricView extends Sprite{
		private var _tFields:Vector.<TextField>;
		public function LyricView(){
			_tFields = new Vector.<TextField>();
			init();
		}
		
		private function init():void{
			var textTrack:DisplayObject = AssetsManager.getAssetByName("text_track.png");
			textTrack.scaleY = 1.2;
			addChild(textTrack);
		}
		
		public function showLyrics(text:String,location:uint):void{
			var tField:TextField = new TextField();
			tField.defaultTextFormat = new TextFormat("Arial",16,0xFFFFFF);
			//_tField.width = Dimentions.WIDTH;
			tField.autoSize = TextFieldAutoSize.LEFT;
			tField.text = text+" ";
			addChild(tField);
			tField.x = location*8+RepresentationSizes.thumbNailWidth;
			_tFields.push(tField);
		}
		
		public function clear():void{
			while(_tFields.length>0){
				removeChild(_tFields.pop());
			}
		}
	}
}