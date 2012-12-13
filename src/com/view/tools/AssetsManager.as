package com.view.tools
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	import org.osflash.signals.Signal;

	public class AssetsManager{
		public var complete:Signal;
		
		private var _assets:XML = new XML(
			"<assets>" +
			"<image path='assets/clamas.png' />"+
			//OPEN
			"<image path='assets/open/WAGON_TRAIN.png' />"+
			"<image path='assets/open/STATION_WALL_TRIP.png' />"+
			"<image path='assets/wall.png' />"+
			//MENU
			"<image path='assets/open/BETHOVEEN_PICTURE.png' />"+
			"<image path='assets/open/MOZART_PICTURE.png' />"+
			"<image path='assets/open/JINGLE_BELLS_PICTURE.png' />"+
			"<image path='assets/open/OVER_THE_RAINBOW.png' />"+
			"<image path='assets/open/OVER_THE_RAINBOW_pic.png' />"+
			"<image path='assets/open/BRAZIL_PICTURE.png' />"+
			"<image path='assets/open/WATERCOLORS_of_BRAZIL.png' />"+
			"<image path='assets/gui/menu/blank.png' />"+
			"<image path='assets/open/EDVARD_GRIEG.png' />"+
			"<image path='assets/open/NEXT_IDLE.png' />"+
			"<image path='assets/open/NEXT_PRESSED.png' />"+
			"<image path='assets/open/PREVIOUS_IDLE.png' />"+
			"<image path='assets/open/PREVIOUS_Pressed.png' />"+
			"<image path='assets/open/WHITE_LIGHT_TOP.png' />"+
			"<image path='assets/open/POLE_STATION.png' />"+
			"<image path='assets/open/Start_tutorial_idle.png' />"+
			"<image path='assets/open/Start_tutorial_PRESSED_V_2.png' />"+
			"<image path='assets/open/PLAY_IDLE.png' />"+
			"<image path='assets/open/PLAY_PRESSED.png' />"+
			"<image path='assets/open/Flagbig.png' />"+
			"<image path='assets/open/Tarab.png' />"+
			//TITLES
			"<image path='assets/open/ODE_TO_JOY.png' />"+
			"<image path='assets/open/JINGLE_BELLS.png' />"+
			"<image path='assets/open/MOUNTAIN_KING.png' />"+
			//TOOLBAR
			"<image path='assets/TOOL_BAR_ICONS/BASS_DONE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/BASS_IDLE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/BASS_PRESSED.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/bottle_IDLE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/bottle_PRESSED.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/BOTTLES_DONE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/BOTTOM_TOOLBAR.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/DEMO_IDLE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/DEMO_PRESSED.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/DRUMS_DONE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/DRUMS_IDLE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/DRUMS_PRESSED.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/HOME_IDLE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/HOME_PRESSED.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/ICONS_POSITIONS.jpg' />"+
			"<image path='assets/TOOL_BAR_ICONS/LISTEN_DONE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/LISTEN_IDLE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/LISTEN_PRESSED.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/BOTTOM_TOOLBAR.png' />"+
			//NOTES
			"<image path='assets/NOTES/BLUE_NEEDLE.png' />"+
			"<image path='assets/NOTES/SPEED_SLIDER/BUTTON_SHADOW.png' />"+
			"<image path='assets/NOTES/SPEED_SLIDER/SPEED_SLIDER_button.png' />"+
			"<image path='assets/NOTES/SPEED_SLIDER/SPEED_SLIDER_contour_highlight.png' />"+
			"<image path='assets/NOTES/SPEED_SLIDER/SPEED_SLIDER_mask.png' />"+
			"<image path='assets/NOTES/SPEED_SLIDER/SPEED_SLIDER.png' />"+
			"<image path='assets/NOTES/SPEED_SLIDER/SPEED.png' />"+
			//BOTTLES
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_1.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_2.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_3.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_4.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_5.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_6.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_7.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_8.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_9.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_SELECTED_1.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_SELECTED_2.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_SELECTED_3.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_SELECTED_4.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_SELECTED_5.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_SELECTED_6.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_SELECTED_7.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_SELECTED_8.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_SELECTED_9.png' />"+
			//BASS
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_1.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_2.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_3.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_4.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_5.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_6.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_7.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_8.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_9.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_SELECTED_1.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_SELECTED_2.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_SELECTED_3.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_SELECTED_4.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_SELECTED_5.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_SELECTED_6.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_SELECTED_7.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_SELECTED_8.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_SELECTED_9.png' />"+
			//DRUMS
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_IDLE_1.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_IDLE_2.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_IDLE_3.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_IDLE_4.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_SELECTED_1.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_SELECTED_2.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_SELECTED_3.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_SELECTED_4.png' />"+
			
			//RECORD SCREEN BUTTONS
			"<image path='assets/PRACTICE_RECORD_BUTTONS/PRACTICE_IDLE.png' />"+
			"<image path='assets/PRACTICE_RECORD_BUTTONS/PRACTICE_PRESSED.png' />"+
			"<image path='assets/PRACTICE_RECORD_BUTTONS/RECORD_IDLE.png' />"+
			"<image path='assets/PRACTICE_RECORD_BUTTONS/RECORD_PRESSED.png' />"+
			"<image path='assets/open/bStrip.png' />"+
			
			//SPRITESHEET
			"<image path='assets/band/drums_new/drumsSheet.png' />"+
			"<image path='assets/band/drums_new/drumsEyes.png' />"+
			"<image path='assets/band/bottles_new/bottlesSheet.png' />"+
			"<image path='assets/band/bottles_new/bottlesEyes.png' />"+
			
			"<image path='assets/band/bass/bassSheet.png' />"+
			"<image path='assets/band/bass/bassBlink.png' />"+
			"<image path='assets/band/bg/quika.png' />"+
			"<image path='assets/band/bg/ganza.png' />"+
			"<image path='assets/band/bg/agogo.png' />"+
			"<image path='assets/metronome.png' />"+
			//DEMOSCREEN
			"<image path='assets/DEMO_SCREEN/JingleBells_nowPlaying.png' />"+
			"<image path='assets/DEMO_SCREEN/OVER_THE_RAINBOW_nowPlaying.png' />"+
			"<image path='assets/DEMO_SCREEN/MOUTAIN_KING_nowPlaying.png' />"+
			"<image path='assets/DEMO_SCREEN/ODE_TO_JOY_nowPlaying.png' />"+
			"<image path='assets/DEMO_SCREEN/WATERCOLORS_of_BRAZIL_nowPlaying.png' />"+
			"<image path='assets/DEMO_SCREEN/DEMO_SCREEN_FRAME.png' />"+
			"<image path='assets/DEMO_SCREEN/CLOSE_BUTTON_IDLE.png' />"+
			"<image path='assets/DEMO_SCREEN/CLOSE_BUTTON_SELECTED.png' />"+
			"<image path='assets/DEMO_SCREEN/lines.png' />"+
			"<image path='assets/DEMO_SCREEN/pause.png' />"+
			"<image path='assets/DEMO_SCREEN/play.png' />"+
			"<image path='assets/DEMO_SCREEN/RELOAD_IDLE.png' />"+
			"<image path='assets/DEMO_SCREEN/RELOAD_PRESSED.png' />"+
			"<image path='assets/DEMO_SCREEN/TIME_SLIDER/TIMESLIDER_BACKGROUND.png' />"+
			"<image path='assets/DEMO_SCREEN/TIME_SLIDER/TIMESLIDER_BLUE_RIGHT_SEGMENT.png' />"+
			"<image path='assets/DEMO_SCREEN/TIME_SLIDER/TIMESLIDER_BLUE_SEGMENT.png' />"+
			"<image path='assets/DEMO_SCREEN/TIME_SLIDER/TIMESLIDER_STROKE_upper_layer.png' />"+
			
			
			//HAT
			"<image path='assets/band/hat/hat.png' />"+
			"<image path='assets/band/hat/coin.png' />"+
			//NOTES
			
			"<image path='assets/representation/notes/note_h.png' />"+
			"<image path='assets/representation/notes/note_hf.png' />"+
			"<image path='assets/representation/notes/note_hs.png' />"+
			"<image path='assets/representation/notes/note_q.png' />"+
			"<image path='assets/representation/notes/note_qf.png' />"+
			"<image path='assets/representation/notes/note_qs.png' />"+
			"<image path='assets/representation/notes/note_w.png' />"+
			"<image path='assets/representation/notes/note_wf.png' />"+
			"<image path='assets/representation/notes/note_ws.png' />"+
			//visuals
			"<image path='assets/representation/visuals/vis_1.png' />"+
			"<image path='assets/representation/visuals/vis_2.png' />"+
			"<image path='assets/representation/visuals/vis_4.png' />"+
			//symbols
			"<image path='assets/representation/symbols/icon_1.png' />"+
			"<image path='assets/representation/symbols/icon_2.png' />"+
			"<image path='assets/representation/symbols/icon_3.png' />"+
			"<image path='assets/representation/symbols/icon_4.png' />"+
			"<image path='assets/representation/symbols/icon_5.png' />"+
			"<image path='assets/representation/symbols/icon_6.png' />"+
			"<image path='assets/representation/symbols/icon_7.png' />"+
			"<image path='assets/representation/symbols/icon_8.png' />"+
			"<image path='assets/representation/symbols/icon_9.png' />"+
			//Representation
			"<image path='assets/LISTEN_SCREEN/LISTEN_SCREEN_NOTES_SHEET.png' />"+
			"<image path='assets/LISTEN_SCREEN/LISTEN_SCREEN_NOTES_BAR.png' />"+
			"<image path='assets/LISTEN_SCREEN/BACK_BUTTON_IDLE.png' />"+
			"<image path='assets/LISTEN_SCREEN/BACK_BUTTON_PRESSED.png' />"+
			"<image path='assets/LISTEN_SCREEN/COLLAPSE_IDLE.png' />"+
			"<image path='assets/LISTEN_SCREEN/COLLAPSE_PRESSED.png' />"+
			"<image path='assets/LISTEN_SCREEN/EXPAND_IDLE.png' />"+
			"<image path='assets/LISTEN_SCREEN/EXPAND_PRESSED.png' />"+
			"<image path='assets/LISTEN_SCREEN/INSTRUMENT_TAB_AND_SHADOWS.png' />"+
			"<image path='assets/LISTEN_SCREEN/LISTEN_SCREEN_BLUE_NEEDLE.png' />"+
			"<image path='assets/LISTEN_SCREEN/mouse.png' />"+
			"<image path='assets/LISTEN_SCREEN/PLAY_BUTTON_IDLE.png' />"+
			"<image path='assets/LISTEN_SCREEN/PLAY_BUTTON_PRESSED.png' />"+
			"<image path='assets/LISTEN_SCREEN/REPLAY_BUTTON_IDLE.png' />"+
			"<image path='assets/LISTEN_SCREEN/REPLAY_BUTTON_PRESSED.png' />"+
			"<image path='assets/LISTEN_SCREEN/line.png' />"+
			"<image path='assets/LISTEN_SCREEN/blue_strip.png' />"+

			
			//Rrpresentation Menu
			"<image path='assets/representation/menu/note.png' />"+
			"<image path='assets/representation/menu/vis.png' />"+
			"<image path='assets/representation/menu/number.png' />"+
			//Rrpresentation RadioList
			"<image path='assets/gui/radioList/autoBtn.png' />"+
			"<image path='assets/gui/radioList/autoBtn_selected.png' />"+
			"<image path='assets/gui/radioList/noteBtn.png' />"+
			"<image path='assets/gui/radioList/noteBtn_selected.png' />"+
			"<image path='assets/gui/radioList/symbolBtn.png' />"+
			"<image path='assets/gui/radioList/symbolBtn_selected.png' />"+
			"<image path='assets/gui/radioList/numBtn.png' />"+
			"<image path='assets/gui/radioList/numBtn_selected.png' />"+
			
			//GUI BUTTONS
			"<image path='assets/gui/play_idle.png' />"+
			"<image path='assets/gui/stop_idle.png' />"+
			"<image path='assets/gui/play_pressed.png' />"+
			"<image path='assets/gui/stop_pressed.png' />"+
			"<image path='assets/gui/record_idle.png' />"+
			"<image path='assets/gui/right_idle.png' />"+
			"<image path='assets/gui/right_pressed.png' />"+
			"<image path='assets/gui/left_idle.png' />"+
			"<image path='assets/gui/left_pressed.png' />"+
			"<image path='assets/gui/close.png' />"+
			"<image path='assets/gui/info.png' />"+
			"<image path='assets/gui/restart.png' />"+
			"<image path='assets/gui/next_idle.png' />"+
			"<image path='assets/gui/next_press.png' />"+
			"<image path='assets/gui/swap.jpg' />"+

			"<image path='assets/gui/btn_home.png' />"+
			"<image path='assets/gui/icon_current_screen.png' />"+
			"<image path='assets/gui/icon_screen.png' />"+
			
			//BACKGROUND
			"<image path='assets/PLAY_SCREEN_WALL_BCKGR.png' />"+
			"<image path='assets/themes/ny/BCKGR_1.jpg' />"+
			"<image path='assets/themes/ny/sign.png' />"+
			//CLOCK
			"<image path='assets/themes/ny/mahog_big.png' />"+
			"<image path='assets/themes/ny/mahog_small.png' />"+
			"<image path='assets/themes/ny/mahog_small2.png' />"+
			"<image path='assets/themes/ny/clock.png' />"+
			"<image path='assets/themes/ny/clock_highLight.png' />"+
			"<image path='assets/themes/ny/Pole_Left.png' />"+
			"<image path='assets/themes/ny/SOUND_OFF.png' />"+
			"<image path='assets/themes/ny/SOUND_ON.png' />"+
			// INSTRUMENTS
			"<image path='assets/instruments/BASS/BASS_1_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_1_SELECTED.png' />"+
			"<image path='assets/instruments/BASS/BASS_2_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_2_SELECTED.png' />"+
			"<image path='assets/instruments/BASS/BASS_3_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_3_SELECTED.png' />"+
			"<image path='assets/instruments/BASS/BASS_4_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_4_SELECTED.png' />"+
			"<image path='assets/instruments/BASS/BASS_5_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_5_SELECTED.png' />"+
			"<image path='assets/instruments/BASS/BASS_6_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_6_SELECTED.png' />"+
			"<image path='assets/instruments/BASS/BASS_7_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_7_SELECTED.png' />"+
			"<image path='assets/instruments/BASS/BASS_8_IDLE.png' />"+
			"<image path='assets/instruments/BASS/BASS_8_SELECTED.png' />"+
			
		
			"<image path='assets/instruments/BOTTLES/bottle_1_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_1_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_2_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_2_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_3_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_3_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_4_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_4_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_5_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_5_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_6_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_6_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_7_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_7_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_8_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_8_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_9_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_9_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/Spot_light_bottle.png' />"+
			"<image path='assets/instruments/BOTTLES/spot_light_floor_bottle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottles_frame.png' />"+
			
			"<image path='assets/instruments/DRUMS/DRUMS_1_IDLE.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_1_PRESSED.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_2_IDLE.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_2_PRESSED.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_3_IDLE.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_3_PRESSED.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_4_IDLE.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_4_PRESSED.png' />"+
			"<image path='assets/instruments/marc.png' />"+
			"<image path='assets/instruments/platein.png' />"+
			
			"<image path='assets/lv.png' />"+
			"</assets>"
		
		);
		private static var  _loadedAssets:Vector.<Asset>;
		
		private var _totalAssets:uint=0;
		
		public function AssetsManager(){
			complete = new Signal();
			_loadedAssets = new Vector.<Asset>();
			preloadAssets();
		}
		
		private function preloadAssets():void{
			for each(var image:XML in _assets.children()){
				loadAsset(image.@path);
				_totalAssets++;
			}
		}
		
		public static function getAssetByName(name:String,smooth:Boolean=false):DisplayObject{
			var displayObj:DisplayObject;
			for each(var obj:Asset in _loadedAssets){
				if(obj.name == name){
					displayObj  = new Bitmap(Bitmap(obj.image).bitmapData.clone());//clone
					if(smooth){
						//(displayObj as Bitmap).cacheAsBitmap=true;
						(displayObj as Bitmap).smoothing=true;
					}
					break;	
				}
			}
			return displayObj;
		}
		
		public static function getBitmapData(name:String):BitmapData{
			var displayObj:BitmapData;
			for each(var obj:Asset in _loadedAssets){
				if(obj.name == name){
					displayObj  =Bitmap(obj.image).bitmapData;
					break;	
				}
			}
			return displayObj;
			
		}
		
		public static function getBitmap(name:String,clone:Boolean=false):Bitmap{
			var displayObj:Bitmap;
			for each(var obj:Asset in _loadedAssets){
				if(obj.name == name){
					if(clone){
						displayObj = new Bitmap(Bitmap(obj.image).bitmapData.clone());
					}else{
						displayObj  =Bitmap(obj.image);//clone
					}
					break;	
				}
			}
			return displayObj;
			
		}
		
		private function onAssetLoaded(e:Event):void{
			_loadedAssets.push(new Asset(LoaderInfo(e.target).url,LoaderInfo(e.target).content));
			if(_totalAssets == _loadedAssets.length){
				//dispatchEvent(new Event(Event.COMPLETE));
				
				complete.dispatch();
			}
		}
		
		private function loadAsset(file:String):void{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onAssetLoaded);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			
			var request:URLRequest = new URLRequest(file);
			loader.load(request);
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void {
			trace("Unable to load file:(asset manager) "+event.text );
		}
	}


}