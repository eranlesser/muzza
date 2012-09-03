package com.musicalInstruments.model
{
	import com.musicalInstruments.model.sequances.ISequance;

	public class InstrumentModel{
		
		private var _coreModel:CoreInstrumentModel;
		private var _x:Vector.<int>;
		private var _y:Vector.<int>;
		private var _rotation:Vector.<int>;
		
		public function InstrumentModel(instrumentModel:CoreInstrumentModel,themeData:XML)
		{
			_coreModel = instrumentModel;
			parse(themeData);
		}
		
		public function get coreModel():CoreInstrumentModel{
			return _coreModel
		}
		
		private function parse(themeData:XML):void{
			_x=new Vector.<int>();
			_y=new Vector.<int>();
			_rotation=new Vector.<int>();
			for each(var layout:XML in themeData.layout){
				_x.push(layout.@x);
				_y.push(layout.@y);
				_rotation.push(layout.@rotation);
			}
			//_playSequance = themeData.@playSequance;
			//_playCycle = themeData.@playCycle;
		}
		
		public function getX(layout:uint):int{
			return _x[layout];
		}
		
		public function getY(layout:uint):int{
			return _y[layout];
		}
		public function getRotation(layout:int):int{
			return _rotation[layout];
		}
		
		public function getSequanceById(id:uint):ISequance{
			return _coreModel.getSequanceById(id);
		}
	}
}