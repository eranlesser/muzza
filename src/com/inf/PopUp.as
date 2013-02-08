package com.inf
{
	import com.gskinner.motion.GTween;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;
	
	
	public class PopUp extends Sprite
	{
		public static const BTM_LEFT:String = "btm_left";
		public static const BTM_RIGHT:String = "btm_right";
		public static const TOP_LEFT:String = "top_left";
		public static const TOP_RIGHT:String = "top_right";
		public static const NO_ARROW:String = "none";
		private var _arrow:DisplayObject;
		private var _thumbNail:Sprite;
		private var _model:PopUpModel;
		private var _bg:Sprite;
		private var _mini_bg:Sprite;
		private var _next:Btn;
		public var nextSignal:Signal = new Signal();
		private var _title:TextField;
		private var _content:TextField;
		private var seg:DisplayObject;
		public function PopUp(popupModel:PopUpModel,enforcer:PopUpsManager)
		{
			_model = popupModel;
			drawBg(_model.width,popupModel.direction);
			drawMiniBg();
			_bg.visible=false;
			addTitle(_model.title,_model.width);
			addContent(_model.content,_model.width);
			if(popupModel.next){
				addNext();
			}
			this.x=6;
			this.y=6;//(_topContainerY-_thumbNail.height)/2;
			
		}
		
		public function get model():PopUpModel{
			return _model;
		}
		
		private function addNext():void
		{
			_next = new Btn("next_IDLE.png","next_PRESSED.png");
			_bg.addChild(_next);
			_next.y=seg.height+seg.y-_next.height-14;
			_next.x=_bg.width-_next.width-10;
			var lineSplitter:DisplayObject = AssetsManager.getAssetByName("POP_UP_LINE_SPLITTER_SEGMENT.png");
			_bg.addChild(lineSplitter);
			lineSplitter.x=seg.x;
			lineSplitter.width = _bg.width - seg.x*2;
			lineSplitter.y = _next.y-14;
			_next.clicked.add(
				function onNext():void{
					nextSignal.dispatch();
				}
				)
		}
		
		public function get id():String{
			return _model.id;
		}
		
		private function addTitle(txt:String,wdt:uint):void{
			_title = new TextField();
			var fmt:TextFormat = new TextFormat("Vardena",24,0xFFFFFF,true);
			_title.type = TextFieldType.DYNAMIC;
			_title.defaultTextFormat=fmt;
			_title.width=wdt-70-20;
			_title.x=70+20;
			_title.y=10;
			_title.text=txt;
			_bg.addChild(_title);
			
		}
		
		public function set title(str:String):void{
			_title.text = str;
		}
		private function addContent(txt:String,wdt:uint):void{
			_content = new TextField();
			var fmt:TextFormat = new TextFormat("Vardena",18,0x372c2d);
			_content.type = TextFieldType.DYNAMIC;
			_content.defaultTextFormat=fmt;
			_content.width=wdt-70-30;
			_content.x=70+20;
			_content.y=45;
			_content.wordWrap = true;
			_content.multiline = true;
			_content.text=txt;
			_bg.addChild(_content);
		}
		
		private function onClick(event:Event):void
		{
			//_bg.width = 70+20;			
			//_bg.height = _thumbNail.height+20;
			if(_bg.visible){
				close();
			}else{
				open();
			}
		}
		
		public function open():void{
			_bg.visible = true;
			_mini_bg.visible=false;
			this.x=_model.x
			this.y=_model.y;
			_thumbNail.x=10;
			_thumbNail.y=10;
			this.alpha = 0;
			this.scaleX=1;
			this.scaleY=1;
			new GTween(this,0.5,{alpha:1});
		}
		
		public function set thumbNail(thumbNail:String):void{
			if(_thumbNail){
				_thumbNail.removeEventListener(MouseEvent.CLICK,onClick);
				removeChild(_thumbNail);
			}
			
			_thumbNail = new Sprite();
			_thumbNail.addChild(getThumbNail(thumbNail));
			addChild(_thumbNail);
			_thumbNail.x=5;
			_thumbNail.y=5;
			_thumbNail.addEventListener(MouseEvent.CLICK,onClick);
			//_thumbNail.visible=false;
		}
		
		public function close():void{
			_bg.visible=false;
			_mini_bg.visible=true;
			this.x=10;
			this.y=18;//(_topContainerY-_thumbNail.height)/2;
			_thumbNail.x=5;
			_thumbNail.y=5;
			this.alpha=1;
			this.scaleX=0.7;
			this.scaleY=0.7;
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
				case "turnTable":
					icon = AssetsManager.getAssetByName("BASS_PROFILE_PIC.png");
					break;
			}
			return icon;
		}
		private function drawMiniBg():void{
			_mini_bg = new Sprite();
			var topLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_LEFT_CORNER.png");
			_mini_bg.addChild(topLeft);
			var leftSeg:DisplayObject = AssetsManager.getAssetByName("POP_UP_LEFT_SEGMENT.png");
			_mini_bg.addChild(leftSeg);
			leftSeg.y=topLeft.height;
			leftSeg.height=40;
			var butLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_LEFT_CORNER.png");
			_mini_bg.addChild(butLeft);
			butLeft.y=40+topLeft.height;
			
			var topRight:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_RIGHT_CORNER.png");
			_mini_bg.addChild(topRight);
			topRight.x=40+topLeft.width//-topRight.width//+topLeft.width;
			var butRight:DisplayObject = AssetsManager.getAssetByName("POP_UP_LOWER_RIGT_CORNER.png");
			_mini_bg.addChild(butRight);
			butRight.y=butLeft.y;
			butRight.x=40+topLeft.width//-butRight.width;//+butLeft.width;
			
			var rightSeg:DisplayObject = AssetsManager.getAssetByName("POP_UP_RIGHT_SEGMENT.png");
			_mini_bg.addChild(rightSeg);
			rightSeg.x=topRight.x;
			rightSeg.y=topRight.height;
			rightSeg.height=40;
			leftSeg.height=40;
			
			var mseg:DisplayObject = AssetsManager.getAssetByName("POP_UP_VERTICAL_SEGMENT.png");
			_mini_bg.addChild(mseg);
			mseg.width=40;
			mseg.height=83;
			mseg.x=20;
			mseg.y=0;
			addChild(_mini_bg);
		}
		private function drawBg(wdt:uint,arrowDirection:String):void{
			_bg = new Sprite();
			var wdt:uint=wdt;
			seg = AssetsManager.getAssetByName("POP_UP_VERTICAL_SEGMENT.png");
			_bg.addChild(seg);
			var topLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_LEFT_CORNER.png");
			_bg.addChild(topLeft);
			if(arrowDirection!=NO_ARROW){
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
				seg.width = wdt-topLeft.width;
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

		public function set content(value:String):void
		{
			_content.text = value;
		}

	}
}