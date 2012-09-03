package com.tutorial
{
	import com.screens.view.RecordScreen;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class TutorialRecordScreen extends RecordScreen{
		private var _tutorialLayer:Sprite;
		private var _arrow:Arrow;
		private var _inf:Inf;
		private var _dot:Shape;
		private var _line:Shape;
		public function TutorialRecordScreen(){
			_tutorialLayer=new Sprite();
			addChild(_tutorialLayer);
		}
		
		override public function start():void{
			
			if(!isInited){
				_arrow=new Arrow();
				_inf=new Inf();
				initDot();
				initLine();
			}
			super.start();
			_tutorialLayer.addChild(_arrow);
			_tutorialLayer.addChild(_inf);
			_tutorialLayer.addChild(_dot);
		}
		
		private function initDot():void{
			_dot=new Shape();
			_dot.graphics.lineStyle(1,0x020B40);
			_dot.graphics.beginFill(0x023E73);
			_dot.graphics.drawCircle(0,0,10);
		}
		
		private function initLine():void{
			_line=new Shape();
			_line.graphics.lineStyle(1);
			_tutorialLayer.addChild(_line);
		}
		
		public function get dot():Shape{
			return _dot;
		}
		
		public function get line():Shape{
			return _line;
		}
		
		override protected function initStateController():void{
			_stateController = new TutorialScreenStateController(this);
		}
		public function get arrow():DisplayObject{
			return _arrow;
		}
		
		public function setArrow(xx:int,yy:int,angle:int):void{
			_arrow.x=xx;
			_arrow.y=yy;
			_arrow.rotation=angle;
			_arrow.visible=true;
		}
		public function set text(txt:String):void{
			_inf.text=txt;
		}
	}
}
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

class Arrow extends Sprite{
	private var _view:DisplayObject;
	public function Arrow(){
		_view=AssetsManager.getAssetByName("Down_Arrow_Icon.png");
		_view.scaleX=0.2;
		_view.scaleY=0.2;
		addChild(_view);
	}
}

class Inf extends Sprite{
	private var _tField:TextField;
	
	public function Inf(){
		init();
	}
	
	private function init():void{
		_tField=new TextField();
		var fmt:TextFormat=new TextFormat("Arial",18);
		_tField.defaultTextFormat=(fmt)
		_tField.multiline=true;
		_tField.width=300;
		_tField.wordWrap=true;
		addChild(_tField);
	}
	
	public function set text(txt:String):void{
		_tField.text=txt;
	}
}