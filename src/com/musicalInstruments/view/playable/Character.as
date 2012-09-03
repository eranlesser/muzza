package com.musicalInstruments.view.playable
{
	import com.musicalInstruments.view.IAnimateable;
	import com.view.tools.AssetsManager;
	import com.view.tools.SpriteSheet;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;

	public class Character extends Sprite implements IAnimateable{
		
		private var _spriteSheet:SpriteSheet;
		private var _animationSequance:Vector.<Bitmap>;
		private var _animationIndex:uint;
		private var _spriteSheetUrl:String;
		
		
		public function Character(spriteSheet:String,positionsLength:uint,wdt:uint,hgt:uint){
			_spriteSheetUrl=spriteSheet;
			_spriteSheet  = new SpriteSheet(AssetsManager.getBitmap(spriteSheet),wdt,hgt);
			_animationSequance = new Vector.<Bitmap>();
			init(positionsLength);
		}
		
		public function get spriteSheetUrl():String{
			return _spriteSheetUrl;
		}
		
		private function init(positionsLength:uint):void{
			//load all animationSequance
			trace("new character")
			var i:uint=0;
			while(i<=positionsLength+1){
				var img:Bitmap = new Bitmap();
				img.bitmapData = _spriteSheet.drawTile(i);
				_animationSequance.push(img) ;
				i++;
			}
			addChild(_animationSequance[0]);
			_animationIndex = 0;
		}
		
		public function get animationIndex():uint{
			return _animationIndex;
		}
		
		public function animateTo(animationIndex:uint,id:uint):void{
			removeChildAt(0);
			addChild(_animationSequance[animationIndex]);
			_animationIndex = animationIndex;
		}
		
	}
}
