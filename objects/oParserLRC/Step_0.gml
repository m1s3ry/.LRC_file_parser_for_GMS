//Load .LRC file into lrcLyric array
if (keyboard_check_pressed(ord("F")) && file == undefined) {
	if (file_exists(filename)) {
		file = file_text_open_read(filename);
		while (!file_text_eof(file)) {
		    var _string = string_replace(file_text_read_string(file), "\n", "");
		    file_text_readln(file);
			StringParseLRC(_string);
		}
		lrcLyricPointerMax = lrcLyricPointer;
	}
}

//Starts playing the file
if (keyboard_check_pressed(vk_space) && file != undefined && !started) {
	started = true;
	//audio_play_sound(musAliceInChains_Would, 10, false); //I'm not sharing MP3s :D
	lrcLyricPointer = 0;
	lrcNextTimer = lrcLyric[lrcLyricPointer][0];
	lrcNextLyric = lrcLyric[lrcLyricPointer][1];
	timer = 0;
} 

if (!started)
	exit;
	
if (timer >= lrcNextTimer) {
	lrcCurrentLyric = lrcNextLyric;
	lrcLyricPointer++;
	if (lrcLyricPointer < lrcLyricPointerMax) {
		lrcNextTimer = lrcLyric[lrcLyricPointer][0];
		lrcNextLyric = lrcLyric[lrcLyricPointer][1];
	} else {
		lrcNextTimer = 0;
		lrcNextLyric = "";
		started = false;
	}
}

timer += delta_time;