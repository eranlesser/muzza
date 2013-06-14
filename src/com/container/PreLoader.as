package com.container
{
	import com.constants.Dimentions;
	import com.model.rawData.Data;
	import com.musicalInstruments.Band;
	import com.musicalInstruments.view.character.Character;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;
	
	public class PreLoader extends Sprite{
		
		public var loaded:Signal=new Signal();
		public function PreLoader(){
			init();
		}
		
		private function initBand(e:Event):void{
			for each(var characterXml:XML in XML(Data.xml.musicians).children()){
				var character:Character=new Character(characterXml.@spriteSheet,characterXml.@positionsLength,characterXml.@width,characterXml.@height);
				Band.instance.initCharacter(character);
				addChildAt(character,0);
			}
			loaded.dispatch();
		}
		
		private function init():void{
			var logo:DisplayObject = AssetsManager.getAssetByName("logo.png")
			addChild(logo);
			logo.x=(Dimentions.WIDTH-logo.width)/2
			logo.y=(Dimentions.HEIGHT-logo.height)/2
			//for each(var characterXml:XML in Data.xml.musicians){
			var tmr:Timer=new Timer(500,1);
			tmr.addEventListener(TimerEvent.TIMER_COMPLETE,initBand);
			tmr.start();
			//}
		}
	}
}