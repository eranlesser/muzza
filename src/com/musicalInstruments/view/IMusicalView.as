package com.musicalInstruments.view
{
	import com.musicalInstruments.model.sequances.ISequance;
	
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * @author eranlesser
	 * Interface for both interactive(Recordable) music instruments and Animated musical figures
	 */
	public interface IMusicalView{
		//function play(sequanceId:uint,beginAtFrame:uint):Boolean;
		function stop():void;
		function get sequanceDone():Signal;
	}
}