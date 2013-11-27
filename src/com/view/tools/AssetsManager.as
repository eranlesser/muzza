package com.view.tools
{
	
	import com.constants.Session;
	
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
			"<image path='assets/logo.png' />"+
			//OPEN
			"<image path='assets/open/WAGON_TRAIN.png' />"+
			"<image path='assets/open/STATION_WALL_TRIP.png' />"+
			"<image path='assets/open/CREDITS_IDLE.png' />"+
			"<image path='assets/open/CREDITS_PRESSED.png' />"+
			"<image path='assets/wall.png' />"+
			"<image path='assets/facebook.png' />"+
			"<image path='assets/twitter.png' />"+
			"<image path='assets/gui/mail.png' />"+
			//MENU
			"<image path='assets/open/BETHOVEEN_PICTURE.png' />"+
			"<image path='assets/open/MOZART_PICTURE.png' />"+
			"<image path='assets/open/JINGLE_BELLS_PICTURE.png' />"+
//			"<image path='assets/open/OVER_THE_RAINBOW.png' />"+
//			"<image path='assets/open/OVER_THE_RAINBOW_pic.png' />"+
//			"<image path='assets/open/BRAZIL_PICTURE.png' />"+
//			"<image path='assets/open/WATERCOLORS_of_BRAZIL.png' />"+
//			"<image path='assets/gui/menu/blank.png' />"+
			"<image path='assets/open/EDVARD_GRIEG.png' />"+
			"<image path='assets/open/NEXT_IDLE.png' />"+
			"<image path='assets/open/NEXT_PRESSED.png' />"+
			"<image path='assets/open/PREVIOUS_IDLE.png' />"+
			"<image path='assets/open/PREVIOUS_Pressed.png' />"+
//			"<image path='assets/open/WHITE_LIGHT_TOP.png' />"+
			"<image path='assets/open/POLE_STATION.png' />"+
//			"<image path='assets/open/Start_tutorial_idle.png' />"+
//			"<image path='assets/open/Start_tutorial_PRESSED_V_2.png' />"+
			"<image path='assets/open/PLAY_IDLE.png' />"+
			"<image path='assets/open/PLAY_PRESSED.png' />"+
//			"<image path='assets/open/Flagbig.png' />"+
			"<image path='assets/open/Tarab.png' />"+
			"<image path='assets/open/morocco_pic.png' />"+
			//TITLES
			"<image path='assets/open/ODE_TO_JOY.png' />"+
			"<image path='assets/open/JINGLE_BELLS.png' />"+
			"<image path='assets/open/MOUNTAIN_KING.png' />"+
			"<image path='assets/open/mozart.png' />"+
			//TOOLBAR
			"<image path='assets/instruments/bottles_frame_flute.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/FLUTE_IDLE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/FLUTE_DONE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/FLUTE_PRESS.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/CUICA_IDLE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/CUICA_DONE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/CUICA_PRESS.png' />"+
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
			"<image path='assets/TOOL_BAR_ICONS/LISTEN_DONE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/LISTEN_IDLE.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/LISTEN_PRESSED.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/BOTTOM_TOOLBAR.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/vinyl_done_but.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/vinyl_idle_but.png' />"+
			"<image path='assets/TOOL_BAR_ICONS/vinyl_press_but.png' />"+
			//NOTES
//			"<image path='assets/NOTES/BLUE_NEEDLE.png' />"+
//			"<image path='assets/NOTES/SPEED_SLIDER/BUTTON_SHADOW.png' />"+
//			"<image path='assets/NOTES/SPEED_SLIDER/SPEED_SLIDER_button.png' />"+
//			"<image path='assets/NOTES/SPEED_SLIDER/SPEED_SLIDER_contour_highlight.png' />"+
//			"<image path='assets/NOTES/SPEED_SLIDER/SPEED_SLIDER_mask.png' />"+
//			"<image path='assets/NOTES/SPEED_SLIDER/SPEED_SLIDER.png' />"+
//			"<image path='assets/NOTES/SPEED_SLIDER/SPEED.png' />"+
			//BOTTLES
//			"<image path='assets/instruments/insCircle.png' />"+
//			"<image path='assets/instruments/insCircleDrop.png' />"+
//			"<image path='assets/instruments/insCircleFill2.png' />"+
//			"<image path='assets/instruments/insCircleRight2.png' />"+
//			"<image path='assets/instruments/insCircleWrong2.png' />"+
//			"<image path='assets/instruments/insRect.png' />"+
//			"<image path='assets/instruments/insRectDrop.png' />"+
//			"<image path='assets/instruments/insRectFill.png' />"+
//			"<image path='assets/instruments/insRectRight.png' />"+
//			"<image path='assets/instruments/insRectWrong.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/dj/dj_1.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/dj/dj_2.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/dj/dj_3.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/dj/dj_4.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/dj/dj_5.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/dj/dj_6.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_1.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_2.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_3.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_4.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_5.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_6.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_7.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_8.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_9.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_10.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_11.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_A.png' />"+
			"<image path='assets/NOTES/INSTRUMENTS_ICONS/abstract/dn_B.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_1.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_2.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_3.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_4.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_5.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_6.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_7.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_8.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/bottles/BOTTLES_IDLE_9.png' />"+
//			//BASS
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_1.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_2.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_3.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_4.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_5.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_6.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_7.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_8.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/BASS/BASS_IDLE_9.png' />"+
//			//DRUMS
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_IDLE_1.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_IDLE_2.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_IDLE_3.png' />"+
//			"<image path='assets/NOTES/INSTRUMENTS_ICONS/DRUMS/DRUMS_IDLE_4.png' />"+
			//SCRATCH
//			"<image path='assets/instruments/scratch/Vinyl.png' />"+
//			"<image path='assets/instruments/scratch/hey_idle.png' />"+
//			"<image path='assets/instruments/scratch/hey_s.png' />"+
//			"<image path='assets/instruments/scratch/notes_sheet_v.png' />"+
			"<image path='assets/vica/DJnormal.png' />"+
			"<image path='assets/vica/DJtap.png' />"+
			"<image path='assets/vica/hey.png' />"+
			"<image path='assets/vica/heyD.png' />"+
			"<image path='assets/vica/iron1normal.png' />"+
			"<image path='assets/vica/iron1tap.png' />"+
			"<image path='assets/vica/iron2normal.png' />"+
			"<image path='assets/vica/iron2tap.png' />"+
			"<image path='assets/vica/iron3normal.png' />"+
			"<image path='assets/vica/iron3tap.png' />"+
			
			"<image path='assets/vica/flute1.png' />"+
			"<image path='assets/vica/flute2.png' />"+
			"<image path='assets/vica/flute3.png' />"+
			"<image path='assets/vica/flute4.png' />"+
			"<image path='assets/vica/flute5.png' />"+
			"<image path='assets/vica/flute6.png' />"+
			"<image path='assets/vica/flute1_press.png' />"+
			"<image path='assets/vica/flute2_press.png' />"+
			"<image path='assets/vica/flute3_press.png' />"+
			"<image path='assets/vica/flute4_press.png' />"+
			"<image path='assets/vica/flute5_press.png' />"+
			"<image path='assets/vica/flute6_press.png' />"+
			
			"<image path='assets/vica/mic.png' />"+
			"<image path='assets/vica/pole.png' />"+
			"<image path='assets/vica/violin.png' />"+
			"<image path='assets/vica/red_arrow.png' />"+
			"<image path='assets/vica/record.png' />"+
			"<image path='assets/gui/SOUND_OFF.png' />"+
			"<image path='assets/gui/SOUND_ON.png' />"+
			"<image path='assets/vica/tryAgain.png' />"+
			"<image path='assets/vica/next.png' />"+
			
			
			//RECORD SCREEN BUTTONS
//			"<image path='assets/PRACTICE_RECORD_BUTTONS/PRACTICE_IDLE.png' />"+
//			"<image path='assets/PRACTICE_RECORD_BUTTONS/PRACTICE_PRESSED.png' />"+
//			"<image path='assets/PRACTICE_RECORD_BUTTONS/RECORD_IDLE.png' />"+
//			"<image path='assets/PRACTICE_RECORD_BUTTONS/RECORD_PRESSED.png' />"+
		//	"<image path='assets/open/bStrip.png' />"+
			"<image path='assets/line.png' />"+
			
			//SPRITESHEET
			"<image path='assets/band/drums_new/drumsSheet.png' />"+
			"<image path='assets/band/drums_new/drumsEyes.png' />"+
			"<image path='assets/band/bottles_new/bottlesSheet.png' />"+
			"<image path='assets/band/bottles_new/bottlesEyes.png' />"+
			
			"<image path='assets/band/bass/bassSheet.png' />"+
			"<image path='assets/band/bass/bassBlink.png' />"+
//			"<image path='assets/band/bg/quika.png' />"+
//			"<image path='assets/band/bg/ganza.png' />"+
//			"<image path='assets/band/bg/agogo.png' />"+
//			"<image path='assets/band/bg/chelo.png' />"+
//			"<image path='assets/metronome.png' />"+
			//DEMOSCREEN
			"<image path='assets/DEMO_SCREEN/JingleBells_nowPlaying.png' />"+
//			"<image path='assets/DEMO_SCREEN/OVER_THE_RAINBOW_nowPlaying.png' />"+
			"<image path='assets/DEMO_SCREEN/MOUTAIN_KING_nowPlaying.png' />"+
			"<image path='assets/DEMO_SCREEN/ODE_TO_JOY_nowPlaying.png' />"+
//			"<image path='assets/DEMO_SCREEN/WATERCOLORS_of_BRAZIL_nowPlaying.png' />"+
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
			
		//	"<image path='assets/DEMO_SCREEN/TIME_SLIDERv/TIMESLIDER_BLUE_RIGHT_SEGMENTv.png' />"+
		//	"<image path='assets/DEMO_SCREEN/TIME_SLIDERv/TIMESLIDER_BLUE_SEGMENTv.png' />"+
			
			//HAT
			"<image path='assets/band/hat/hat.png' />"+
			"<image path='assets/band/hat/coin.png' />"+
			//NOTES
			
//			"<image path='assets/representation/notes/note_h.png' />"+
//			"<image path='assets/representation/notes/note_hf.png' />"+
//			"<image path='assets/representation/notes/note_hs.png' />"+
//			"<image path='assets/representation/notes/note_q.png' />"+
//			"<image path='assets/representation/notes/note_qf.png' />"+
//			"<image path='assets/representation/notes/note_qs.png' />"+
//			"<image path='assets/representation/notes/note_w.png' />"+
//			"<image path='assets/representation/notes/note_wf.png' />"+
//			"<image path='assets/representation/notes/note_ws.png' />"+
			//visuals
//			"<image path='assets/representation/visuals/vis_1.png' />"+
//			"<image path='assets/representation/visuals/vis_2.png' />"+
//			"<image path='assets/representation/visuals/vis_4.png' />"+
//			//symbols
//			"<image path='assets/representation/symbols/icon_1.png' />"+
//			"<image path='assets/representation/symbols/icon_2.png' />"+
//			"<image path='assets/representation/symbols/icon_3.png' />"+
//			"<image path='assets/representation/symbols/icon_4.png' />"+
//			"<image path='assets/representation/symbols/icon_5.png' />"+
//			"<image path='assets/representation/symbols/icon_6.png' />"+
//			"<image path='assets/representation/symbols/icon_7.png' />"+
//			"<image path='assets/representation/symbols/icon_8.png' />"+
//			"<image path='assets/representation/symbols/icon_9.png' />"+
			//Representation
//			"<image path='assets/LISTEN_SCREEN/LISTEN_SCREEN_NOTES_SHEET.png' />"+
//			"<image path='assets/LISTEN_SCREEN/LISTEN_SCREEN_NOTES_BAR.png' />"+
//			"<image path='assets/LISTEN_SCREEN/BACK_BUTTON_IDLE.png' />"+
//			"<image path='assets/LISTEN_SCREEN/BACK_BUTTON_PRESSED.png' />"+
//			"<image path='assets/LISTEN_SCREEN/COLLAPSE_IDLE.png' />"+
//			"<image path='assets/LISTEN_SCREEN/COLLAPSE_PRESSED.png' />"+
//			"<image path='assets/LISTEN_SCREEN/EXPAND_IDLE.png' />"+
//			"<image path='assets/LISTEN_SCREEN/EXPAND_PRESSED.png' />"+
//			"<image path='assets/LISTEN_SCREEN/INSTRUMENT_TAB_AND_SHADOWS.png' />"+
//			"<image path='assets/LISTEN_SCREEN/LISTEN_SCREEN_BLUE_NEEDLE.png' />"+
//			"<image path='assets/LISTEN_SCREEN/mouse.png' />"+
//			"<image path='assets/LISTEN_SCREEN/PLAY_BUTTON_IDLE.png' />"+
//			"<image path='assets/LISTEN_SCREEN/PLAY_BUTTON_PRESSED.png' />"+
//			"<image path='assets/LISTEN_SCREEN/REPLAY_BUTTON_IDLE.png' />"+
//			"<image path='assets/LISTEN_SCREEN/REPLAY_BUTTON_PRESSED.png' />"+
//			"<image path='assets/LISTEN_SCREEN/blue_strip.png' />"+
//			"<image path='assets/LISTEN_SCREEN/bottles_icon.png' />"+
//			"<image path='assets/LISTEN_SCREEN/bass_icon.png' />"+
//			"<image path='assets/LISTEN_SCREEN/drum_icon.png' />"+
//
			
//			//Rrpresentation Menu
//			"<image path='assets/representation/menu/note.png' />"+
//			"<image path='assets/representation/menu/vis.png' />"+
//			"<image path='assets/representation/menu/number.png' />"+
			//Rrpresentation RadioList
//			"<image path='assets/gui/radioList/autoBtn.png' />"+
//			"<image path='assets/gui/radioList/autoBtn_selected.png' />"+
//			"<image path='assets/gui/radioList/noteBtn.png' />"+
//			"<image path='assets/gui/radioList/noteBtn_selected.png' />"+
//			"<image path='assets/gui/radioList/symbolBtn.png' />"+
//			"<image path='assets/gui/radioList/symbolBtn_selected.png' />"+
//			"<image path='assets/gui/radioList/numBtn.png' />"+
//			"<image path='assets/gui/radioList/numBtn_selected.png' />"+
			
			//GUI BUTTONS
//			"<image path='assets/gui/play_idle.png' />"+
//			"<image path='assets/gui/stop_idle.png' />"+
//			"<image path='assets/gui/play_pressed.png' />"+
//			"<image path='assets/gui/stop_pressed.png' />"+
//			"<image path='assets/gui/record_idle.png' />"+
//			"<image path='assets/gui/right_idle.png' />"+
//			"<image path='assets/gui/right_pressed.png' />"+
//			"<image path='assets/gui/left_idle.png' />"+
//			"<image path='assets/gui/left_pressed.png' />"+
//			"<image path='assets/gui/close.png' />"+
//			"<image path='assets/gui/info.png' />"+
//			"<image path='assets/gui/restart.png' />"+
//			"<image path='assets/gui/next_idle.png' />"+
//			"<image path='assets/gui/next_press.png' />"+
//			"<image path='assets/gui/swap.jpg' />"+
			"<image path='assets/gui/back.png' />"+
			"<image path='assets/gui/back_press.png' />"+
			"<image path='assets/gui/exit_idle.png' />"+
			"<image path='assets/gui/exit_press.png' />"+

//			"<image path='assets/gui/btn_home.png' />"+
//			"<image path='assets/gui/icon_current_screen.png' />"+
//			"<image path='assets/gui/icon_screen.png' />"+
			
			//BACKGROUND
			"<image path='assets/themes/ny/BCKGR_1.jpg' />"+
			//"<image path='assets/themes/ny/sign.png' />"+
			//CLOCK
			"<image path='assets/themes/ny/mahog_big.png' />"+
			"<image path='assets/themes/ny/mahog_small.png' />"+
			"<image path='assets/themes/ny/mahog_small2.png' />"+
			"<image path='assets/themes/ny/clock.png' />"+
			"<image path='assets/themes/ny/clock_highLight.png' />"+
			"<image path='assets/themes/ny/Pole_Left.png' />"+
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
			"<image path='assets/instruments/BOTTLES/bottle_10_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_10_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_11_idle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottle_11_SELECTED.png' />"+
			"<image path='assets/instruments/BOTTLES/Spot_light_bottle.png' />"+
			"<image path='assets/instruments/BOTTLES/spot_light_floor_bottle.png' />"+
			"<image path='assets/instruments/BOTTLES/bottles_frame.png' />"+
			"<image path='assets/instruments/BOTTLES/bottles_frame_lg.png' />"+
			
			"<image path='assets/instruments/DRUMS/DRUMS_1_IDLE.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_1_PRESSED.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_2_IDLE.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_2_PRESSED.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_3_IDLE.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_3_PRESSED.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_4_IDLE.png' />"+
			"<image path='assets/instruments/DRUMS/DRUMS_4_PRESSED.png' />"+

			"<image path='assets/instruments/CUICA/cuica.png' />"+
			"<image path='assets/instruments/CUICA/dot.png' />"+
			
			
//			"<image path='assets/instruments/marc.png' />"+
//			"<image path='assets/instruments/platein.png' />"+
			"<image path='assets/representation/icon_bottles.png' />"+
			"<image path='assets/representation/icon_bass.png' />"+
			"<image path='assets/representation/icon_drums.png' />"+
			"<image path='assets/representation/icon_mic.png' />"+
			//POPUP
			"<image path='assets/POP_UP/POP_UP_LEFT_SEGMENT.png' />"+
			"<image path='assets/POP_UP/POP_UP_LEFT_SIDE_ARROW.png' />"+
			"<image path='assets/POP_UP/POP_UP_LINE_SPLITTER_SEGMENT.png' />"+
			"<image path='assets/POP_UP/POP_UP_LOWER_ARROW_SEGMENT.png' />"+
			"<image path='assets/POP_UP/POP_UP_LOWER_LEFT_CORNER.png' />"+
			"<image path='assets/POP_UP/POP_UP_LOWER_RIGT_CORNER.png' />"+
			"<image path='assets/POP_UP/POP_UP_UPPER_LEFT_CORNER.png' />"+
			"<image path='assets/POP_UP/POP_UP_UPPER_RIGHT_CORNER.png' />"+
			"<image path='assets/POP_UP/POP_UP_RIGHT_SEGMENT.png' />"+
			"<image path='assets/POP_UP/POP_UP_RIGHT_SIDE_ARROW.png' />"+
			"<image path='assets/POP_UP/POP_UP_UPPER_ARROW_SEGMENT.png' />"+
			"<image path='assets/POP_UP/POP_UP_VERTICAL_SEGMENT.png' />"+
			"<image path='assets/POP_UP/BASS_PROFILE_PIC.png' />"+
			"<image path='assets/POP_UP/DRUMMER_PROFILE_PIC.png' />"+
			"<image path='assets/POP_UP/GIRL_PROFILE_PIC.png' />"+
			"<image path='assets/POP_UP/next_IDLE.png' />"+
			"<image path='assets/POP_UP/next_PRESSED.png' />"+
			"<image path='assets/POP_UP/record_IDLE.png' />"+
			"<image path='assets/POP_UP/record_PRESSED.png' />"+
			"<image path='assets/POP_UP/POP_UP_LINE_SPLITTER_SEGMENT.png' />"+
			
//			"<image path='assets/hour_glass.png' />"+
//			"<image path='assets/hour_glass_alert.png' />"+
			"<image path='assets/vica/freestyle.png' />"+
			"<image path='assets/vica/bgBlur.png' />"+
			"<image path='assets/vica/record_BTN_puse.png' />"+
			"<image path='assets/vica/record_BTN_play.png' />"+
			"<image path='assets/vica/play_BTN.png' />"+
			"<image path='assets/vica/play_BTN_puse.png' />"+
			"<image path='assets/vica/play_BTN_play.png' />"+
			"<image path='assets/gui/sign.png' />"+
			"<image path='assets/vica/scoreBg.png' />"+
			"<image path='assets/vica/scoreCover.png' />"+
			"<image path='assets/vica/menu.png' />"+
			"<image path='assets/vica/muteBTN_off.png' />"+
			"<image path='assets/vica/muteBTN_on.png' />"+
			
			"<image path='assets/ui/a.png' />"+
			"<image path='assets/ui/b.png' />"+
			"<image path='assets/ui/cb.png' />"+
			"<image path='assets/ui/cb_on.png' />"+
			"<image path='assets/ui/radio.png' />"+
			"<image path='assets/ui/radio_on.png' />"+
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
					//if(smooth){
						//(displayObj as Bitmap).cacheAsBitmap=true;
						(displayObj as Bitmap).smoothing=((Session.DeviceId==1)||smooth);
					//}
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
					(displayObj as Bitmap).smoothing=(Session.DeviceId==1);
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
					(displayObj as Bitmap).smoothing=(Session.DeviceId==1);
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