package com.model.rawData.edvard
{
	
	
	public class EdvardData
	{
		public static var data:XML = 
			<theme id='recycle' rhythm='14'>
			<instruments>
			{Bottles.data}
		{Drum.data}
		{Bass.data}
		
		</instruments>
		<screens>
		
		<demoScreen type="ThemeTemplate" beginAtFrame="1" endAtFrame="1400" playSequance="99" nowPlaying="MOUTAIN_KING_nowPlaying.png">
			<instrument type="drum.png" >
			<layout id="0" x='50' y='140' rotation="0" />
			</instrument>
			<instrument type='bass_flash.jpg' >
			<layout id="0" x='600' y='100' rotation="0" />
			</instrument>
			<instrument type='bottles.png' >
			<layout id="0" x='350' y='100'  rotation="0" />
			</instrument>


		</demoScreen>
		
		
		<recordSession>
		
		
		<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="1400" >
			<playerInstrument type="bottles.png" learnedSequanced="99" palletSequance="10" recordedSequance="102" noteTargetsY="240">
			<RecordedX>62.5</RecordedX>
			<RecordedY>360</RecordedY>
			</playerInstrument>
		<backups>
		<instrument type="drum.png" >
		<layout id="0" x='50' y='140'  rotation="0" learnedSequanced="102" />	
			</instrument>
			<instrument type='bass_flash.jpg'>
		<layout id="0" x='600' y='100'  rotation="0" learnedSequanced="102"/>	
			</instrument>
		</backups>
		</recordScreen>
		
		
		<recordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="1400" >
			<playerInstrument type="drum.png" learnedSequanced="99" recordedSequance="102"  noteTargetsY="240"  >
			<RecordedX>238</RecordedX>
			<RecordedY>500</RecordedY>
			</playerInstrument>
		
		<backups>
			<instrument type='bass_flash.jpg'>
		<layout id="0" x='600' y='100'  rotation="0" learnedSequanced="102"/>	
			</instrument>
			<instrument type='bottles.png' >
		<layout id="0" x='350' y='100'  rotation="0" learnedSequanced="102"/>	
			</instrument>
		</backups>
		</recordScreen>
		
		
		<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="1400" >
			<playerInstrument type="bass_flash.jpg" learnedSequanced="99" recordedSequance="102"  noteTargetsY="240">
			<RecordedX>178</RecordedX>
			<RecordedY>500</RecordedY>
			</playerInstrument>
		<backups>
		<instrument type="drum.png" >
		<layout id="0" x='50' y='140'  rotation="0" learnedSequanced="102" />	
			</instrument>
			<instrument type='bottles.png' >
		<layout id="0" x='350' y='100'  rotation="0" learnedSequanced="102"/>	
			</instrument>
		</backups>
		</recordScreen>
		
		
		
		
		<endScreen type="ThemeTemplate" beginAtFrame="1" endAtFrame="1400" playSequance="102">
			<instrument type="drum.png" >
		<layout id="0" x='50' y='140'  rotation="0" />	
			</instrument>
			<instrument type='bass_flash.jpg'>
		<layout id="0" x='600' y='100'  rotation="0" />	
			</instrument>
			<instrument type='bottles.png' >
		<layout id="0" x='350' y='100'  rotation="0" />	
			</instrument>
		<!--<instrument type='flute' >
			<layout id="0" x='900' y='500'  rotation="0" />
			</instrument>-->
		</endScreen>
		
		
		</recordSession>
		</screens>
		
		</theme>
		
		
	}
}

/*
<backups>
<instrument type="bottles.png" learnedSequanced="102" />
</backups>
*/