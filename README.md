# docker-segment-audio

Pre-process source audio and convert it into HLS (m3u8) format that can be used with our [Stem Player](https://github.com/stemplayer-js/stemplayer-js).

## Usage

```sh
docker build -t stemplayer-js-segment-audio .

docker run --rm -it -v $PWD:/workdir stemplayer-js-segment-audio \
    --input source/my-audio.wav \
    --output output
```
