package com.model.rawData.tutorial
{
	

public class TutorialData
{
public static var data:XML = 
<theme id='recycle' rhythm='11'>
<instruments>
{Bottles.data}
{Drum.data}
{Bass.data}
</instruments>
<screens>

<demoScreen type="ThemeTemplate" beginAtFrame="1" endAtFrame="632" playSequance="99" nowPlaying="ODE_TO_JOY_nowPlaying.png">
	<instrument type="drum.png" >
	<layout id="0" x='50' y='140'  />
	</instrument>
	<instrument type='bass_flash.jpg' >
	<layout id="0" x='600' y='100'  />
	</instrument>
	<instrument type='bottles.png' >
	<layout id="0" x='350' y='100'   />
	</instrument>
	

</demoScreen>


<recordSession>


<recordScreen type="RecordScreen" tutorial="true"  beginAtFrame="1" endAtFrame="632" >
	<playerInstrument type="bottles.png" learnedSequanced="99" imroviseSequance="101" recordedSequance="102" noteTargetsY="240">
	<RecordedX>102.5</RecordedX>
	<RecordedY>360</RecordedY>
	</playerInstrument>
<backups>
<instrument type="drum.png" >
<layout id="0" x='50' y='140'   learnedSequanced="102" imroviseSequance="101" />	
	</instrument>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'   learnedSequanced="102" imroviseSequance="101"/>	
	</instrument>
</backups>
</recordScreen>


<recordScreen type="RecordScreen" tutorial="true" beginAtFrame="1" endAtFrame="632" >
	<playerInstrument type="drum.png" learnedSequanced="99" recordedSequance="102" imroviseSequance="101"  noteTargetsY="240"  >
	<RecordedX>308</RecordedX>
	<RecordedY>500</RecordedY>
	</playerInstrument>

<backups>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'   learnedSequanced="102" imroviseSequance="101"/>	
	</instrument>
	<instrument type='bottles.png' >
<layout id="0" x='350' y='100'   learnedSequanced="102" imroviseSequance="101"/>	
	</instrument>
</backups>
</recordScreen>


<recordScreen type="RecordScreen" tutorial="true"  beginAtFrame="1" endAtFrame="632" >
	<playerInstrument type="bass_flash.jpg" learnedSequanced="99" recordedSequance="102" imroviseSequance="101" noteTargetsY="240">
	<RecordedX>178</RecordedX>
	<RecordedY>500</RecordedY>
	</playerInstrument>
<backups>
<instrument type="drum.png" >
<layout id="0" x='50' y='140'   learnedSequanced="102" imroviseSequance="101"/>	
	</instrument>
	<instrument type='bottles.png' >
<layout id="0" x='350' y='100'   learnedSequanced="102"imroviseSequance="101"/>	
	</instrument>
</backups>
</recordScreen>



<endScreen type="ThemeTemplate" tutorial="true" beginAtFrame="1" endAtFrame="632" playSequance="102" improviseSequance="101">
	<instrument type="drum.png" >
<layout id="0" x='50' y='140'   />	
	</instrument>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'   />	
	</instrument>
	<instrument type='bottles.png' >
<layout id="0" x='350' y='100'   />	
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