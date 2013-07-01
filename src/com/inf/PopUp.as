package com.inf
{
	import com.gskinner.motion.GTween;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import org.osflash.signals.Signal;
	
	
	public class PopUp extends Sprite
	{
		private var _thumbNail:Sprite;
		private var _bg:Sprite;
		private var _next:Btn;
		public var nextSignal:Signal = new Signal();
		private var _tryAgain:Btn;
		public var tryAgainSignal:Signal = new Signal();
		private var _title:TextField;
		private var _bestScore:TextField;
		private var _content:TextField;
		private var _score:TextField;
		private var seg:DisplayObject;
		private static var wdt:uint=290;
		private static var hgt:uint=210;
		public function PopUp()
		{
			drawBg(wdt);
			_bg.visible=false;
			addNext();
			this.x=6;
			this.y=6;//(_topContainerY-_thumbNail.height)/2;
			
		}
		
		
		private function addNext():void
		{
			_next = new Btn("next.png","next.png");
			_bg.addChild(_next);
			_next.y=seg.height+seg.y-_next.height-16;
			_next.x=_bg.width-_next.width-10;
			_tryAgain = new Btn("tryAgain.png","tryAgain.png");
			_bg.addChild(_tryAgain);
			_tryAgain.y=seg.height+seg.y-_next.height-16;
			_tryAgain.x=10;
			_tryAgain.clicked.add(
			function():void{
				tryAgainSignal.dispatch();
			}
			);
			var lineSplitter:DisplayObject = AssetsManager.getAssetByName("POP_UP_LINE_SPLITTER_SEGMENT.png");
			_bg.addChild(lineSplitter);
			lineSplitter.x=seg.x;
			lineSplitter.width = _bg.width - seg.x*2;
			lineSplitter.y = _next.y-12;
			_next.clicked.add(
				function onNext():void{
					nextSignal.dispatch();
				}
				)
		}
		
		private function addTitle(txt:String):void{
			_title = new TextField();
			var fmt:TextFormat = new TextFormat("Vardena",24,0xFFFFFF,true);
			_title.type = TextFieldType.DYNAMIC;
			_title.defaultTextFormat=fmt;
			_title.width=wdt-70-20;
			_title.x=70+20;
			_title.y=28;
			_title.text=txt;
			_bg.addChild(_title);
		}
		private function setBestScore(txt:String):void{
			if(!_bestScore){
				_bestScore = new TextField();
				//_bg.addChild(_bestScore);
				var fmt:TextFormat = new TextFormat("Vardena",18,0x333333);
				_bestScore.type = TextFieldType.DYNAMIC;
				fmt.align = TextFormatAlign.RIGHT;
				_bestScore.defaultTextFormat=fmt;
				_bestScore.width=wdt-100;
				_bestScore.y=50;
			}
			_bestScore.htmlText=txt;
		}
		
		private function set content(value:String):void
		{
			if(!_content){
				addContent(value);
			}
			_content.htmlText = value;
		}
		
		private function set title(str:String):void{
			if(!_title){
				addTitle(str);
			}
			_title.text = str;
		}
		private function set score(str:String):void{
			if(!_score){
				addScore(str);
			}
			_score.htmlText = str;
		}
		
		private function addContent(txt:String):void{
			_content = new TextField();
			var fmt:TextFormat = new TextFormat("Vardena",18,0x372c2d);
			fmt.leading=8;
			_content.type = TextFieldType.DYNAMIC;
			_content.defaultTextFormat=fmt;
			_content.width=wdt-140;
			_content.height=hgt-140;
			_content.x=40;
			_content.y=90;
			_content.wordWrap = true;
			_content.multiline = true;
			_content.htmlText=txt;
			_bg.addChild(_content);
		}
		
		private function addScore(txt:String):void{
			_score = new TextField();
			var fmt:TextFormat = new TextFormat("Vardena",18,0x372c2d);
			fmt.leading=8;
			_score.type = TextFieldType.DYNAMIC;
			_score.defaultTextFormat=fmt;
			_score.width=60;
			_score.height=hgt-140;
			_score.x=_content.width+_content.x;
			_score.y=90;
			_score.wordWrap = true;
			_score.multiline = true;
			_score.htmlText=txt;
			_bg.addChild(_score);
		}
		public function setScore(accuracy:uint,wrongNotes:uint,instrumentScore:uint):void{
			title="Your Score: "+instrumentScore;
			setBestScore("Best Score: 670");
			content = "<p>On Time: </p><p>Wrong Notes:</p> ";
			score = "<p>"+ accuracy+"% </p><p>"+wrongNotes+"</p>";
		}
		
		public function open():void{
			_bg.visible = true;
			_thumbNail.x=10;
			_thumbNail.y=10;
			this.alpha = 0;
			new GTween(this,0.5,{alpha:1});
		}
		
		public function set thumbNail(thumbNail:String):void{
			if(_thumbNail){
				removeChild(_thumbNail);
			}
			
			_thumbNail = new Sprite();
			_thumbNail.addChild(getThumbNail(thumbNail));
			addChild(_thumbNail);
			_thumbNail.x=5;
			_thumbNail.y=5;
			//_thumbNail.visible=false;
		}
		
		
//		private function addArrow(arrowDirection:String):DisplayObject{
//			var arrow:DisplayObject;
//			switch(arrowDirection){
//				case BTM_LEFT:
//				case BTM_RIGHT:
//					arrow = AssetsManager.getAssetByName("POP_UP_LOWER_ARROW_SEGMENT.png");
//					_bg.addChild(arrow);
//					break;
//				case TOP_LEFT:
//				case TOP_RIGHT:
//					arrow = AssetsManager.getAssetByName("POP_UP_UPPER_ARROW_SEGMENT.png");
//					_bg.addChild(arrow);
//					arrow.y=-25;
//					break;
//			}
//			return arrow;
//		}
		
		private function getThumbNail(thmb:String):DisplayObject{
			var icon:DisplayObject;
			switch(thmb){
				case "bottles.png":
					icon = AssetsManager.getAssetByName("DRUMMER_PROFILE_PIC.png");
					break;
				case "drum.png":
					icon = AssetsManager.getAssetByName("GIRL_PROFILE_PIC.png");
					break;
				case "bass_flash.jpg":
					icon = AssetsManager.getAssetByName("BASS_PROFILE_PIC.png");
					break;
				case "turnTable":
					icon = AssetsManager.getAssetByName("dj.jpg");
					break;
				default:
					throw new Error("no "+thmb);
			}
			return icon;
		}
		
		private function drawBg(wdt:uint):void{
			_bg = new Sprite();
			seg = AssetsManager.getAssetByName("POP_UP_VERTICAL_SEGMENT.png");
			_bg.addChild(seg);
			var topLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_LEFT_CORNER.png");
			_bg.addChild(topLeft);
			seg.width = wdt-topLeft.width;
			seg.x=topLeft.width;
			seg.height = hgt;
			var leftSeg:DisplayObject = AssetsManager.getAssetByName("POP_UP_LEFT_SEGMENT.png");
			_bg.addChild(leftSeg);
			var butLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_LEFT_CORNER.png");
			_bg.addChild(butLeft);
			butLeft.y=seg.height-butLeft.height-2;
			
			var topRight:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_RIGHT_CORNER.png");
			_bg.addChild(topRight);
			topRight.x=wdt//-topRight.width//+topLeft.width;
			var butRight:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_RIGT_CORNER.png");
			_bg.addChild(butRight);
			butRight.y=butLeft.y;
			butRight.x=wdt//-butRight.width;//+butLeft.width;
			
			var rightSeg:DisplayObject = AssetsManager.getAssetByName("POP_UP_RIGHT_SEGMENT.png");
			_bg.addChild(rightSeg);
			rightSeg.x=topRight.x;
			rightSeg.y=topRight.height-1;
			leftSeg.y=topLeft.height-1;
			rightSeg.height=seg.height-topRight.height-butRight.height;
			leftSeg.height=rightSeg.height;
			addChild(_bg);
		}

		

	}
}