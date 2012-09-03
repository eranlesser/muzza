package com.musicalInstruments.model {
	import com.musicalInstruments.model.sequances.IRecordableSequance;
	import com.musicalInstruments.model.sequances.ISequance;
	
	import org.osflash.signals.Signal;


	public class CoreInstrumentModel{
		
		
		private var _components:		Vector.<InstrumentComponentModel>;
		protected var _thumbNail:		String;
		private var _spriteSheet:		String;
		private var _type:				String;
		private var _width:				uint;
		private var _height:			uint;
		private var _eyes:				XML;
		private var _bubbleX:			int;
		private var _bubbleY:			int;
		
		public var ready:Signal = new Signal();
		protected var _sequances:		Vector.<ISequance>;
		
		public function CoreInstrumentModel(instrument:XML){
		
			_thumbNail = instrument.@thumbNail
			_type = instrument.@type;
			_spriteSheet = instrument.@spriteSheet;
			_width = instrument.@width;
			_height = instrument.@height;
			
			_bubbleX=instrument.bubble.@x;
			_bubbleY=instrument.bubble.@y;
			_eyes = XML(instrument.eyes);
			_components = new Vector.<InstrumentComponentModel>();
			for each(var component:XML in instrument.components.children()){
				_components.push(new InstrumentComponentModel(component));
			}
			_sequances = new Vector.<ISequance>();
			
		}
		
		public function get width():uint{
			return _width;
		}
		
		public function get height():uint{
			return _height;
		}
		public function get bubbleX():int{
			return _bubbleX;
		}
		public function get bubbleY():int{
			return _bubbleY;
		}
		
		public function get type():String{
			return _type;
		}
		
		public function get thumbNail():String{
			return _thumbNail;
		}
		public function get spriteSheet():String{
			return _spriteSheet;
		}
		
		public function get components():Vector.<InstrumentComponentModel>{
			return _components;
		}
		
		public function get eyes():XML{
			return _eyes;
		}
		
		
		public function getSequanceById(id:uint):ISequance{
			var sm:ISequance;
			for each(var sequanceModel:ISequance in _sequances){
				if(sequanceModel.id == id){
					sm = sequanceModel;
					break;
				}
			}
			return sm;
		}
		
		
		
		public function addRecordedSequance(sequance:IRecordableSequance, beginAtFrame:uint,endAtFrame:uint):void{
			//trace("abstract");
		}
		
		public function reset():void{
			//trace abstract
		}
		
		
		
		
		
		
	}
}