package com.model.rawData.ode
{
	import com.musicalInstruments.palleta.views.Groovee;

public class OdeData
{
public static var data:XML = 
<theme id='recycle' rhythm='10'>
<instruments>
{Bottles.data}
{Bass.data}
{Drum.data}
{TurnTableData.data}
</instruments>
<screens>

<demoScreen type="ThemeTemplate" beginAtFrame="1" endAtFrame="632" playSequance="99" nowPlaying="ODE_TO_JOY_nowPlaying.png">
	<instrument type="drum.png" >
	<layout id="0" x='50' y='140' rotation="0" />
	</instrument>
	<instrument type='bass_flash.jpg' >
	<layout id="0" x='600' y='100' rotation="0" />
	</instrument>
	<instrument type='bottles.png' >
	<layout id="0" x='350' y='100'  rotation="0" />
	</instrument>
	<instrument type='turnTable' >
	<layout id="0" x='900' y='500'  rotation="0" />
	</instrument>

</demoScreen>


<recordSession>


<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="632" >
	<playerInstrument type="bottles.png" learnedSequanced="99" palletSequance="10" recordedSequance="102" noteTargetsY="240">
	<RecordedX>102.5</RecordedX>
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
<backups>

</backups>
</recordScreen>

<recordScreen type="RecordScreen"  beginAtFrame="1" endAtFrame="632" >
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

<recordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="632" >
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
</backups>
</recordScreen>



<recordScreen type="RecordScreen" beginAtFrame="1" endAtFrame="632" >
	<playerInstrument type="turnTable" learnedSequanced="99" recordedSequance="102"  noteTargetsY="240"  >
	<RecordedX>30</RecordedX>
	<RecordedY>320</RecordedY>
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


<endScreen type="ThemeTemplate" beginAtFrame="1" endAtFrame="632" playSequance="102">
	<instrument type="drum.png" >
<layout id="0" x='50' y='140'  rotation="0" />	
	</instrument>
	<instrument type='bass_flash.jpg'>
<layout id="0" x='600' y='100'  rotation="0" />	
	</instrument>
	<instrument type='bottles.png' >
<layout id="0" x='350' y='100'  rotation="0" />	
	</instrument>
<instrument type='turnTable' >
	<layout id="0" x='900' y='500'  rotation="0" />
	</instrument>
</endScreen>


</recordSession>
</screens>

<popups>
<popup id="open_demo" width="320" x="85" y="515">
<title>Listen</title>
<content>Click the button below to hear what we are about to record together</content>
<direction>btm_left</direction>
</popup>

<popup id="close_demo" width="220" x="780" y="85" >
<title>Close</title>
<content>Click "x" to close </content>
<direction>top_right</direction>
</popup>

<popup id="press_record" width="280" x="250" y="95" >
<title>Record</title>
<content>Click "Record" when you are ready to begin recording</content>
<direction>top_right</direction>
</popup>
<popup id="try_again" width="280" x="250" y="95" >
<title>Try Again</title>
<content>Click record to start</content>
<direction>top_right</direction>
</popup>

<popup id="end_record" width="280" x="372" y="250" >
<title>Sounds Great</title>
<content>You made it on time!</content>
<next>true</next>
<direction>none</direction>
</popup>

<popup id="time_out" width="280" x="372" y="250" >
<title>Out of Time</title>
<content>Time has run out, try again</content>
<next>true</next>
<direction>none</direction>
</popup>

<popup id="listen" width="280" x="718" y="515" >
<title>Listen</title>
<content>Click "Listen" to hear what you have recorded</content>
<direction>btm_right</direction>
</popup>
<popup id="drums" width="280" x="562" y="515" >
<title>Drums</title>
<content>Lets see how you keep the rhythm</content>
<direction>btm_right</direction>
</popup>
<popup id="bass" width="280" x="480" y="515" >
<title>Bass</title>
<content>Add some groove with the human bass</content>
<direction>btm_right</direction>
</popup>
<popup id="turnTable" width="280" x="645" y="515" >
<title>DJ</title>
<content>Any hipsters in the crowd?</content>
<direction>btm_right</direction>
</popup>
<popup id="close_listen" width="200" x="2" y="95" >
<title>Back</title>
<content>Click to continue playing</content>
<direction>top_left</direction>
</popup>

<popup id="done" width="340" x="342" y="200" >
<title>You Rock</title>
<content>keep practicing we have more songs and instruments coming soon !</content>
<direction>none</direction>
</popup>

</popups>
</theme>


	}
}

/*
<backups>
<instrument type="bottles.png" learnedSequanced="102" />
</backups>
*/