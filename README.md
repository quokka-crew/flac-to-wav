## 사용하기 전 필요한 사항

해당 파일을 사용하기 위해서는 다음과 같은 종속성이 먼저 필요합니다.

사용 예시는 Mac OS를 기준으로 작성되었습니다.


1. homebrew << 다른 프로그램들을 명령줄 인터페이스로 다운로드 받기 위해 필요한 도구입니다.>>

2. wget << 스크립트에 필요합니다. >>

3. ffmpeg << 미디어 파일을 변환 시키는 데 필요합니다. >>



## installation

만약 home brew가 설치되지 않았다면 다음 명령어를 이용합니다.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

home brew가 설치되어있다는 가정으로 작성합니다.

```
brew install ffmpeg
brew install wget

```


위와 같이 의존성을 모두 설치했다면 다음으로 넘어갑니다.

## chomd

터미널이 쉘스크립트를 실행하기 위해서는 해당 파일에 대한 실행 권한이 필요합니다.

```
chmod +x automate.sh
chmod +x download.sh
chmod +x translate.sh
```

다음과 같이 automate.sh의 실행권한을 부여합니다.

## 사용

flac.txt에 사용하고자하는 경로를 집어넣습니다.



```
mkdir -p wav

while read -r url; do
  wget "$url"
done < flac.txt

for file in *.flac;
do
  ffmpeg -i "$file" "wav/${file%.flac}.wav"
done

rm *.flac
```

shell script의 done < flac.txt 부분을 다른 파일명으로 바꾸면 다른 파일명을 사용할 수 있습니다.

