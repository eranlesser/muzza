package com.screens.view
{
	import com.constants.Dimentions;
	import com.model.rawData.Data;
	import com.screens.view.components.homePage.SongsMenu;
	import com.view.gui.Btn;
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
		private var _credits:Credits;
		public function HomePage(){
			init();
		}
		
		private function init():void{
			
			_songMenu=new SongsMenu();
			_songMenu.data=XML(Data.xml.lessons);
			addChild(_songMenu);
			addChild(AssetsManager.getAssetByName("WAGON_TRAIN.png"));
			//_songMenu.y=200;
			//_songMenu.x=320;
			var creditsBut:Btn = new Btn("CREDITS_IDLE.png","CREDITS_PRESSED.png");
			addChild(creditsBut);
			creditsBut.x=140;
			creditsBut.y=110;
			creditsBut.clicked.add(openCredits);
		}
		
		private function openCredits(str:String):void{
			if(!_credits){
				_credits = new Credits();
				_credits.close.add(function close():void{removeChild(_credits)});
			}
			addChild(_credits);
		}
		
		public function get songMenu():SongsMenu{
			return _songMenu;
		}
		
		
	}
}
import com.constants.Dimentions;
import com.gskinner.motion.GTween;
import com.view.gui.Btn;
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.text.TextInteractionMode;

import flashx.textLayout.formats.TextAlign;

import org.osflash.signals.Signal;

class Credits extends Sprite{
	public var close:Signal = new Signal();
	private var _tween:GTween;
	public function Credits(){
		init();
		addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
		addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
	}
	
	private function onMouseDown(e:Event):void{
		_tween.paused=true;
	}
	private function onMouseUp(e:Event):void{
		_tween.paused=false;
	}
	
	private function addSubscribe():void{
//		var tField:TextField = new TextField();
//		tField.width=400;
//		tField.height=400;
//		tField.multiline=true;
//		tField.htmlText="<div>Exciting new features are comming soon, <br> subscribe for updates: </div>"
//		tField.setTextFormat(new TextFormat("Vardena",18,0xFFFFFF,null,null,null,null,null,TextAlign.LEFT));
//		
//		addChild(tField);
//		tField.x=70;
//		tField.y=80;
//		var email:TextField = new TextField();
//		email.type = TextFieldType.INPUT;
//		email.border=true;
//		email.borderColor=0xFFFFFF;
//		//email.background=true;
//		email.width=300;
//		email.height=30;
//		addChild(email);
//		email.x=70;
//		email.y=140;
		var fb:DisplayObject=AssetsManager.getAssetByName("facebook.png");
		addChild(fb);
		fb.x=90;
		fb.y=495;
		var tw:DisplayObject=AssetsManager.getAssetByName("twitter.png");
		addChild(tw);
		tw.x=160;
		tw.y=495;
		var mail:DisplayObject=AssetsManager.getAssetByName("mail.png");
		addChild(mail);
		mail.x=520;
		mail.y=495;
	}
	
	private function addPeople():void{
		var tField:TextField = new TextField();
		tField.width=920;
		tField.height=600;
		tField.multiline=true;
		tField.htmlText = "<div> Production & Development: <a href='http://www.creativelamas.com'>Creative Lamas</a></div><br><br>" +
			"<div> Art & Animations: <a href='http://www.lefrenchbulldog.com'>LeFrenchBulldog</a> </div><br><br>" +
			"<div> Sound Production: <a href='http://www.moca.co.il'>Moca Studio</a></div><br><br>" +
			"<div> The Human Bass: Idan </div><br><br><br>" +
			"<div> Special Thanks To:</ul></div><br><br><br>" +
			"<div> Yair Katz, Yoran Bar: UX</div><br><br>" +
			"<div> Avi & Nitzan Berger: Music & Sounds prototyping</div><br><br><br>" 
			//"<div> My loving and supporting parents </div><br><br><br><br>" +
			//"<div> Sima & Alma </div>"
			
			;
		tField.setTextFormat(new TextFormat("Vardena",22,0xFFFFFF,null,null,null,null,null,TextAlign.CENTER));
		
		addChild(tField);
		tField.x=(Dimentions.WIDTH-tField.width)/2;
		tField.y=tField.height+50;
		_tween = new GTween(tField,25,{y:-tField.height});
		_tween.repeatCount=0;
		var msk:Shape = new Shape();
		msk.graphics.beginFill(0xFFFFFF);
		msk.graphics.drawRect(40,40,940,350);
		msk.graphics.endFill();
		addChild(msk);
		msk.y=40;
		tField.mask=msk;
	}
	protected function init():void{
			var bg:Shape = new Shape();
			bg.graphics.beginFill(0x333333);
			bg.graphics.drawRect(50,30,920,560);
			bg.graphics.endFill();
			addChild(bg);
			var mask:Shape=new Shape();
			mask.graphics.beginFill(0xFFFFFF);
			mask.graphics.drawRect(6,10,940,580);
			mask.graphics.endFill();
			mask=mask;
			var frame:DisplayObject =AssetsManager.getAssetByName("DEMO_SCREEN_FRAME.png");
			addChild(frame)
			frame.x=29;
			frame.y=19;
			mask.x=29;
			mask.y=19;
			
			var closeBtn:Btn = new Btn("CLOSE_BUTTON_IDLE.png","CLOSE_BUTTON_SELECTED.png");
			addChild(closeBtn);
			closeBtn.x=950;
			closeBtn.y=19;
			closeBtn.clicked.add(onClose);
			addPeople();
			addSubscribe();
	}
	private function onClose(btnid:String):void{
		_tween.end();
		_tween.init();
		close.dispatch();
	}
}