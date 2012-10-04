package com.screens.mediator
{
	import com.constants.Rhythms;
	import com.representation.view.SpeedSlider;
	import com.screens.view.RecordScreen;

	public class SpeedMediator
	{
		private var _speedControl:SpeedSlider;
		private var _view:RecordScreen;
		public function SpeedMediator()
		{
		}
		
		public function registerSpeedSlider(speedSlider:SpeedSlider):void{
			_speedControl=speedSlider;
		}
		
		public function registerView(screen:RecordScreen):void{
			_view=screen;
		}
		
		private function onSpeedSlider(value:Number):void{
			Rhythms.RECORD_SPEED=value;
		}
	}
}