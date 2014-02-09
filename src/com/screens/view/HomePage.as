package com.screens.view
{
	import com.model.rawData.Data;
	import com.screens.view.components.homePage.SongsMenu;
	import com.view.gui.Btn;
	import com.view.tools.AssetsManager;

	public class HomePage extends AbstractScreen
	{
		private var _songMenu:	SongsMenu;
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
			
		}
		
		
		
		
		public function get songMenu():SongsMenu{
			return _songMenu;
		}
		
		
	}
}
import com.constants.Dimentions;
import com.gskinner.motion.GTween;
import com.mailchimp.subscribe;
import com.view.gui.Btn;
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.URLRequest;
import flash.net.navigateToURL;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

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
	private var email:TextField = new TextField();
	private function addSubscribe():void{
//		var tField:TextField = new TextField();
//		tField.width=400;
//		tField.height=400;
//		tField.multiline=true;
//		tField.htmlText="<div>Exciting new features are comming soon, <br> subscribe for updates: </div>"
//		tField.setTextFormat(new TextFormat("Verdana",18,0xFFFFFF,null,null,null,null,null,TextAlign.LEFT));
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
		var line:Shape = new Shape();
		line.graphics.lineStyle(3,0x111111,0.8);
		line.graphics.lineTo(880,0);
		line.graphics.moveTo(0,0);
		addChild(line);
		line.y=460;
		line.x=(Dimentions.WIDTH-line.width)/2;
		
		var tField:TextField = new TextField();
		addChild(tField);
		tField.autoSize = TextFieldAutoSize.LEFT;
		tField.text = "Stay tuned, we have exciting updates coming soon:";
		tField.x=70;
		tField.y=495;
		tField.setTextFormat(new TextFormat("Verdana",18,0xFFFFFF,null,null,null,null,null,TextFormatAlign.LEFT));
		
		
		email.type = TextFieldType.INPUT;
		email.border=true;
		email.borderColor=0x111111;
		email.background=true;
		email.backgroundColor=0xFFFFFF;
		//email.background=true;
		email.width=220;
		email.height=30;
		addChild(email);
		email.x=565;
		email.y=495;
		email.defaultTextFormat = (new TextFormat("Verdana",16,0x111111,null,null,null,null,null,TextFormatAlign.LEFT));
		var fb:Btn=new Btn("facebook.png","facebook.png");
		addChild(fb);
		fb.x=905;
		fb.y=495;
		fb.clicked.add(onFaceBook);
		var tw:Btn=new Btn("twitter.png","twitter.png");
		addChild(tw);
		tw.x=850;
		tw.y=495;
		tw.clicked.add(onTwitter);
		var mail:Btn=new Btn("mail.png","mail.png");
		addChild(mail);
		mail.x=790;
		mail.y=495;
		mail.clicked.add(onMail);
	}
	
	private function onFaceBook(id:String):void{
		// navigate to http://www.facebook.com/TrainBeats
		var url:URLRequest = new URLRequest("http://www.facebook.com/TrainBeats");
		navigateToURL(url, "_blank");
	}
	private function onTwitter(id:String):void{
		// https://twitter.com/TrainBeats
		var url:URLRequest = new URLRequest("https://twitter.com/TrainBeats");
		navigateToURL(url, "_blank");
	}
	private function onMail(id:String):void{
		if(email.text!=""){
			var sucscribe:subscribe = new subscribe("us6","81ad977f3622acbeeb9f9db111625ea0-us6","97a5200186",email.text,"eran", "lesser");
			//Flurry.logEvent("email added "+email.text);
			email.text="Thank You!";
		}
	}
	
	private function addPeople():void{
		var tField:TextField = new TextField();
		tField.width=920;
		tField.height=820;
		tField.multiline=true;
		tField.defaultTextFormat = (new TextFormat("Verdana",22,0xFFFFFF,null,null,null,null,null,TextFormatAlign.CENTER));
		tField.htmlText = "<div> Production & Development: <a href='http://www.creativelamas.com'>Creative Lamas</a></div><br><br>" +
			"<div> Art & Animations: <a href='http://www.lefrenchbulldog.com'>LeFrenchBulldog</a> </div><br><br>" +
			"<div> UX: <a href='http://vicadesign.me'>Vica</a> </div><br><br>" +
			"<div> Sound Production: <a href='http://www.moca.co.il'>Moca Studio</a></div><br><br>" +
			"<div> The Human Bass: Idan </div><br><br><br>" +
			"<div> Special Thanks To:</ul></div><br><br><br>" +
			"<div> Avi & Nitzan Berger: Music & Sounds prototyping</div><br><br><br>" +
			"<div> Dear supporting parents & family </div><br><br><br>" +
			"<div> Sima & Alma </div><br><br><br><br>"+
			"<font size='18'> We have awsome updates comming soon, sucsribe below to keep in touch. </font><br>" +
			"<font size='18' align='left'> Thank you for downlodaing TrainBeats !</font> <br><br> " +
			"<font size='18' align='left'><a href='mailto:creativelamas@gmail.com'>Eran Lesser creativelamas@gmail.com</a> </font>";
			
			
			;
		
		addChild(tField);
		tField.x=(Dimentions.WIDTH-tField.width)/2;
		tField.y=Dimentions.HEIGHT-250;
		_tween = new GTween(tField,30,{y:-tField.height});
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
			bg.graphics.beginFill(0x323232);
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