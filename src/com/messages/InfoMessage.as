package com.messages
{
	import com.constants.Dimentions;
	import com.gamification.RepresentationtypeController;
	import com.representation.RepresentationType;
	import com.view.gui.Btn;
	import com.view.gui.RadioGroup;
	import com.view.gui.SafeButton;
	import com.view.tools.AssetsManager;
	
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;

	public class InfoMessage extends AbstractMessage
	{
		private var _resetButton:SafeButton;
		private var _representationList:RadioGroup;
		public var onReset:Signal = new Signal();
		public function InfoMessage()
		{
		}
		
		override protected function addContent():void{
			
			var line:Shape = new Shape();
			line.graphics.lineStyle(1,0xFFFFFF);
			line.graphics.drawRect(bg.x,bg.y+430,bg.width,2)
			addChild(line);
			
			var vLine:Shape = new Shape();
			vLine.graphics.lineStyle(1,0xFFFFFF);
			vLine.graphics.drawRect(bg.x+bg.width/2,bg.y+430,2,bg.height-430)
			addChild(vLine);
			
			var regFormat:TextFormat = new TextFormat("ZapfDingbatsITC",22,0xFFFFFF);
			
			var tField:TextField = new TextField();
			tField.text = "The Recyclers";
			tField.autoSize = TextFieldAutoSize.LEFT;
			
			var how2Play:TextField = new TextField();
			how2Play.htmlText = "<a href='http://www.example.com' target='_blank'>How to play:</a>";
			how2Play.autoSize = TextFieldAutoSize.LEFT;
			
			
			var resetText:TextField = new TextField();
			resetText.text = "Reset Game:";
			resetText.autoSize = TextFieldAutoSize.LEFT;
			
			var resetInfo:TextField = new TextField();
			resetInfo.width=300;
			resetInfo.text = "Long press will delete \nall recorded data";
			resetInfo.setTextFormat(new TextFormat("ZapfDingbatsITC",18,0xFFFFFF));
			resetInfo.autoSize = TextFieldAutoSize.LEFT;

			var representationText:TextField = new TextField();
			representationText.text = "Different Notes \nRepresentation:";
			representationText.autoSize = TextFieldAutoSize.LEFT;
			
			//content.addChild(tField);
			tField.y=10;
			tField.x=5;
			
			content.addChild(how2Play);
			how2Play.y=5;
			how2Play.x=5;
			
			
			content.addChild(resetText);
			resetText.y=440;
			//resetText.x=5;
			content.addChild(representationText);
			representationText.x = bg.width/2+5;
			representationText.y=440;
			content.addChild(resetInfo);
			resetInfo.y=480;
			
			
			tField.setTextFormat(new TextFormat("ZapfDingbatsITC",28,0xFFFFFF,true))
			how2Play.setTextFormat(regFormat);
			resetText.setTextFormat(regFormat);
			representationText.setTextFormat(regFormat);
			
			_resetButton = new SafeButton(AssetsManager.getAssetByName('restart.png'));
			content.addChild(_resetButton);
			_resetButton.pressComplete.add(onResetPressed);
			_resetButton.y=440;
			_resetButton.x=270;
			addRadioGroup();
		}
		
		private function addRadioGroup():void{
			_representationList = new RadioGroup();
			_representationList.addButton(new Btn("autoBtn.png","autoBtn_selected.png"));
			_representationList.addButton(new Btn("numBtn.png","numBtn_selected.png"));
			_representationList.addButton(new Btn("symbolBtn.png","symbolBtn_selected.png"));
			_representationList.addButton(new Btn("noteBtn.png","noteBtn_selected.png"));
			_representationList.change.add(onRepresentationChanged);
			_representationList.selectedIndex=0;
			content.addChild(_representationList);
			_representationList.x=bg.width - _representationList.width - 30;
			_representationList.y=440;
			//_representationList.scaleX=0.8;
			//_representationList.scaleY=0.8;
		}
		
		private function onRepresentationChanged():void{
			var representationController:RepresentationtypeController = RepresentationtypeController.getInstane();
			switch(_representationList.selectedIndex){
				case 1:
					representationController.displayType = RepresentationType.NUMBERS;
					break;
				case 2:
					representationController.displayType = RepresentationType.VISUALS;
					break;
				case 3:
					representationController.displayType = RepresentationType.NOTES;
					break;
			}
		}
	
		private function onResetPressed():void{
			onReset.dispatch();
		}
		
		
		override public function start():void{
			_resetButton.reset();
		}
	}
}