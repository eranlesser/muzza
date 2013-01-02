package com.inf
{
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	
	
	public class PopUp extends Sprite
	{
		public static const BUT_LEFT:String = "butLeft";
		public static const BUT_RIGHT:String = "butRight";
		public function PopUp(wdt:uint,arrowDirection:String)
		{
			init(wdt);
			addArrow(arrowDirection);
		}
		
		private function addArrow(arrowDirection:String):void{
			var arrow:DisplayObject;
			switch(arrowDirection){
				case BUT_LEFT:
					arrow = AssetsManager.getAssetByName("POP_UP_LOWER_ARROW_SEGMENT.png");
					addChild(arrow);
					arrow.x=40;
					break;
			}
		}
		
		private function init(wdt:uint):void{
			var wdt:uint=wdt;
			var seg:DisplayObject = AssetsManager.getAssetByName("POP_UP_VERTICAL_SEGMENT.png");
			addChild(seg);
			seg.width = wdt;
			
			var topLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_LEFT_CORNER.png");
			addChild(topLeft);
			var leftSeg:DisplayObject = AssetsManager.getAssetByName("POP_UP_LEFT_SEGMENT.png");
			addChild(leftSeg);
			leftSeg.y=topLeft.height;
			var butLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_LEFT_CORNER.png");
			addChild(butLeft);
			butLeft.y=seg.height-butLeft.height;
			seg.x=butLeft.width;
			
			var topRight:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_RIGHT_CORNER.png");
			addChild(topRight);
			topRight.x=seg.width+topLeft.width;
			var butRight:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_RIGT_CORNER.png");
			addChild(butRight);
			butRight.y=butLeft.y;
			butRight.x=seg.width+butLeft.width;
			
			var rightSeg:DisplayObject = AssetsManager.getAssetByName("POP_UP_RIGHT_SEGMENT.png");
			addChild(rightSeg);
			rightSeg.x=topRight.x;
			rightSeg.y=topRight.height;
			rightSeg.height=seg.height-topRight.height-butRight.height;
			leftSeg.height=rightSeg.height;
		}
	}
}