package com.model.rawData.edvard
{
	
public class EdvardData
{
public function EdvardData()
{
}
public static var data:XML = 
<theme id='recycle' rhythm='23'>
<instruments>
{Drum.data}
{Bass.data}
{Bottles.data}
</instruments>
<screens>

<demoScreen type="ThemeTemplate" beginAtFrame="1" playSequance="99">
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

<studioScreen>
	<instrument type='bass_flash.jpg'>
	<layout id="0" x="325" y="560" rotation="0" />
	<layout id="1" x="880" y="0" rotation="-90" />
	<layout id="2" x="880" y="0" rotation="-90" />
	</instrument>
	<instrument type="drum.png">
	<layout id="0" x="12" y="240" rotation="0"/>
	<layout id="1" x="320" y="200" rotation="90"/>
	<layout id="2" x="320" y="5" rotation="180"/>
	</instrument>
	<instrument type='bottles.png' >
	<layout id="0" x="320" y="80" rotation="0"/>
	<layout id="1" x="5" y="2"  rotation="90"/>
	<layout id="2" x="5" y="2" rotation="90"/>
	</instrument>
</studioScreen>

<recordSession>
<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="512" >
	<playerInstrument type="bottles.png" learnedSequanced="99" recordedSequance="102">
	<RecordedX>167</RecordedX>
	<RecordedY>360</RecordedY>
	</playerInstrument>
</recordScreen>


<recordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="512" >
	<playerInstrument type="drum.png" learnedSequanced="99" recordedSequance="102">
	<RecordedX>380</RecordedX>
	<RecordedY>370</RecordedY>
	</playerInstrument>
	
</recordScreen>

<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="512" >
	<playerInstrument type="bass_flash.jpg" learnedSequanced="99" recordedSequance="102">
	<RecordedX>34</RecordedX>
	<RecordedY>440</RecordedY>
	</playerInstrument>
</recordScreen>

<endScreen type="ThemeTemplate" beginAtFrame="1" playSequance="102">
	<instrument type="drum.png" >
<layout id="0" x='50' y='140'  rotation="0" />	
	</instrument>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'  rotation="0" />	
	</instrument>
	<instrument type='bottles.png' >
<layout id="0" x='350' y='100'  rotation="0" />	
	</instrument>
</endScreen>
</recordSession>
</screens>
</theme>
		
	}
}