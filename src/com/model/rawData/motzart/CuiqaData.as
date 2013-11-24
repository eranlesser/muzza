package com.model.rawData.motzart
{
	public class CuiqaData
	{
		public function CuiqaData()
		{
		}
		
		public static var data:XML = 
			<instrument type="loopee"  thumbNail='loopee' >
			<components />
			<rawData startAt="64"	>
							<row>
								<togi id="q1" sound="mozart/quicka/q1.mp3" color="0xFFFFFF" />
							</row>
							<row>
								<togi id="q2" sound="mozart/quicka/q2.mp3" color="0x333333"/>
							</row>
							<row>
							</row>
							<row>
								<togi id="q3" sound="mozart/quicka/q3.mp3" color="0xFFFFFF" />
							</row>
							<row location="5">
							</row>
							<row>
								<togi id="q4" sound="mozart/quicka/q4.mp3" color="0x555555"/>
							</row>
							<row>
								<togi id="q5" sound="mozart/quicka/q5.mp3" color="0x888888"/>
							</row>
							<row>
								<togi id="q6" sound="mozart/quicka/q6.mp3" color="0x444444" />
							</row>
							<row location="9">
								<togi id="q7" sound="mozart/quicka/q7.mp3" color="0x222222"/>
							</row>
							<row>
								<togi id="q8" sound="mozart/quicka/q8.mp3" color="0xFFFFFF" />
							</row>
							<row>
								<togi id="q9" sound="mozart/quicka/q9.mp3" color="0xFFFFFF" />
							</row>
							<row>
								<togi id="q10" sound="mozart/quicka/q10.mp3" color="0xFFFFFF" />
							</row>
							<row location="13">
								<togi id="q11" sound="mozart/quicka/q11.mp3" color="0xFFFFFF" />
							</row>
							<row >
							</row>
							<row location="15"> 
								<togi id="q12" sound="mozart/quicka/q12.mp3" color="0xFFFFFF" />
							</row>
							<row>
							</row>
			</rawData>
			
						<notes>
						<note id="q1"   soundFile="mozart/quicka/q1.mp3" value="1" />
						<note id="q2"   soundFile="mozart/quicka/q2.mp3" value="2" />
						<note id="q3"   soundFile="mozart/quicka/q3.mp3" value="3" />
						<note id="q4"   soundFile="mozart/quicka/q4.mp3" value="4" />
						<note id="q5"   soundFile="mozart/quicka/q5.mp3" value="5" />
						<note id="q6"   soundFile="mozart/quicka/q6.mp3" value="6" />
						<note id="q7"   soundFile="mozart/quicka/q7.mp3" value="7" />
						<note id="q8"   soundFile="mozart/quicka/q8.mp3" value="8" />
						<note id="q9"   soundFile="mozart/quicka/q9.mp3" value="9" />
						<note id="q10"   soundFile="mozart/quicka/q10.mp3" value="10" />
						<note id="q11"   soundFile="mozart/quicka/q11.mp3" value="11" />
						<note id="q12"   soundFile="mozart/quicka/q12.mp3" value="12" />
						</notes>
						<sequances>
			
						
			<sequance id="10">
			<note id="q1" location="1" soundLength="1"/>
			<note id="q2" location="5" soundLength="1"/>
			<note id="q3" location="13" soundLength="1"/>
			<note id="q4" location="21" soundLength="1"/>
			<note id="q5" location="25" soundLength="1"/>
			<note id="q6" location="29" soundLength="1"/>
			<note id="q7" location="33" soundLength="1"/>
			<note id="q8" location="37" soundLength="1"/>
			<note id="q9" location="41" soundLength="1"/>
			<note id="q10" location="45" soundLength="1"/>
			<note id="q11" location="49" soundLength="1"/>
			<note id="q12" location="57" soundLength="1"/>
			</sequance>
			<sequance id="99">
<subSequance id="10" location="64" />
<subSequance id="10" location="128" />
<subSequance id="10" location="192" />
<subSequance id="10" location="256" />
<subSequance id="10" location="320" />
<subSequance id="10" location="384" />
<subSequance id="10" location="448" />
<subSequance id="10" location="512" />
<subSequance id="10" location="576" />
<subSequance id="10" location="640" />
<subSequance id="10" location="704" />
<subSequance id="10" location="768" />
<subSequance id="10" location="832" />
<subSequance id="10" location="896" />
<subSequance id="10" location="960" />
<subSequance id="10" location="1024" />
			<subSequance id="10" location="1088" />
			</sequance>
						
						</sequances>
						</instrument>
	}
}