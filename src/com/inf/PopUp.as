package com.inf
{
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	
	public class PopUp extends Sprite
	{
		public static const BTM_LEFT:String = "butLeft";
		public static const BTM_RIGHT:String = "butRight";
		public static const TOP_LEFT:String = "topLeft";
		public static const TOP_RIGHT:String = "topRight";
		public static const NO_ARROW:String = "";
		private var _arrow:DisplayObject;
		private var _thumbNail:DisplayObject;
		private var _bg:Sprite;
		private var _location:Point;
		public function PopUp(wdt:uint,arrowDirection:String,thumbNail:String,location:Point,title:String,content:String)
		{
			drawBg(wdt,arrowDirection);
			_thumbNail = addChild(getThumbNail(thumbNail))
			_thumbNail.x=10;
			_thumbNail.y=10;
			this.addEventListener(MouseEvent.CLICK,onClick);
			_location=location;
			_bg.visible=false;
			this.x=11;
			this.y=3;
			addTitle(title,wdt);
			addContent(content,wdt)
		}
		
		private function addTitle(txt:String,wdt:uint):void{
			var title:TextField = new TextField();
			var fmt:TextFormat = new TextFormat("Arial",24,0xFFFFFF,true);
			title.type = TextFieldType.DYNAMIC;
			title.defaultTextFormat=fmt;
			title.width=wdt-_thumbNail.width-20;
			title.x=_thumbNail.width+20;
			title.y=10;
			title.text=txt;
			_bg.addChild(title);
			
		}
		private function addContent(txt:String,wdt:uint):void{
			var content:TextField = new TextField();
			var fmt:TextFormat = new TextFormat("Arial",18,0x372c2d);
			content.type = TextFieldType.DYNAMIC;
			content.defaultTextFormat=fmt;
			content.width=wdt-_thumbNail.width-30;
			content.x=_thumbNail.width+20;
			content.y=50;
			content.wordWrap = true;
			content.multiline = true;
			content.text=txt;
			_bg.addChild(content);
		}
		
		private function onClick(event:Event):void
		{
			//_bg.width = _thumbNail.width+20;			
			//_bg.height = _thumbNail.height+20;
			if(_bg.visible){
				_bg.visible=false;
				this.x=11;
				this.y=3;//(_topContainerY-_thumbNail.height)/2;
			}else{
				_bg.visible = true;
				this.x=_location.x;
				this.y=_location.y;
			}
		}
		
		private function addArrow(arrowDirection:String):DisplayObject{
			var arrow:DisplayObject;
			switch(arrowDirection){
				case BTM_LEFT:
				case BTM_RIGHT:
					arrow = AssetsManager.getAssetByName("POP_UP_LOWER_ARROW_SEGMENT.png");
					_bg.addChild(arrow);
					break;
				case TOP_LEFT:
				case TOP_RIGHT:
					arrow = AssetsManager.getAssetByName("POP_UP_UPPER_ARROW_SEGMENT.png");
					_bg.addChild(arrow);
					arrow.y=-25;
					break;
			}
			return arrow;
		}
		
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
			}
			return icon;
		}
		
		private function drawBg(wdt:uint,arrowDirection:String):void{
			_bg = new Sprite();
			var wdt:uint=wdt;
			var seg:DisplayObject = AssetsManager.getAssetByName("POP_UP_VERTICAL_SEGMENT.png");
			_bg.addChild(seg);
			var topLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_LEFT_CORNER.png");
			_bg.addChild(topLeft);
			if(arrowDirection!=""){
				_arrow = addArrow(arrowDirection);
				seg.width = wdt-_arrow.width-20;
				switch(arrowDirection){
					case BTM_LEFT:
					case TOP_LEFT:
						_arrow.x=20;
						seg.x=_arrow.width+_arrow.x;
						break;
					case BTM_RIGHT:
					case TOP_RIGHT:
						_arrow.x=wdt-_arrow.width;
						seg.x=topLeft.width;
						break;
				}
			}else{
				seg.width = wdt-topLeft.width*2;
				seg.x=topLeft.width;
			}
			
			var leftSeg:DisplayObject = AssetsManager.getAssetByName("POP_UP_LEFT_SEGMENT.png");
			_bg.addChild(leftSeg);
			leftSeg.y=topLeft.height;
			var butLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_LEFT_CORNER.png");
			_bg.addChild(butLeft);
			butLeft.y=seg.height-butLeft.height;
			
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
			rightSeg.y=topRight.height;
			rightSeg.height=seg.height-topRight.height-butRight.height;
			leftSeg.height=rightSeg.height;
			addChild(_bg);
		}
	}
}