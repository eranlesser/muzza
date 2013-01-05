package com.inf
{
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	
	
	public class PopUp extends Sprite
	{
		public static const BUT_LEFT:String = "butLeft";
		public static const BUT_RIGHT:String = "butRight";
		private var _arrow:DisplayObject;
		private var _thumbNail:DisplayObject;
		private var _bg:Sprite;
		private var _topContainerY:uint;
		private var _location:Point;
		public function PopUp(wdt:uint,arrowDirection:String,thumbNail:String,location:Point,topContainerY:uint)
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
			_topContainerY=topContainerY;
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
				case BUT_LEFT:
					arrow = AssetsManager.getAssetByName("POP_UP_LOWER_ARROW_SEGMENT.png");
					_bg.addChild(arrow);
					arrow.x=20;
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
			_arrow = addArrow(arrowDirection);
			seg.width = wdt-_arrow.width-_arrow.x;
			seg.x=_arrow.width+_arrow.x;
			var topLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_LEFT_CORNER.png");
			_bg.addChild(topLeft);
			var leftSeg:DisplayObject = AssetsManager.getAssetByName("POP_UP_LEFT_SEGMENT.png");
			_bg.addChild(leftSeg);
			leftSeg.y=topLeft.height;
			var butLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_LEFT_CORNER.png");
			_bg.addChild(butLeft);
			butLeft.y=seg.height-butLeft.height;
			
			var topRight:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_RIGHT_CORNER.png");
			_bg.addChild(topRight);
			topRight.x=seg.width+seg.x//+topLeft.width;
			var butRight:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_RIGT_CORNER.png");
			_bg.addChild(butRight);
			butRight.y=butLeft.y;
			butRight.x=seg.width +seg.x;//+butLeft.width;
			
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