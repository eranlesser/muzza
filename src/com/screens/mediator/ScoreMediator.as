package com.screens.mediator
{
	import com.constants.Dimentions;
	import com.gskinner.motion.GTween;
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
		private var _accuracy:int;
		private var _wrongNotes:uint=0;
		
		public function ScoreMediator(recordState:RecordState){
			_recordState = recordState;
			_recordState.scoreSignal.add(onScoreSignal)
			_recordState.pauseSignal.add(onPauseSignal)
			_scores = new Vector.<scoreData>();
			_scorePanel = new ScorePanel(_recordState.thumbNail);
			_recordState.view.addChild(_scorePanel);
		}
		
		public function get wrongNotes():uint
		{
			return _wrongNotes;
		}

		public function get accuracy():int
		{
			return 100-(_accuracy/_scores.length)*10;
		}

		public function get score():int{
			return _score;
		}
		
		public function set active(flag:Boolean):void{
			if(flag){
				_score=0;
				_accuracy=0;
				_wrongNotes=0;
				_scorePanel.setScore(_score);
				_recordState.scoreSignal.add(onScoreSignal)
				_recordState.pauseSignal.add(onPauseSignal)
			}else{
				_recordState.scoreSignal.remove(onScoreSignal)
				_recordState.pauseSignal.remove(onPauseSignal)
				_recordState.view.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			}
		}
		
		public function set visible(isImproviseMode:Boolean):void{
			_scorePanel.visible = !isImproviseMode;
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
		}
		
		private function onScoreSignal(toPlayTime:int,curTime:int):void
		{
			if(toPlayTime==-1){
				_wrongNotes++;
				_scores.push(new scoreData(-1,-1));
				return;
			}
			//trace(toPlayTime,curTime,_pauseCounter);
			var value:int ;
			if(_pauseCounter>0){ // late
				value = 10 - _pauseCounter;
				_accuracy = _accuracy+_pauseCounter;
			}else{  // early
				value = 10 - (toPlayTime - curTime);
				_accuracy = _accuracy+(toPlayTime - curTime);
			}
			_scores.push(new scoreData(Math.max(value,0),toPlayTime));
			if(_scores[_scores.length-1].score==2){
				showScoreFeedBack("+2",0,0xECF0F1);
				_score = _score + 2 ;
			}
			_pauseCounter=0;
			
			//combo
			var isCombo:Boolean=true;
			const comboLength:uint=5;
			var i:int;
			for(i=_scores.length-1;i>_scores.length-comboLength;i--){
				if(i<0 || _scores[i].value<=8 || _scores[i].wasInCombo){
					isCombo=false;
					break;
				}
			}
			if(isCombo){
				showScoreFeedBack("Awesome +6",100,0x3498DB);
				_score = _score + 6 ;
				for(i=_scores.length-1;i>_scores.length-comboLength;i--){
					_scores[i].wasInCombo = true;
				}
			}
			//sequance
			var isSequance:Boolean=true;
			const sequanceLength:uint=12;
			var n:int;
			for(n=_scores.length-1;n>_scores.length-sequanceLength;n--){
				if(n<0 || _scores[n].value<0 || _scores[n].wasInSequance){
					isSequance=false;
					break;
				}
			}
			if(isSequance){
				showScoreFeedBack("Bonus +4",50,0x50AC6A);
				_score = _score + 4 ;
				for(i=_scores.length-1;i>_scores.length-sequanceLength;i--){
					_scores[i].wasInSequance = true;
				}
			}
			_score = _score + _scores[_scores.length-1].score;
			_scorePanel.setScore(_score);
		}
		private function showScoreFeedBack(str:String,yOffset:int,color:int):void{
			var _scoreFeedBack:ScoreFeedBack = new ScoreFeedBack(str,color);
			_recordState.view.addChild(_scoreFeedBack);
			_scoreFeedBack.x=(Dimentions.WIDTH-_scoreFeedBack.width)/2;
			_scoreFeedBack.y=(Dimentions.HEIGHT-_scoreFeedBack.height)/5+yOffset;
			var gt:GTween = new GTween(_scoreFeedBack,1.5,{alpha:0.2,scaleX:1.2,scaleY:1.2});
			gt.onComplete = function():void{_recordState.view.removeChild(_scoreFeedBack)}
			gt.onChange = function():void{_scoreFeedBack.x=(Dimentions.WIDTH-_scoreFeedBack.width)/2; _scoreFeedBack.y=(Dimentions.HEIGHT-_scoreFeedBack.height)/5+yOffset}
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
		_txt.setTextFormat(new TextFormat("Arial",30,color))
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
		this.graphics.beginFill(0xFFFFFF,0.2);
		this.graphics.lineStyle(2,0x999999,0.4);
		this.graphics.drawRect(6,8,120,38);
		this.graphics.endFill();
		_scoreField = new TextField();
		_scoreField.width=130;
		_scoreField.x = 14;
		_scoreField.y=10;
		_scoreField.autoSize = TextFieldAutoSize.CENTER;
		_scoreField.defaultTextFormat = new TextFormat(null,34,0xFFFFFF);
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
				icon = AssetsManager.getAssetByName("icon_mic.png");
				break;
		}
		if(icon){
			addChild(icon);
			icon.y=11;
			icon.x=12;
			//icon.filters = [new GlowFilter(0XFFFFFF)]
		}
	}
	
	public function setScore(score:int):void{
		_scoreField.text = score.toString();
	}
}