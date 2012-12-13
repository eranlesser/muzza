package com.musicalInstruments.palleta.views.components
{
	import com.gskinner.motion.GTween;
	import com.musicalInstruments.palleta.Sounder;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	public class Pali extends Sprite{
		public var playSound:Signal = new Signal();
		private var _soundFile:String;
		private var _soundPlayer:Sounder;
		public function Pali(noteId:String,soundFile:String){
			_soundFile = soundFile;
			_soundPlayer = new Sounder(noteId,_soundFile);
			init();
		}
		
		private function init():void{
			this.graphics.beginFill(0xFFFFF);
			this.graphics.drawCircle(0,0,10);
			this.graphics.endFill();
			this.alpha=0;
		}
		
		public function activate():void{
			this.addEventListener(MouseEvent.MOUSE_OVER,onMouseOver);
		}
		
		public function deActivate():void{
			this.removeEventListener(MouseEvent.MOUSE_OVER,onMouseOver);
		}
		
		private function onMouseOver(e:MouseEvent):void{
			playSound.dispatch();
			this.alpha=1;
			new GTween(this,0.5,{alpha:0})
		}
		
		public function get soundFile():String{
			return _soundFile;
		}
	}
}