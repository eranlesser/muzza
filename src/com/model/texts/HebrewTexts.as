package com.model.texts
{
	import flash.utils.Dictionary;

	public class HebrewTexts implements ITexts
	{
		private var _titles:Dictionary = new Dictionary();
		private var _msgs:Dictionary = new Dictionary();
		
		
		public function HebrewTexts()
		{
			_titles["demo"] = "הדגמה";
			_msgs["demo"] = "לחצו כאן ";
			_titles["cueline"] = "קו נגינה";
			_msgs["cueline"] = "לחצו על המספר המתאים";
			_titles["play"] = "התחל";
			_msgs["play"] = "שיעור ראשון מתחיל";
			_titles["close"] = "סגור";
			_msgs["close"] = "לחצו לסגירה של החלון";
			_titles["welldone"] = "יפה מאוד";
			_msgs["welldone"] = "אתם מוכנים לשלב הבא";
			_titles["Ddrums"] = "תופים";
			_msgs["Ddrums"] = "בואו נוסיף קצת קצב"; 
			_titles["Bbass"] = "הבס האנושי";
			_msgs["Bbass"] = "זמן לכלים הכבדים";
			_titles["bottles"] = "מצוין!"; 
			_titles["drums"] = "קצב מעולה!";
			_titles["bass"] = "כל הכבוד!!";
		}
		
		public function getTitleById(id:String):String{
			return flip(_titles[id]);
		}
		public function getMsgById(id:String):String{
			return flip(_msgs[id]);
		}
		
		private function flip(str:String):String{
			
			var newStr:String = "";
			for(var i:int=str.length-1;i>=0;i--){
				newStr = newStr + str.charAt(i);
			}
			
			return newStr;
		}
	}
}