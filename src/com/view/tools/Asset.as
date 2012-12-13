package com.view.tools
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;

	public class Asset{
		public var name:String;
		public var image:DisplayObject;
		public function Asset(nme:String,img:DisplayObject){
			name=nme.slice(nme.lastIndexOf("/")+1,nme.length);
			(img as Bitmap).cacheAsBitmap = true;
			image=img;
		}
		
		
	}
}