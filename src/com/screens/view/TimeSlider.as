package com.screens.view
{
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class TimeSlider extends Sprite{
		private var _rightSeg:DisplayObject;
		private var _bar:DisplayObject;
		private var _stroke:DisplayObject;
		public function TimeSlider(vertical:Boolean=false){
			
			addChild(AssetsManager.getAssetByName("TIMESLIDER_BACKGROUND.png"));
			var leftSlider:DisplayObject ;
			if(!vertical){
				leftSlider = addChild(AssetsManager.getAssetByName("TIMESLIDER_BLUE_RIGHT_SEGMENT.png"));
				leftSlider.scaleX=-1;
				leftSlider.x=21;
				_rightSeg=addChild(AssetsManager.getAssetByName("TIMESLIDER_BLUE_RIGHT_SEGMENT.png"));
				_bar=addChild(AssetsManager.getAssetByName("TIMESLIDER_BLUE_SEGMENT.png"));
			}else{
				leftSlider = addChild(AssetsManager.getAssetByName("TIMESLIDER_BLUE_RIGHT_SEGMENTv.png"));
				leftSlider.scaleX=-1;
				leftSlider.x=21;
				_rightSeg=addChild(AssetsManager.getAssetByName("TIMESLIDER_BLUE_RIGHT_SEGMENTv.png"));
				_bar=addChild(AssetsManager.getAssetByName("TIMESLIDER_BLUE_SEGMENTv.png"));
			}
			
			_bar.y=_rightSeg.y=leftSlider.y=5;
			_bar.x=21;
			_stroke=AssetsManager.getAssetByName("TIMESLIDER_STROKE_upper_layer.png");
			addChild(_stroke);
			var msk:DisplayObject=AssetsManager.getAssetByName("TIMESLIDER_BACKGROUND.png");
			addChild(msk);
			mask=msk;
			//msk.x=10;
		}
		private var _val:Number=0;
		public function get value():Number{
			return _val;
		}
		public function set value(val:Number):void{
			_bar.width=Math.round(((_stroke.width)-_rightSeg.width-28)*val/100);
			_rightSeg.x=_bar.width-1+_bar.x;
			//_stroke.width=_rightSeg.x+_rightSeg.width;
		}
		
		
	}
}