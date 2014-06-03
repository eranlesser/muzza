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
			_msgs["demo"] = "לחצו כאן לשמוע הדגמה של המנגינה אותה ננגן יחד";
			_titles["cueline"] = "קו נגינה";
			_msgs["cueline"] = "כאשר המספר מגיע לקו לחצו על כלי הנגינה עם המספר המתאים";
			_titles["play"] = "התחל";
			_msgs["play"] = "לחצו כאן, שיעור ראשון עם מל";
			_titles["close"] = "סגור";
			_msgs["close"] = "לחצו לסגירה של החלון";
			_titles["welldone"] = "יפה מאוד";
			_msgs["welldone"] = "אתם מוכנים לשלב הבא";
			_titles["Ddrums"] = "תופים";
			_msgs["Ddrums"] = "בואו נוסיף קצת קצב"; 
			_titles["Bbass"] = "הבס האנושי";
			_msgs["Bbass"] = "זמן לקצת גרוב";
			_titles["bottles"] = "מצוין!"; 
			_titles["drums"] = "קצב מעולה!";
			_titles["bass"] = "כל הכבוד!!";
		}
		
		public function getTitleById(id:String):String{
			return _titles[id];
		}
		public function getMsgById(id:String):String{
			return _msgs[id];
		}
	}
}