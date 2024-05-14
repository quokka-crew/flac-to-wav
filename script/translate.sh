for file in *.flac;
do
  ffmpeg -i "$file" "${file%.flac}.wav"
done