package com.inf
{
	import com.constants.Dimentions;
	import com.container.Presenter;
	import com.container.navigation.Navigator;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;

	public class TutorialManager
	{
		private  var _presenter:Presenter;
		private  var _popUp:Inf;
		private var _mask:Sprite;
		public var tutorialSignal:Signal = new Signal();
		public function TutorialManager(presenter:Presenter)
		{
			_presenter=presenter;
			_presenter.tutorialSignal.add(onTutorialEvent);
			_mask = new Sprite();
			_mask.graphics.beginFill(0xFFFFFF,0.3);
			_mask.graphics.drawRect(0,0,Dimentions.WIDTH,Dimentions.HEIGHT);
			_mask.graphics.endFill();
		}
		
		private function onTutorialEvent(signal:uint):void
		{
			tutorialSignal.dispatch(signal);
			
		}
		
		public function get navigator():Navigator{
			return _presenter.menu.navigator ;
		}
		
		
		public function openInstruction(title:String,content:String,xx:uint,yy:uint,thumbNail:String,dir:String):void{
			_popUp = new Inf(300,dir);
			//_presenter.addChild(_mask);
			_presenter.addChild(_popUp);
			_popUp.thumbNail = thumbNail;
			_popUp.addTitle(title);
			_popUp.addContent(content);
			_popUp.open();
			_popUp.x=xx//(Dimentions.WIDTH-popUp.width)/2
			_popUp.y=yy//(Dimentions.HEIGHT-popUp.height)/3
			//_closeEvent = closeEvent;
		}
		
		public function openPop(title:String,content:String,xx:uint,yy:uint,thumbNail:String):void{
			_popUp = new Inf(300,Inf.NO_ARROW);
			//_presenter.addChild(_mask);
			_presenter.addChild(_popUp);
			_popUp.thumbNail = thumbNail;
			_popUp.addTitle(title);
			_popUp.addContent(content);
			_popUp.open();
			_popUp.x=xx//(Dimentions.WIDTH-popUp.width)/2
			_popUp.y=yy//(Dimentions.HEIGHT-popUp.height)/3
			_popUp.addNext();
		}
		
		private function onNext():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function closePopUp():void{
			//_presenter.removeChild(_mask);
			if(_popUp&&_popUp.parent)
			_presenter.removeChild(_popUp as DisplayObject);
		}
		
		
	}
}
