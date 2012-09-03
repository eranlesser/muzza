package com.screens.view
{
	import com.constants.Dimentions;
	import com.model.rawData.Data;
	import com.screens.view.components.homePage.SongsMenu;
	import com.view.tools.AssetsManager;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;

	public class HomePage extends AbstractScreen
	{
		private var _songMenu:	SongsMenu;
		public var tutorialRequest:Signal=new Signal();
		public function HomePage(){
			init();
		}
		
		private function init():void{
		//	var bg:DisplayObject=addChild(AssetsManager.getAssetByName("BCKGR_1.png"));
			var countingRhtym:TextField = new TextField();
			countingRhtym.text="TrainBets";
			//addChild(countingRhtym);
			//bg.width=Dimentions.WIDTH;
			//bg.height=Dimentions.HEIGHT;
			countingRhtym.x=100;
			countingRhtym.y=100;
			countingRhtym.setTextFormat(new TextFormat("Papyrus",36,0x111111));
			countingRhtym.autoSize=TextFieldAutoSize.LEFT;
			
			var theRecyclers:TextField = new TextField();
			theRecyclers.text="The Recyclers";
			//addChild(theRecyclers);
			theRecyclers.x=100;
			theRecyclers.y=200;
			theRecyclers.setTextFormat(new TextFormat("Chalkduster",26,0x111111));
			theRecyclers.autoSize=TextFieldAutoSize.LEFT;
			
			var howToPlay:TextField = new TextField();
			howToPlay.text="How To Play";
			//addChild(howToPlay);
			howToPlay.x=100;
			howToPlay.y=300;
			howToPlay.setTextFormat(new TextFormat("arial",18,0x023E73));
			howToPlay.autoSize=TextFieldAutoSize.LEFT;
			howToPlay.addEventListener(MouseEvent.CLICK,onTutorialRequest);
			
			_songMenu=new SongsMenu();
			_songMenu.data=XML(Data.xml.lessons);
			addChild(_songMenu);
			_songMenu.y=400;
			//_songMenu.x=320;
		}
		
		private function onTutorialRequest(e:Event):void{
			tutorialRequest.dispatch();
		}
		
		public function get songMenu():SongsMenu{
			return _songMenu;
		}
		
		
	}
}