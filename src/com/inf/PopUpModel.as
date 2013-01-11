package com.inf
{
	public class PopUpModel{
		private var _title:String;
		private var _content:String;
		private var _direction:String;
		private var _width:uint;
		private var _x:uint;
		private var _y:uint;
		private var _id:String;
		private var _next:Boolean=false;
		public function PopUpModel(xml:XML){
			_id=xml.@id;
			_width = xml.@width;
			_x=xml.@x;
			_y=xml.@y;
			_title = xml.title;
			_content = xml.content;
			_direction=xml.direction;
			_next = (xml.next=="true");
		}
		
		public function get title():String
		{
			return _title;
		}
		
		public function get content():String
		{
			return _content;
		}

		public function get width():uint
		{
			return _width;
		}

		public function get x():uint
		{
			return _x;
		}

		public function get y():uint
		{
			return _y;
		}

		public function get direction():String
		{
			return _direction;
		}


		public function get id():String
		{
			return _id;
		}

		public function get next():Boolean
		{
			return _next;
		}


	}
}