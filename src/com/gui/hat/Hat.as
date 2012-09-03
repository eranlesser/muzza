package com.gui.hat
{
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.easing.Sine;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.view.tools.AssetsManager;
	import com.view.tools.SpriteSheet;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class Hat extends Sprite{
		
		private var _spriteSheet:SpriteSheet;
		private var _coinCounter:uint=0;
		private var _hat:Sprite;
		private var _coinsLevel:uint = 0;
		private var _timeModel:ITimeModel;
		private var _tField:TextField;
		
		public function Hat(){
			_timeModel = Metronome.getTimeModel();
			init();
		}
		
		private function init():void{
			_spriteSheet = new SpriteSheet(AssetsManager.getBitmap("hat.png"),212,185);
			_hat = new Sprite();
			addChild(_hat);
			_hat.scaleX = -1;
			_hat.x = 230;
			_tField = new TextField();
			_tField.defaultTextFormat=(new TextFormat("Chalkduster",26));
			_tField.autoSize = TextFieldAutoSize.CENTER;
			//addChild(_tField);
			_tField.text="0";
			_tField.x = 42;
			_tField.y = 43;
			var sign:DisplayObject = AssetsManager.getAssetByName("lv.png")
			addChild(sign);
			sign.x=150;
			sign.y=50;
			sign.scaleX=0.9
			progress();
		}
		
		public function start():void{
			_timeModel.tickSignal.add(onTick);
//			_timeModel.cycleSignal.add(onCycle);
		}
		
		public function stop():void{
			_timeModel.tickSignal.remove(onTick);
//			_timeModel.cycleSignal.remove(onCycle);
		}
		
		public function reset():void{
			_coinsLevel = 0;
			_coinCounter = 0;
			_tField.text="0";
			progress();
		}
		
		public function fillHat():void{
			var tween:GTween = new GTween(null,5);
			tween.ease = Sine.easeInOut;
			tween.onChange = onFillHat;
			tween.onComplete = onHatFull;
		}
		
		private function onHatFull(tween:GTween):void{
			_timeModel.tickSignal.remove(onTick);
//			_timeModel.cycleSignal.remove(onCycle);
		}
		private function onFillHat(tween:GTween):void{
			if(Math.random()>0.8)
				throwCoin()
		}
		
		
		private function progress():void{
			var img:Bitmap = new Bitmap();
			img.bitmapData = _spriteSheet.drawTile(_coinsLevel);
			if(_hat.numChildren>0){
				_hat.removeChildAt(0);
			}
			_hat.addChild(img);
			_coinsLevel++;
		}
		private function onTick():void{
			if(Math.random()>0.96){
				throwCoin();
			}
		}
		/*
		private function onCycle():void{
			if(_timeModel.currentCycle==1){
				return;
			}
			var i:uint = Math.random()*5;
			for(var n:uint=0;n<i;n++){
				throwCoin();
			}
		}
		*/
		
		private function throwCoin():void{
			var coin:DisplayObject = AssetsManager.getAssetByName("coin.png");
			addChild(coin);
			coin.x = Math.random()*300;
			coin.y = -Math.random()*300;
			coin.alpha = 0.5;
			var gTween:GTween=new GTween(coin,1,{y:120,x:40+Math.random()*55,alpha:1}, {ease:Sine.easeInOut});
			gTween.onComplete = onCoinComplete;
			_coinCounter++;
			if(_coinCounter>8 && _coinsLevel<5){
				_coinCounter = 0;
				progress();
			}
		}
		private function onCoinComplete(tween:GTween):void{
			removeChild(tween.target as DisplayObject);
			_tField.text = "$"+(_coinCounter + (_coinsLevel-1)*8).toString();
		}
	}
}