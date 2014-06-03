package com.model.texts
{
	import flash.utils.Dictionary;

	public class EnglishTexts implements ITexts
	{
		private var _titles:Dictionary = new Dictionary();
		private var _msgs:Dictionary = new Dictionary();
		
		public function EnglishTexts()
		{
			_titles["demo"] = "Demo";
			_msgs["demo"] = "Click here, this is what we are about to play together";
			_titles["cueline"] = "Cue Line";
			_msgs["cueline"] = "When notes reach the line, play the bottle with the same number";
			_titles["play"] = "Play";
			_msgs["play"] = "Click here, let's play some music with Mel";
			_titles["close"] = "Close";
			_msgs["close"] = "Click to close";
			_titles["welldone"] = "Well Done";
			_msgs["welldone"] = "You are ready for the next level, click here";
			_titles["Ddrums"] = "Dee Drums";
			_msgs["Ddrums"] = "Lets add some rhythm"; 
			_titles["Bbass"] = "The human Bass";
			_msgs["Bbass"] = "Time for some heavy groove";
			_titles["bottles"] = "Great Job!"; 
			_titles["drums"] = "You Rock!";
			_titles["bass"] = "Awesome!!";
		}
		
		public function getTitleById(id:String):String{
			return _titles[id];
		}
		public function getMsgById(id:String):String{
			return _msgs[id];
		}
	}
}