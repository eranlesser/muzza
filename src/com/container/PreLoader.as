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
		[Embed(source="../../assets/melody.jpg")]
		private var bg:Class;
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
		private var logo:DisplayObject 
		private function init():void{
			logo = new bg() as DisplayObject;
			addChild(logo);
			logo.x=(Dimentions.WIDTH-logo.width)/2
			logo.y=(Dimentions.HEIGHT-logo.height)/2
			//for each(var characterXml:XML in Data.xml.musicians){
			
			var assetsManage:AssetsManager = new AssetsManager();
			assetsManage.complete.addOnce(onLoaded);
			//}
		}
		
		private function onLoaded():void{
				var tmr:Timer=new Timer(2000,1);
				tmr.addEventListener(TimerEvent.TIMER_COMPLETE,initBand);
				tmr.start();
				//new GTween(logo,3,{alpha:0})
				
		}
	}
}