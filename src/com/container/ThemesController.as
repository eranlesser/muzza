package com.container
{
	import com.constants.Rhythms;
	import com.constants.Session;
	import com.container.controller.ProgressControl;
	import com.container.controller.TutorialProgressControl;
	import com.model.MainThemeModel;
	import com.model.rawData.Data;

	public class ThemesController{
		
		private var _presenter:			Presenter;
		private var _themeProgressors:	Vector.<ProgressControl>;
		private var _progressControlIndex:	uint=0;
		private var _playMode:String;
		
		public function ThemesController(view:Presenter){
			_presenter = view;
			_themeProgressors = new Vector.<ProgressControl>();
			init();
		}
		
		private function init():void{
			_presenter.addStartScreen();
			_presenter.start(this);
			_presenter.songMenu.playRequest.add(onSongSelected);
			//_presenter.tutorialRequest.add(onSongSelected);
		}
		
		private function onSongSelected(name:String):void{
			startProgressControll(name,"record");
			//Flurry.logEvent("in song selected",name);
		}
		
		private function startProgressControll(name:String,mode:String):void{
			Session.SONG_NAME=name;
			_playMode=mode;
			_presenter.removeStartScreen();
			if(_themeProgressors.length>_progressControlIndex &&_themeProgressors[_progressControlIndex]){//reset old progresscontroll
				_themeProgressors[_progressControlIndex].reset();
			}
			_progressControlIndex = getProgressControllerIndex(name);
			//_progressControl = getProgressController(name);
			if(_themeProgressors.length>_progressControlIndex &&_themeProgressors[_progressControlIndex]){
				_themeProgressors[_progressControlIndex].start(mode);
			}else{
				var themeModel:MainThemeModel = new MainThemeModel(Data.getSongData(name),_presenter);
				var progressControl:ProgressControl;
				if(themeModel.isTutorial){
					progressControl =  new TutorialProgressControl(_presenter,themeModel,name); 
				}else{
					progressControl =  new ProgressControl(_presenter,themeModel,name);
				}
				themeModel.ready.addOnce(onThemeReady);
				_themeProgressors.push(progressControl);
				_progressControlIndex=_themeProgressors.indexOf(progressControl);
				
			}
			Rhythms.FRAME_RATE = _themeProgressors[_progressControlIndex].frameRate*4;
			_presenter.stage.frameRate = Rhythms.FRAME_RATE;
			//trace("frame rate is",_presenter.stage.frameRate)
			_themeProgressors[_progressControlIndex].goHomeSignal.add(reStartScreen);
		}
		
		private function onThemeReady():void{
			_themeProgressors[_progressControlIndex].start(_playMode);
		}
		
		private function reStartScreen():void{
			_presenter.removeScreens();
			_presenter.restart(this);
			//_progressControl.goHomeSignal.remove(reStartScreen);
		}
		
	/*
		public function resetData():void{
			while(_themeProgressors.length>0){
				_themeProgressors.pop().reset();
			}
			while(_themeModels.length>0){
				_themeModels.pop().reset();
			}
		}
		*/
		private function getProgressControllerIndex(theme:String):uint{
			var returnedProgressControl:ProgressControl;
			for each(var progressControl:ProgressControl in _themeProgressors){
				if(progressControl.theme == theme){
					returnedProgressControl = progressControl;
				}
			}
			return _themeProgressors.indexOf(returnedProgressControl);
		}
		
		
	}
}