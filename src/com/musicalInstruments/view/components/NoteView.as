package com.musicalInstruments.view.components {
	import com.representation.ChanelNotesType;
	
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 * @author eranlesser
	 */
	public class NoteView extends Sprite {
		private var _soundLength:uint;
		private var _noteValue:uint;
		private var _channelType:String;
		private var _isFlatOrSharp:String;
		private var _location:uint;
		
	
		
		public function NoteView(noteValue:uint,soundLength:uint,channelType:String,loc:uint,isFlatOrSharp:String="") {
			_soundLength = soundLength;
			_noteValue = noteValue;
			_channelType = channelType;
			_isFlatOrSharp = isFlatOrSharp;
			_location=loc;
			updateDisplay();
		}
		
		public function get location():uint{
			return _location;
		}
		
		public function get value():uint{
			return _noteValue;
		}
		
		public function get soundLength():int{
			return _soundLength;
		}
		
		public function updateDisplay():void{
			while(numChildren>0){
				removeChildAt(0);
			}
			drawSymbol(_noteValue,_channelType);
		}
		
		public function destroy():void{
			while(numChildren>0){
				removeChildAt(0);
			}
		}
		
		private function drawSymbol(noteValue:uint,type:String):void{
//			var note:Bitmap ;
//			note=(AssetsManager.getBitmap("icon_"+noteValue+".png",true));
//			addChild(note);
//			note.cacheAsBitmap=true;
//			note.smoothing=true;
			var tf:TextFormat = new TextFormat( "Arial",24,0Xc2abad );
			var note:TextField = new TextField();
			//note.embedFonts        = true; // very important to set
			note.autoSize          = TextFieldAutoSize.LEFT;
			note.defaultTextFormat = tf;
			note.text              = noteValue.toString();
			addChild(note);
			//note.y=(RepresentationSizes.channelHeight -note.height)/2;
			switch(type){
				case ChanelNotesType.BAND_PLAYING:
					note.alpha=1;
					break;
				case ChanelNotesType.TEACHER_PLAYING:
					note.alpha=1;
					note.transform.colorTransform=new ColorTransform(1, 1, 1, 1, 0, 0, 200);
					note.alpha=0.6;
					break;
				case ChanelNotesType.U_PLAYING:
					
					note.alpha=0.6;
					
					//note.y+=RepresentationSizes.channelHeight;
					break;
				
			}
		}
		
		
		
		
		
	}
}

/*
private function drawNote(soundLength:uint,noteValue:uint,type:String,isFlatOrSharp:String):void{
var note:DisplayObject ;
var noteAssetName:String="note_";
switch(soundLength){
case 1:
noteAssetName = noteAssetName.concat("q");
break;
case 2:
noteAssetName = noteAssetName.concat("h");
break;
case 4:
noteAssetName = noteAssetName.concat("w");
break;
}
if(isFlatOrSharp=="flat"){
noteAssetName = noteAssetName.concat("f");
}else if(isFlatOrSharp=="sharp"){
noteAssetName = noteAssetName.concat("s");
}
note=(AssetsManager.getAssetByName(noteAssetName.concat(".png")));
addChild(note);
note.y=RepresentationSizes.channelHeight - noteValue*3 - note.height+4;
if(noteValue>4){
note.rotation=180;
note.y+=note.height;
note.x+=note.width;
}
switch(type){
case ChanelNotesType.BAND_PLAYING:
note.alpha=1;
break;
case ChanelNotesType.TEACHER_PLAYING:
note.alpha=1;
break;
case ChanelNotesType.U_PLAYING:
note.alpha=1;
note.y+=RepresentationSizes.channelHeight;
break;

}
}
private function drawVis(soundLength:uint,noteValue:uint,type:String):void{
var note:DisplayObject ;
var noteAssetName:String="vis_";
switch(soundLength){
case 1:
noteAssetName = noteAssetName.concat("1");
break;
case 2:
noteAssetName = noteAssetName.concat("2");
break;
case 4:
noteAssetName = noteAssetName.concat("4");
break;
}
note=(AssetsManager.getAssetByName(noteAssetName.concat(".png")));
addChild(note);
note.y=RepresentationSizes.channelHeight - noteValue*3 - note.height-4;
switch(type){
case ChanelNotesType.BAND_PLAYING:
note.alpha=1;
break;
case ChanelNotesType.TEACHER_PLAYING:
note.alpha=1;
break;
case ChanelNotesType.U_PLAYING:
note.alpha=1;
note.y+=RepresentationSizes.channelHeight;
break;

}
}
*/