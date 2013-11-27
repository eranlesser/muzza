package com.screens.view
{
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.utils.inapp.InAppPurchaser;
	import com.utils.inapp.InApper;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;
	
	public class Store extends Sprite
	{
		private var _storeBtn:Btn;
		public var complete:Signal = new Signal();
		private var _CheckIfAdult:Sprite;
		private var _tf:TextField;
		private var _buyButton:Btn;
		private var _restoreButton:Btn;
		private var _inApper:InAppPurchaser;
		
		public function Store()
		{
			_storeBtn = new Btn("dot.png","dot.png");
			addChild(AssetsManager.getAssetByName("STATION_WALL_TRIP.png"))
			init();
			_inApper = new InApper();
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
		
		private function init():void{
			_CheckIfAdult = new Sprite();
			_CheckIfAdult.graphics.beginFill(0xFFFFFF,0.75);
			_CheckIfAdult.graphics.drawRoundRect(0,0,500,180,12,8);
			_CheckIfAdult.graphics.endFill();
			addChild(_CheckIfAdult);
			_CheckIfAdult.x=Dimentions.WIDTH-100-_CheckIfAdult.width;
			_CheckIfAdult.y=190;
			var tf:TextFormat = new TextFormat("Arial",34,0X023550);
			var txt:TextField = new TextField();
			txt.defaultTextFormat=tf;
			txt.width=600;
			txt.autoSize=TextFieldAutoSize.CENTER;
			txt.text = "Please verify you are an adult";
			txt.x=(_CheckIfAdult.width-txt.width)/2;
			txt.y=46;
			_CheckIfAdult.addChild(txt);
			
			var nms:TextField = new TextField();
			nms.defaultTextFormat=tf;
			nms.autoSize=TextFieldAutoSize.LEFT;
			nms.text = "20-4 = ";
			nms.x=txt.x+txt.width/2-nms.width/2;;
			nms.y=120;
			_CheckIfAdult.addChild(nms);
			_tf = new TextField();
			_tf.width=80;
			_tf.height=nms.height;
			_tf.border=true;
			_CheckIfAdult.addChild(_tf);
			_tf.defaultTextFormat = tf;
			_tf.backgroundColor=0XFFE39F;
			_tf.background=true;
			nms.x=nms.x-_tf.width/2;
			_tf.x=nms.x+nms.width+10;
			_tf.y=nms.y;
			_tf.type = TextFieldType.INPUT;
			_tf.addEventListener(Event.CHANGE,onInput);
			
			var closeBtn:Btn = new Btn("CLOSE_BUTTON_IDLE.png","CLOSE_BUTTON_SELECTED.png");
			_CheckIfAdult.addChild(closeBtn);
			closeBtn.x=_CheckIfAdult.width-closeBtn.width+4;
			closeBtn.y=-4;
			closeBtn.clicked.add(function(id:String):void{complete.dispatch();});
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
			// TODO Auto Generated method stub
			if(!_buyButton){
				_buyButton=new Btn("dot.png","dot.png");
				_restoreButton=new Btn("dot.png","dot.png");
				_buyButton.clicked.add(buyFullVersion);
				_restoreButton.clicked.add(restoreFullVersion);
				addChild(_buyButton);
				addChild(_restoreButton);
				_buyButton.x=630;
				_buyButton.y=230;
				_restoreButton.x=530;
				_restoreButton.y=230;
			}else{
				_buyButton.visible=true;
				_restoreButton.visible=true;
			}
			_CheckIfAdult.visible=false;
		}
		
		
		private function restoreFullVersion(id:String):void
		{
			_inApper.signal.add(onInappEvent);
			_inApper.restoreTransactions();
			//
			Session.fullVersionEnabled=true;
			complete.dispatch();
		}
		
		private function buyFullVersion(id:String=""):void
		{
			_inApper.purchase(Session.inAppFullVersionId,1);
			_inApper.signal.add(onInappEvent);
			
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
			Session.fullVersionEnabled=true;
			complete.dispatch();
		}
	}
}