mkdir -p wav

while read -r url; do
  wget "$url"
done < flac.txt

for file in *.flac;
do
  ffmpeg -i "$file" "wav/${file%.flac}.wav"
done

rm *.flac