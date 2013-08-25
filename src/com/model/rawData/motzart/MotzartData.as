package com.model.rawData.motzart
{
	

public class MotzartData
{
public static var data:XML = 
<theme id='recycle' rhythm='14'>
<instruments>
{LoopeeXml.data}
{Bottles.data}
{Drum.data}
{Bass.data}
</instruments>
<screens>

<demoScreen type="ThemeTemplate" beginAtFrame="1" endAtFrame="1632" playSequance="99" nowPlaying="ODE_TO_JOY_nowPlaying.png">
	<instrument type="drum.png" >
	<layout id="0" x='50' y='140' rotation="0" />
	</instrument>
	<instrument type='bass_flash.jpg' >
	<layout id="0" x='600' y='100' rotation="0" />
	</instrument>
	<instrument type='bottles.png' >
	<layout id="0" x='350' y='100'  rotation="0" />
	</instrument>
	<instrument type='loopee' >
	<layout id="0" x='900' y='500'  rotation="0" />
	</instrument>

</demoScreen>


<recordSession>

<recordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="1632" >
	<playerInstrument type="loopee" learnedSequanced="99" recordedSequance="102"  noteTargetsY="240"  >
	<RecordedX>22</RecordedX>
	<RecordedY>400</RecordedY>
	</playerInstrument>
<backups>
<instrument type="drum.png" >
<layout id="0" x='50' y='140'  rotation="0" learnedSequanced="102" />	
	</instrument>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'  rotation="0" learnedSequanced="102"/>	
	</instrument>
	<instrument type='bottles.png' >
<layout id="0" x='350' y='100'  rotation="0" learnedSequanced="102"/>	
	</instrument>
</backups>

</recordScreen>

<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="1632" >
	<playerInstrument type="bottles.png" learnedSequanced="99" palletSequance="10" recordedSequance="102" noteTargetsY="240">
	<RecordedX>12</RecordedX>
	<RecordedY>360</RecordedY>
	</playerInstrument>
<backups>
<instrument type="drum.png" >
<layout id="0" x='50' y='140'  rotation="0" learnedSequanced="102" />	
	</instrument>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'  rotation="0" learnedSequanced="102"/>	
	</instrument>
<instrument type='loopee' >
	<layout id="0" x='900' y='500'  rotation="0" />
	</instrument></backups>
</recordScreen>


<recordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="1632" >
	<playerInstrument type="drum.png" learnedSequanced="99" recordedSequance="102"  noteTargetsY="240"  >
	<RecordedX>308</RecordedX>
	<RecordedY>500</RecordedY>
	</playerInstrument>

<backups>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'  rotation="0" learnedSequanced="102"/>	
	</instrument>
	<instrument type='bottles.png' >
<layout id="0" x='350' y='100'  rotation="0" learnedSequanced="102"/>	
	</instrument>
<instrument type='loopee' >
	<layout id="0" x='900' y='500'  rotation="0" />
	</instrument></backups>
</recordScreen>


<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="1632" >
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
<instrument type='loopee' >
	<layout id="0" x='900' y='500'  rotation="0" />
	</instrument></backups>
</recordScreen>




<endScreen type="ThemeTemplate" beginAtFrame="1" endAtFrame="1632" playSequance="102">
	<instrument type="drum.png" >
<layout id="0" x='50' y='140'  rotation="0" />	
	</instrument>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'  rotation="0" />	
	</instrument>
	<instrument type='bottles.png' >
<layout id="0" x='350' y='100'  rotation="0" />	
	</instrument>
<instrument type='loopee' >
	<layout id="0" x='900' y='500'  rotation="0" />
	</instrument>
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