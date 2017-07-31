function ytmp3
	youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg $argv
end
