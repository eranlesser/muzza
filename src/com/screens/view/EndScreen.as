package com.screens.view
{
	import com.constants.Dimentions;
	import com.gui.hat.Hat;
	import com.utils.Claps;
	import com.view.gui.Btn;
	
	import flash.events.Event;

	public class EndScreen extends DemoScreen
	{
		private var _hat:				Hat;
		private var _claps:				Claps;
		public function EndScreen(){
			
		}
		
		override public function start():void{
			super.start();
			if(!isInited){
				
				//addHat();
				//_claps = new Claps();
			}else{
				//_representation.visible=true;
			}
			
		}
		
		override protected function init(masked:Boolean=true):void{
			super.init(false);
			addHat();
			_claps = new Claps();
			//_representation.visible=true;
		}
		
		override public function stop():void{
			super.stop();
			_hat.reset();
			_claps.stop();
		}
		
		private function addHat():void{
			_hat = new Hat();
			_stageLayer.addChild(_hat);
			_hat.x=Dimentions.WIDTH-_hat.width-10;
			_hat.y=380;
			_hat.start();
		}
		
		override protected function endMusciPiece():void{
			_claps.play();
			_hat.fillHat();
			//_representation.stop();
			super.endMusciPiece();
		}
	}
}