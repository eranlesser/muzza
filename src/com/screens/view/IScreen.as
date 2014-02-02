package com.screens.view
{
	import com.musicalInstruments.model.ThemeInstrumentsModel;
	
	

	public interface IScreen
	{
		function start():void;
		function stop():void;
		function parseXML(screenData:XML,instrumentsModel:ThemeInstrumentsModel,tutorial:Boolean=false):void
		
		//function set representationVisible(vis:Boolean):void;
		//function layout(direction:String):void;
		
		
	}
}