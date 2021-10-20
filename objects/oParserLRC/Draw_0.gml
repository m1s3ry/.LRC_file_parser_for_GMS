draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width/2, room_height/2, lrcCurrentLyric);

if (file == undefined) {
	draw_text(room_width/2, 50, "Press F to load embedded .LRC file");
	exit;
}
 
if (!started)	draw_text(room_width/2, 50, "Press Space to start");	
else			draw_text(room_width/2, 50, "Playing song...");	
		
var _x1 = room_width / 16;
var _x2 = _x1 * 11;
draw_set_halign(fa_left);
draw_text(_x1, 80, "Filename: " + filename);
draw_text(_x2, 80, "Artist: " + lrcMetadataArtist);
draw_text(_x1, 100, "Album: " + lrcMetadataAlbum);
draw_text(_x2, 100, "Title: " + lrcMetadataTitle);
draw_text(_x1, 120, "Author: " + lrcMetadataAuthor);
draw_text(_x2, 120, "Length: " + lrcMetadataLength);

draw_text(_x1, 460, "LRC file by: " + lrcMetadataFileAuthor);
draw_text(_x1, 480, "LRC version: " + lrcMetadataVersion);
draw_text(_x1, 500, "LRC file hosted in: " + lrcMetadataPlayerAuthor);
