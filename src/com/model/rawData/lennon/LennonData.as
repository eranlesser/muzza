package com.model.rawData.lennon
{
	public class LennonData
	{
		public function LennonData()
		{
		}
		public static var lyrics:XML = 
<lyrics>
	<lyric cycle="2">
		<line value="So this is Xmas" location="0" />
		<line value="and what have you done" location="32"/>
		<line value="Another year over" location="64" />
		<line value="and a new one just began" location="96"/>
	</lyric>
	<lyric cycle="3">
		<line value="And so this is Xmas" location="0" />
		<line value="I hope you have fun" location="32"/>
		<line value="The near and the dear one" location="64" />
		<line value="The old and the young " location="96"/>
	</lyric>
	<lyric cycle="4">
		<line value="A very Merry Xmas" location="0" />
		<line value="And a happy New Year" location="32"/>
		<line value="Let's hope it's a good one" location="64" />
		<line value="Without any fear" location="96"/>
	</lyric>
	<lyric cycle="5">
		<line value="And so this is Xmas" location="0" />
		<line value="For weak and for strong" location="32"/>
		<line value="For rich and the poor ones" location="64" />
		<line value="The world is so wrong" location="96"/>
	</lyric>
	<lyric cycle="6">
		<line value="And so happy Xmas" location="0" />
		<line value="For black and for white" location="32"/>
		<line value="For yellow and red ones" location="64" />
		<line value="Let's stop all the fight" location="96"/>
	</lyric>
	<lyric cycle="7">
		<line value="war is over" location="0" />
		<line value="if you want it" location="32"/>
		<line value="war is over" location="64" />
		<line value="now!" location="96"/>
	</lyric>
</lyrics>
			
public static var data:XML = 
<theme id='recycle' rhythm='100'>
	<instruments>
		{Drum.data}
		{Bottles.data}
		{SingerData.data}
		{Bass.data}
	</instruments>
<screens>

<screen type="ThemeTemplate" id="recycleAll" cycle="1" beginAtFrame="1">
	<title text='The Recyclers' soundFile='recycle.mp3' x='150' y='22' />
	{lyrics}
	<instrument type="singer.png" x='770' y='10'>
		<cycle count="1" sequance="100" />
		<cycle count="2" sequance="101" />
		<cycle count="3" sequance="1" />
		<cycle count="4" sequance="1" />
		<cycle count="5" sequance="1" />
	</instrument>
	<instrument type='bottles.png' x='50' y='100' >
		<cycle count="1" sequance="1" />
		<cycle count="2" sequance="1" />
	</instrument>
	<instrument type='bass_flash.jpg' x='600' y='100'>
		<cycle count="1" sequance="1" />
		<cycle count="2" sequance="2" />
		<cycle count="3" sequance="3" />
		<cycle count="4" sequance="4" />
		<cycle count="5" sequance="2" />
		<cycle count="6" sequance="3" />
		<cycle count="7" sequance="4" />
	</instrument>
	<instrument type="drum.png" x='300' y='160'>
		<cycle count="1" sequance="1" />
		<cycle count="2" sequance="2" />
	</instrument>
</screen>
<screen type="PracticeScreen" id="voiceRecord1"  cycle="1" beginAtFrame="1" endAtFrame="126" nextEnabled="true">
	{lyrics}
	<title text='singer' soundFile='recycle.mp3' x='250' y='0' />
	<instrument type="singer.png" recordedSequance="101" learnedSequanced="1" >
		<RecordedX>100</RecordedX>
		<RecordedY>100</RecordedY>
		<PlayX>800</PlayX>
		<PlayY>20</PlayY>
	</instrument>
</screen>
<screen type="PracticeScreen" id="voiceRecord1"  cycle="2" beginAtFrame="1" endAtFrame="126" nextEnabled="true">
	{lyrics}
	<title text='singer' soundFile='recycle.mp3' x='250' y='0' />
	<instrument type="singer.png" recordedSequance="102" learnedSequanced="2" >
		<RecordedX>100</RecordedX>
		<RecordedY>100</RecordedY>
		<PlayX>800</PlayX>
		<PlayY>20</PlayY>
	</instrument>
</screen>

<screen type="PracticeScreen" id="drum1" cycle="1" beginAtFrame="1" endAtFrame="32" nextEnabled="true">
	<title text='1 , 2' soundFile='recycle.mp3' x='50' y='50' />
	<instrument type="drum.png" learnedSequanced="10" recordedSequance="100">
		<RecordedX>550</RecordedX>
		<RecordedY>120</RecordedY>
		<PlayX>100</PlayX>
		<PlayY>100</PlayY>
	</instrument>
</screen>
<screen type="PracticeScreen" id="bass1" cycle="1" beginAtFrame="1" endAtFrame="32" nextEnabled="true">
	<title text='1 , 2' soundFile='recycle.mp3' x='50' y='50' />
	<instrument type="bass_flash.jpg" learnedSequanced="3" recordedSequance="100">
		<RecordedX>550</RecordedX>
		<RecordedY>120</RecordedY>
		<PlayX>100</PlayX>
		<PlayY>100</PlayY>
	</instrument>
</screen>
<screen type="PracticeScreen" id="bottles" cycle="1" beginAtFrame="1" endAtFrame="128" nextEnabled="true">
	<title text='1 , 2' soundFile='recycle.mp3' x='50' y='50' />
	<instrument type="bottles.png" learnedSequanced="3" recordedSequance="100">
		<RecordedX>550</RecordedX>
		<RecordedY>120</RecordedY>
		<PlayX>100</PlayX>
		<PlayY>100</PlayY>
	</instrument>
</screen>

<screen type="ThemeTemplate" id="recycleAll" cycle="1" beginAtFrame="1">
	<title text='The Recyclers' soundFile='recycle.mp3' x='150' y='22' />
{lyrics}
	<instrument type="singer.png" x='770' y='10'>
		<cycle count="1" sequance="100" />
		<cycle count="2" sequance="101" />
		<cycle count="3" sequance="12" />
		<cycle count="4" sequance="13" />
		<cycle count="5" sequance="14" />
	</instrument>
	<instrument type='bottles.png' x='50' y='100' >
		<cycle count="10" sequance="10" />
		<cycle count="2" sequance="11" />
		<cycle count="3" sequance="12" />
		<cycle count="4" sequance="13" />
		<cycle count="5" sequance="14" />
	</instrument>
	<instrument type='bass_flash.jpg' x='600' y='100' >
		<cycle count="1" sequance="100" />
		<cycle count="2" sequance="11" />
		<cycle count="3" sequance="12" />
		<cycle count="4" sequance="13" />
		<cycle count="5" sequance="14" />
	</instrument>
	<instrument type="drum.png" x='300' y='160'>
		<cycle count="10" sequance="10" />
		<cycle count="2" sequance="11" />
		<cycle count="3" sequance="12" />
		<cycle count="4" sequance="13" />
		<cycle count="5" sequance="14" />
	</instrument>
</screen>
</screens>
</theme>
			
	}
}