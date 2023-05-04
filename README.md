# docker-segment-audio

Generate segments of mp3's from source wav files for use with the our [stem player](https://www.sound.ws/products/stem-player).

## Usage

Assuming your wav is `$PWD/my-audio.wav` and you'd like your stems to be put in `$PWD/audio`:

```sh
docker run --rm -it -v $PWD:/workdir ghcr.io/sound-ws/docker-segment-audio:latest \
    --input my-audio.wav \
    --output audio
```

## Building

docker build -t docker-segment-audio .
