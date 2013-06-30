package com.inf
{
	import com.constants.Dimentions;
	import com.container.Presenter;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.utils.Dictionary;

	public class PopUpsManager
	{
		private  var _presenter:Presenter;
		private  var _popUp:PopUp;
		private  var _thumbNail:String;
		private var _mask:Sprite;
		
		public function PopUpsManager(presenter:Presenter,thumbNail:String)
		{
			_presenter=presenter;
			_thumbNail = thumbNail;
			_mask = new Sprite();
			_mask.graphics.beginFill(0xFFFFFF,0.3);
			_mask.graphics.drawRect(0,0,Dimentions.WIDTH,Dimentions.HEIGHT);
			_mask.graphics.endFill();
		}
		
		public function openPopUp(accuracy:uint,wrongNotes:uint,insScore:uint):PopUp{
			_presenter.addChild(_mask);
			_popUp = new PopUp();
			_presenter.addChild(_popUp);
			_popUp.thumbNail = _thumbNail;
			_popUp.setScore(accuracy,wrongNotes,insScore);
			//_popUp.title=title;
			//_popUp.content=content;
			_popUp.open();
			_popUp.x=(Dimentions.WIDTH-_popUp.width)/2
			_popUp.y=(Dimentions.HEIGHT-_popUp.height)/3
			_popUp.nextSignal.add(onNext)
			_popUp.tryAgainSignal.add(closePopUp)
			return _popUp;
		}
		
		private function onNext():void
		{
			closePopUp()
			Presenter(_presenter).goNext.dispatch();
		}
		
		private function closePopUp():void{
			_presenter.removeChild(_mask);
			_presenter.removeChild(_popUp);
			_popUp.nextSignal.remove(onNext)
			_popUp.tryAgainSignal.remove(onNext)
		}
		
		

	}
}

