package com.screens.view
{
	import com.notes.RecordScreenNotes;
	import com.representation.Representation;
	import com.screens.lyrics.LyricView;
	
	import org.osflash.signals.Signal;
	

	public class MusicalScreen extends AbstractScreen{
		
		
		protected var isInited:			Boolean = false;

		public function MusicalScreen(){
		}
		
		
		
		override public function start():void{
			super.start();
			
		}
		
		override public function stop():void{
		}
		
		public function reset():void{
			
		}
		
		
		override protected function layout():void{
			super.layout();
			
		}
		
		//_____________IProgressable  START
		
		public function get currentScreen():IScreen{
			return this;
		}
		
		public function progress():Boolean{
			return false;
		}
		
		public function rewind():Boolean{
			return false;
		}
		
		public function get activityLength():uint{
			return 1;
		}
		public function get activeScreenIndex():uint{
			return 0;
		}
		
		public function get children():Vector.<IScreen>{
			var chldren:Vector.<IScreen> = new Vector.<IScreen>();
			chldren.push(this);
			return chldren;
			
		}
			
		
		
	}
}