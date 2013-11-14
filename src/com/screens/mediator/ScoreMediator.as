package com.screens.mediator
{
	import com.constants.Dimentions;
	import com.constants.Session;
	import com.gskinner.motion.GTween;
	import com.model.FileProxy;
	import com.screens.recordScreenStates.RecordState;
	import com.view.tools.AssetsManager;
	
	import flash.events.Event;

	public class ScoreMediator
	{
		private var _recordState:RecordState;
		private var _pauseCounter:int=0;
		private var _scores:Vector.<scoreData>;
		private var _scorePanel:ScorePanel;
		private var _score:int=0;
		
		public function ScoreMediator(recordState:RecordState){
			_recordState = recordState;
			_recordState.scoreSignal.add(onScoreSignal)
			_recordState.pauseSignal.add(onPauseSignal)
			_scores = new Vector.<scoreData>();
			_scorePanel = new ScorePanel(_recordState.thumbNail);
			_recordState.view.addChild(_scorePanel);
			_scorePanel.x=22;
			_scorePanel.y=28;
			scorePanelVisible();
			Session.improviseSignal.add(scorePanelVisible);
		}
		
//		public function get wrongNotes():uint
//		{
//			return _wrongNotes;
//		}
//
//		public function get accuracy():int
//		{
//			return Math.max(100-(_accuracy/_scores.length)*10);
//		}

		public function get score():int{
			return _score;
		}
		
		public function set active(flag:Boolean):void{
			if(flag){
				_score=0;
				_scorePanel.setScore(_score);
				_recordState.scoreSignal.add(onScoreSignal)
				_recordState.pauseSignal.add(onPauseSignal)
			}else{
				_recordState.scoreSignal.remove(onScoreSignal)
				_recordState.pauseSignal.remove(onPauseSignal)
				_recordState.view.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			}
		}
		
		private function scorePanelVisible():void{
			_scorePanel.visible = !Session.IMPROVISE_MODE;
		}
		
		private function onPauseSignal(val:Boolean):void
		{
			if(!val){
				_recordState.view.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			}else{
				_pauseCounter=0;
				_recordState.view.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			}
			
		}
		
		private function onEnterFrame(e:Event):void{
			_pauseCounter++;
			if(_pauseCounter>100){
				_recordState.showHint();
			}
			if(_pauseCounter>16){
				_recordState.toPlayNote.setState(1);
			}
			else if(_pauseCounter>32){
				_recordState.toPlayNote.setState(0);
			}
		}
		private function onScoreSignal(toPlayTime:int,curTime:int,goodNote:Boolean,xx:uint=0):void
		{
			_pauseCounter=0;
			if(!goodNote){
				if(xx>0){
					showScoreFeedBack("X",130,xx,0xE82C0C);
				}
				return;
			}
			
			
			//combo
			_scores.push(new scoreData(_recordState.toPlayNote.scoreValue,toPlayTime));
			if(_recordState.toPlayNote.scoreValue>0){
				showScoreFeedBack("+"+_recordState.toPlayNote.scoreValue,130,_recordState.toPlayNote.x,_recordState.toPlayNote.scoreColor);
			}
			_score = _score + _recordState.toPlayNote.scoreValue;
			_scorePanel.setScore(_score);
		}
		private function showScoreFeedBack(str:String,yOffset:int,xOffset:int,color:int):void{
			var _scoreFeedBack:ScoreFeedBack = new ScoreFeedBack(str,color);
			_recordState.view.addChild(_scoreFeedBack);
			_scoreFeedBack.x=xOffset//(Dimentions.WIDTH-_scoreFeedBack.width)/2;
			_scoreFeedBack.y=(Dimentions.HEIGHT-_scoreFeedBack.height)/5+yOffset;
			var gt:GTween = new GTween(_scoreFeedBack,1.5,{alpha:0,scaleX:1.2,scaleY:1.2});
			gt.onComplete = function():void{_recordState.view.removeChild(_scoreFeedBack)}
			gt.onChange = function():void{ _scoreFeedBack.y=(Dimentions.HEIGHT-_scoreFeedBack.height)/5+yOffset}
		}
	}
}
import com.view.tools.AssetsManager;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.filters.GlowFilter;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

class ScoreFeedBack extends Sprite{
	private var _txt:TextField;
	function ScoreFeedBack(str:String,color:int){
		_txt = new TextField();
		_txt.autoSize = TextFieldAutoSize.LEFT;
		_txt.text = str;
		addChild(_txt);
		_txt.setTextFormat(new TextFormat("Arial",32,color))
	}
	
}

class scoreData{
	
	public var scoreTime:int;
	public var value:int;
	public var wasInCombo:Boolean=false;
	public var wasInSequance:Boolean=false;
	
	function scoreData(_value:int,_scoreTime:int):void{
		scoreTime=_scoreTime;
		value=_value;
		//trace("value=",value)
	}
	
	public function get score():int{
		var calcScore:int=1; // default for 0
		if(value>0&&value<=9){
			calcScore=1;
		}else if(value>9){
			calcScore=2;
		}else if(value==-1){
			calcScore=-1;
		}
		return calcScore;
	}
}

class ScorePanel extends Sprite{
	private var _scoreField:TextField;
	public function ScorePanel(tmb:String){
		addChild(AssetsManager.getAssetByName("scoreBg.png"));
		_scoreField = new TextField();
		_scoreField.width=130;
		_scoreField.x = 6;
		_scoreField.y=16;
		_scoreField.autoSize = TextFieldAutoSize.CENTER;
		_scoreField.defaultTextFormat = new TextFormat("Helvetica",32,0x4db9e0);
		addChild(_scoreField);
		_scoreField.text ="0";
		var icon:DisplayObject;
		switch(tmb){
			case "bottles.png":
				icon = AssetsManager.getAssetByName("icon_bottles.png");
				break;
			case "drum.png":
				icon = AssetsManager.getAssetByName("icon_drums.png");
				break;
			case "bass_flash.jpg":
				icon = AssetsManager.getAssetByName("icon_bass.png");
				break;
			case "turnTable":
			case "loopee":
				icon = AssetsManager.getAssetByName("icon_mic.png");
				break;
		}
		if(icon){
			addChild(icon);
			icon.y=20;
			icon.x=10;
			icon.alpha=0.75;
			//icon.filters = [new GlowFilter(0XFFFFFF)]
		}
		addChild(AssetsManager.getAssetByName("scoreCover.png"));
	}
	
	public function setScore(score:int):void{
		_scoreField.text = score.toString();
	}
}