package com.screens.view
{
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.sticksports.nativeExtensions.flurry.Flurry;
	import com.utils.inapp.InAppPurchaser;
	import com.utils.inapp.InApper;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;
	
	public class Store extends Sprite
	{
		public var complete:Signal = new Signal();
		private var _CheckIfAdult:Sprite;
		private var _tf:TextField;
		private var _buyButton:Btn;
		private var _restoreButton:Btn;
		private var _inApper:InAppPurchaser;
		
		public function Store()
		{
			addChild(AssetsManager.getAssetByName("STATION_WALL_TRIP.png"))
			init();
			_inApper = new InApper();
			_inApper.signal.add(onInappEvent);
		}
		//Is called every time except first (then init is called)
		public function restart():void{
			_CheckIfAdult.visible=true;
			if(_buyButton){
				_buyButton.visible=false;
				_restoreButton.visible=false;
				_tf.text="";
			}
		}
		private function drawBg(wdt:uint):void{
			_CheckIfAdult = new Sprite();
			var seg:DisplayObject = AssetsManager.getAssetByName("POP_UP_VERTICAL_SEGMENT.png");
			_CheckIfAdult.addChild(seg);
			var topLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_LEFT_CORNER.png");
			_CheckIfAdult.addChild(topLeft);
			seg.width = wdt-topLeft.width;
			seg.x=topLeft.width;
			seg.height = 180;
			var leftSeg:DisplayObject = AssetsManager.getAssetByName("POP_UP_LEFT_SEGMENT.png");
			_CheckIfAdult.addChild(leftSeg);
			var butLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_LEFT_CORNER.png");
			_CheckIfAdult.addChild(butLeft);
			butLeft.y=seg.height-butLeft.height;
			
			var topRight:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_RIGHT_CORNER.png");
			_CheckIfAdult.addChild(topRight);
			topRight.x=wdt//-topRight.width//+topLeft.width;
			var butRight:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_RIGT_CORNER.png");
			_CheckIfAdult.addChild(butRight);
			butRight.y=butLeft.y;
			butRight.x=wdt//-butRight.width;//+butLeft.width;
			
			var rightSeg:DisplayObject = AssetsManager.getAssetByName("POP_UP_RIGHT_SEGMENT.png");
			_CheckIfAdult.addChild(rightSeg);
			rightSeg.x=topRight.x;
			rightSeg.y=topRight.height;
			leftSeg.y=topLeft.height;
			rightSeg.height=seg.height-topRight.height-butRight.height;
			leftSeg.height=rightSeg.height;
			addChild(_CheckIfAdult);
		}

		private function init():void{
			_CheckIfAdult = new Sprite();
			drawBg(500);
			//_CheckIfAdult.graphics.beginFill(0xFFFFFF,0.75);
			//_CheckIfAdult.graphics.drawRoundRect(0,0,500,180,12,8);
			//_CheckIfAdult.graphics.endFill();
			addChild(_CheckIfAdult);
			_CheckIfAdult.x=Dimentions.WIDTH-100-_CheckIfAdult.width;
			_CheckIfAdult.y=190;
			var tf:TextFormat = new TextFormat("Arial",32,0X023550);
			var txt:TextField = new TextField();
			txt.defaultTextFormat=tf;
			txt.width=600;
			txt.autoSize=TextFieldAutoSize.CENTER;
			txt.text = "Please ask your parents for \npermission before purchasing";
			txt.x=(_CheckIfAdult.width-txt.width)/2;
			txt.y=16;
			_CheckIfAdult.addChild(txt);
			
			var nms:TextField = new TextField();
			nms.defaultTextFormat=tf;
			nms.autoSize=TextFieldAutoSize.LEFT;
			nms.text = "20-4 = ";
			nms.x=txt.x+txt.width/2-nms.width/2-22;
			nms.y=120;
			_CheckIfAdult.addChild(nms);
			_tf = new TextField();
			_tf.width=80;
			_tf.height=nms.height;
			_tf.border=true;
			_CheckIfAdult.addChild(_tf);
			_tf.defaultTextFormat = tf;
			_tf.backgroundColor=0XFFFFFF;
			_tf.background=true;
			nms.x=nms.x-_tf.width/2;
			_tf.x=nms.x+nms.width+10;
			_tf.y=nms.y;
			_tf.type = TextFieldType.INPUT;
			_tf.addEventListener(Event.CHANGE,onInput);
			
			var closeBtn:Btn = new Btn("next_IDLE.png","next_PRESS.png");
			_CheckIfAdult.addChild(closeBtn);
			closeBtn.x=_CheckIfAdult.width-closeBtn.width-35;
			closeBtn.y=nms.y+5;
			closeBtn.clicked.add(function(id:String):void{
				_tf.text="";
				complete.dispatch();
			});
		}
		
		private function onInput(e:Event):void{
			if(_tf){
				if(_tf.text=="doremi"){//easter egg TODO disable for first version
					onPurchased();
				}else if(_tf.text=="16"){
					showBuyButtons();
				}
			}
		}
		
		//after confirm adult
		private function showBuyButtons():void
		{
			Flurry.logEvent("showBuyButtons");
			// TODO Auto Generated method stub
			if(!_buyButton){
				_buyButton=new Btn("buy.png","buy.png");
				_restoreButton=new Btn("restore.png","restore.png");
				_buyButton.clicked.add(buyFullVersion);
				_restoreButton.clicked.add(restoreFullVersion);
				addChild(_buyButton);
				addChild(_restoreButton);
				_buyButton.x=730;
				_buyButton.y=280;
				_restoreButton.x=470;
				_restoreButton.y=280;
			}else{
				_buyButton.visible=true;
				_restoreButton.visible=true;
			}
			_CheckIfAdult.visible=false;
		}
		
		
		private function restoreFullVersion(id:String):void
		{
			_inApper.restoreTransactions();
			//
			//Session.fullVersionEnabled=true;
			//complete.dispatch();
			Flurry.logEvent("restore");
		}
		
		private function buyFullVersion(id:String=""):void
		{
			_inApper.purchase(Session.inAppFullVersionId,1);
			Flurry.logEvent("buyFullVersion");
		}
		
		private function onInappEvent(type:String):void
		{
			if(type==InApper.PRODUCT_RESTORE_SUCCEED||type==InApper.PRODUCT_TRANSACTION_SUCCEEDED){
				onPurchased();
			}else{
				complete.dispatch();
			}
			// TODO Auto Generated method stub
			
		}
		
		//enable full version - called from success restore , success buy , easter egg
		private function onPurchased():void
		{
			// TODO Auto Generated method stub
			Flurry.logEvent("onPurchased");
			Session.fullVersionEnabled=true;
			complete.dispatch();
		}
	}
}