timer = 0;
started = false;

file = undefined;
filename = "Alice in Chains - Would_.lrc";

lrcMetadataArtist		= "???";
lrcMetadataAlbum		= "???";
lrcMetadataTitle		= "???";
lrcMetadataAuthor		= "???";
lrcMetadataFileAuthor	= "???";
lrcMetadataPlayerAuthor = "???";
lrcMetadataVersion		= "???";
lrcMetadataLength		= "???";

lrcLyric[0][0]		= 0;
lrcLyric[0][1]		= "";
lrcLyricPointer		= 0;
lrcLyricPointerMax	= 0;

lrcCurrentLyric = "";
lrcNextLyric = "";
lrcNextTimer = 0;

function StringParseLRC(_string) {
	try {
		var _newstring = string_copy(_string, 1, 3);
		switch (_newstring) {
			case "[ar":
				var _data = StringCleanLRC(_string, 4);
				lrcMetadataArtist = _data;
				break;
			
			case "[al":
				var _data = StringCleanLRC(_string, 4);
				lrcMetadataAlbum = _data;
				break;
			
			case "[au":
				var _data = StringCleanLRC(_string, 4);
				lrcMetadataAuthor = _data;
				break;
		
			case "[ti":
				var _data = StringCleanLRC(_string, 4);
				lrcMetadataTitle = _data;
				break;
			
			case "[by":
				var _data = StringCleanLRC(_string, 4);
				lrcMetadataFileAuthor = _data;
				break;
			
			case "[re":
				var _data = StringCleanLRC(_string, 4);
				lrcMetadataPlayerAuthor = _data;
				break;
			
			case "[ve":
				var _data = StringCleanLRC(_string, 4);
				lrcMetadataVersion = _data;
				break;
			
			case "[le":
				var _data = StringCleanLRC(_string, 8);
				lrcMetadataLength = _data;
				break;
			
			case "[of":
				break;
			
			default:
				var _split = StringExplode("]", _string);
				var _timer = string_delete(_split[0], 1, 1);
				var _mins = real(string_copy(_timer, 1, 2));
				var _secs = real(string_copy(_timer, 4, 2));
				var _mili = real(string_copy(_timer, 7, 2));
				_secs *= 1000000;
				_secs += (60000000 * _mins);
				_mili *= 1000;
				lrcLyric[lrcLyricPointer][0] = (_mins + _secs + _mili);
				lrcLyric[lrcLyricPointer][1] = _split[1];
				lrcLyricPointer++;
				break;
		}
	} catch (_log) {
		show_debug_message("StringParseLRC() failed with string '" + _string + "'");
		show_debug_message("Full log: " + _log.longMessage);
	}
}

function StringCleanLRC(_string, _num) {
	var _stringClean = string_delete(_string, 1, _num);
	_stringClean = string_delete(_stringClean, string_length(_stringClean), 1);
	return _stringClean;
}

function StringExplode(_delimiter, _string) { // GMLscripts.com/license (original coded by Xot, https://www.gmlscripts.com/script/explode)
    var arr;
    _string = _string + _delimiter;
    var len = string_length(_delimiter);
    var ind = 0;
    repeat (string_count(_delimiter, _string)) {
        var pos = string_pos(_delimiter, _string) - 1;
        arr[ind] = string_copy(_string, 1, pos);
        _string = string_delete(_string, 1, pos + len);
        ind++;
    }
    return arr;
}