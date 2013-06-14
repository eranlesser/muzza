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
		
		public function ScoreMediator(recordState:RecordState){
			_recordState = recordState;
			_recordState.scoreSignal.add(onScoreSignal)
			_recordState.pauseSignal.add(onPauseSignal)
			_scores = new Vector.<scoreData>();
			_scorePanel = new ScorePanel(_recordState.thumbNail);
			_recordState.view.addChild(_scorePanel);
		}
		
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
			}
		}
		
		public function set visible(isImproviseMode:Boolean):void{
			_scorePanel.visible = !isImproviseMode;
		}
		
		private function onPauseSignal(val:Boolean):void
		{
			trace("_pauseCounter",_pauseCounter)
			// TODO Auto Generated method stub
			if(!val){
				_recordState.view.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			}else{
				_pauseCounter=0;
				_recordState.view.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			}
			
		}
		
		private function onEnterFrame(e:Event):void{
			_pauseCounter++;
		}
		
		private function onScoreSignal(toPlayTime:int,curTime:int):void
		{
			if(toPlayTime==-1){
				_scores.push(new scoreData(-1,-1));
				return;
			}
			//trace(toPlayTime,curTime,_pauseCounter);
			var value:int ;
			if(_pauseCounter>0){ // late
				value = 10 - _pauseCounter;
			}else{  // early
				value = 10 - (toPlayTime - curTime);
			}
			_scores.push(new scoreData(Math.max(value,0),toPlayTime));
			if(_scores[_scores.length-1].score==2){
				showScoreFeedBack("+2");
			}
			_pauseCounter=0;
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
				showScoreFeedBack("combo +4",100);
				for(i=_scores.length-1;i>_scores.length-comboLength;i--){
					_scores[i].wasInCombo = true;
				}
			}
			_score = _score + _scores[_scores.length-1].score;
			_scorePanel.setScore(_score);
		}
		private function showScoreFeedBack(str:String,yOffset:int=0):void{
			var _scoreFeedBack:ScoreFeedBack = new ScoreFeedBack(str);
			_recordState.view.addChild(_scoreFeedBack);
			_scoreFeedBack.x=(Dimentions.WIDTH-_scoreFeedBack.width)/2;
			_scoreFeedBack.y=(Dimentions.HEIGHT-_scoreFeedBack.height)/5+yOffset;
			var gt:GTween = new GTween(_scoreFeedBack,1,{alpha:0,scaleX:2,scaleY:2});
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
	function ScoreFeedBack(str:String){
		_txt = new TextField();
		_txt.autoSize = TextFieldAutoSize.LEFT;
		_txt.text = str;
		addChild(_txt);
		_txt.setTextFormat(new TextFormat("Arial",32,0xFFFFFF))
	}
	
}

class scoreData{
	
	public var scoreTime:int;
	public var value:int;
	public var wasInCombo:Boolean=false;
	
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
		_scoreField = new TextField();
		_scoreField.width=130;
		_scoreField.x = 14;
		_scoreField.y=4;
		_scoreField.autoSize = TextFieldAutoSize.CENTER;
		_scoreField.defaultTextFormat = new TextFormat(null,32,0xFFFFFF);
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
		}
		if(icon){
			addChild(icon);
			icon.y=4;
			icon.x=8;
			icon.filters = [new GlowFilter(0XFFFFFF)]
		}
	}
	
	public function setScore(score:int):void{
		_scoreField.text = score.toString();
	}
}