while read -r url; do
  wget "$url"
done < urls.txt