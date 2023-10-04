# docker-segment-audio

Generate segments of mp3's from source wav files for use with the our [stem player](https://stemplayer-js.com).

## Usage

```sh
docker build -t stemplayer-js-segment-audio .

docker run --rm -it -v $PWD:/workdir stemplayer-js-segment-audio \
    --input source/my-audio.wav \
    --output output
```
