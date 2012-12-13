package model
{
	import views.components.Togi;

	public class LoopeeModel{
		private var _rows:Vector.<Vector>;
		public function LoopeeModel(xml:XML){
			init(xml)
		}
		
		private function init(xml:XML):void{
			_rows = new Vector.<Vector>();
			for each(var rowXml:XML in xml.rows){
				var row:Vector.<XML> = new Vector.<XML>();
				for each(var togi:XML in rowXml.togi){
					row.push(togi);
				}
				_rows.push(row);
			}
		}
		
	
	}
}