package com.tutorial
{
	import com.screens.recordScreenStates.IRecordScreenState;
	
	public interface ITutorialState extends IRecordScreenState
	{
		function addTutorial(counter:uint):void;
		function removeTutorial():void;
	}
}