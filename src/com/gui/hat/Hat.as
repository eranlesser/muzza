package com.gui.hat
{
	import com.constants.Session;
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.easing.Sine;
	import com.metronom.ITimeModel;
	import com.metronom.Metronome;
	import com.model.FileProxy;
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
		private var _highScore:TextField;
		private var _isDone:Boolean = false;
		private var _sign:DisplayObject;
		public function Hat(){
			_timeModel = Metronome.getTimeModel();
			init();
		}
		
		private function init():void{
			_sign = AssetsManager.getAssetByName("sign.png");
			addChild(_sign);
			_sign.x = 20;
			_sign.y=-60;
			_spriteSheet = new SpriteSheet(AssetsManager.getBitmap("hat.png"),212,185);
			_hat = new Sprite();
			addChild(_hat);
			_hat.scaleX = -1;
			_hat.x = 230;
			_tField = new TextField();
			_tField.defaultTextFormat=(new TextFormat("Arial",18,0x111111));
			_tField.autoSize = TextFieldAutoSize.CENTER;
			addChild(_tField);
			_tField.x = 85;
			_tField.y = 10;
			_highScore = new TextField();
			_highScore.defaultTextFormat=(new TextFormat("Arial",14,0x111111));
			_highScore.autoSize = TextFieldAutoSize.CENTER;
			addChild(_highScore);
			_highScore.x = 85;
			_highScore.y = 55;
			//var sign:DisplayObject = AssetsManager.getAssetByName("lv.png")
			//addChild(sign);
			//sign.x=150;
			//sign.y=50;
			//sign.scaleX=0.9
			progress();
		}
		
		
		
		
		public function reset():void{
			_coinsLevel = 0;
			_coinCounter = 0;
			//_tField.text="0";
			progress();
			_timeModel.tickSignal.remove(onTick);
			_highScore.text = ""+FileProxy.getHighScore();
		}
		
		public function fillHat(score:int):void{
			if(score==0){
				return;
			}
			var amount:Number=0.5;
			if(score<10){
				amount=0.5;
			}else if(score<32){
				amount=1;
				
			}else if(score<60){
				amount=1.5;
				
			}else if(score<100){
				amount=2;
				
			}else if(score<150){
				amount=2.5;
				
			}else if(score<200){
				amount=3;
				
			}else if(score<250){
				amount=4;
			}else{
				amount=5;
			}
			trace("amount=",amount)
			var tween:GTween = new GTween(null,amount);
			tween.ease = Sine.easeInOut;
			tween.onChange = onFillHat;
			tween.onComplete = onHatFull;
		}
		
		private function setScore():void{
			_tField.text = Session.instance.score.toString();
		}
		
		public function reStart():void{
			_tField.text="0";
			_timeModel.tickSignal.add(onTick);
			_highScore.text =""+ FileProxy.getHighScore();
			_isDone=false;
		}
		
		private function onHatFull(tween:GTween):void{
			_timeModel.tickSignal.remove(onTick);
			setScore();
			_isDone=true;
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
			if(Math.random()>0.98){
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
			if(!_isDone)
				_tField.text=int(Session.instance.score*(_timeModel.currentTick/(_timeModel.duration/1.8))).toString();
			//_tField.text = "$"+(_coinCounter + (_coinsLevel-1)*8).toString();
		}
	}
}