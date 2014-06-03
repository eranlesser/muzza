package com.inf
{
	import com.gskinner.motion.GTween;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;
	
	
	public class Inf extends Sprite
	{
		public static const BTM_LEFT:String = "btm_left";
		public static const BTM_RIGHT:String = "btm_right";
		public static const TOP_LEFT:String = "top_left";
		public static const TOP_RIGHT:String = "top_right";
		public static const NO_ARROW:String = "";
		private var _arrow:DisplayObject;
		private var _thumbNail:DisplayObject;
		private var _bg:Sprite;
		private var _nextSignal:Signal = new Signal();
		private var _tryAgainSignal:Signal = new Signal();
		private var _width:uint;
		private var _actionBtn:Btn;
		public function Inf(wdth:uint,direction:String,actionBtn:Btn)
		{
			drawBg(wdth,direction);
			//this.addEventListener(MouseEvent.CLICK,onClick);
			//addTitle(_model.title,_model.width);
			//addContent(_model.content,_model.width)
			this.x=6;
			this.y=6;//(_topContainerY-_thumbNail.height)/2;
			_width = wdth;
			_actionBtn = actionBtn;
			this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
		}
		
		protected function onMouseDown(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			if(_actionBtn)
				_actionBtn.clicked.dispatch(_actionBtn.id);
		}		
		
		public function get tryAgainSignal():Signal
		{
			return _tryAgainSignal;
		}

		public function get nextSignal():Signal
		{
			return _nextSignal;
		}

		public function addTitle(txt:String):void{
			var title:TextField = new TextField();
			var fmt:TextFormat = new TextFormat("Arial",24,0xFFFFFF,true);
			title.type = TextFieldType.DYNAMIC;
			title.defaultTextFormat=fmt;
			title.width=_width-70-20;
			title.x=70+20;
			title.y=10;
			title.text=txt;
			_bg.addChild(title);
			
		}
		public function addContent(txt:String):void{
			var content:TextField = new TextField();
			var fmt:TextFormat = new TextFormat("Arial",18,0x372c2d);
			content.type = TextFieldType.DYNAMIC;
			content.defaultTextFormat=fmt;
			content.width=_width-70-30;
			content.x=70+20;
			content.y=50;
			content.wordWrap = true;
			content.multiline = true;
			content.text=txt;
			_bg.addChild(content);
		}
		
		public function addNext():void
		{
			var next:Btn = new Btn("next.png","next.png");
			_bg.addChild(next);
			next.y=_bg.height+_bg.y-next.height-16;
			next.x=_bg.width-next.width-10;
			var lineSplitter:DisplayObject = AssetsManager.getAssetByName("POP_UP_LINE_SPLITTER_SEGMENT.png");
			_bg.addChild(lineSplitter);
			lineSplitter.x=25;
			lineSplitter.width = _bg.width - 50;
			lineSplitter.y = next.y-12;
			next.clicked.add(
				function onNext():void{
					nextSignal.dispatch();
				}
			)
		}
		
		
		
		public function open():void{
			_bg.visible = true;
			_thumbNail.x=10;
			_thumbNail.y=10;
		}
		
		public function set thumbNail(thumbNail:String):void{
			if(_thumbNail){
				removeChild(_thumbNail);
			}
			_thumbNail = addChild(getThumbNail(thumbNail))
			_thumbNail.x=5;
			_thumbNail.y=5;
			//_thumbNail.visible=false;
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
			}
			return icon;
		}
		
		
		private function drawBg(wdt:uint,arrowDirection:String):void{
			_bg = new Sprite();
			var seg:DisplayObject = AssetsManager.getAssetByName("POP_UP_VERTICAL_SEGMENT.png");
			_bg.addChild(seg);
			var topLeft:DisplayObject = AssetsManager.getAssetByName("POP_UP_UPPER_LEFT_CORNER.png");
			_bg.addChild(topLeft);
			if(arrowDirection!=""){
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
				seg.width = wdt-topLeft.width*2+20;
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
	}
}