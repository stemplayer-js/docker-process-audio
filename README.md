# @sound-ws/docker-segment-audio

Generate segments of mp3's from source wav files for use with the out [stem player](https://www.sound.ws/products/stem-player).

## Usage

Assuming your wav is `$PWD/my-audio.wav` and you'd like your stems to be put in `$PWD/audio`:

```bash
docker run --rm -it -v $PWD:/workdir docker.pkg.github.com/sound-ws/docker-segment-audio/docker-segment-audio:latest \
    --input my-audio.wav \
    --output audio
```

## Licence

Copyright (c) 2020 Sound Web Services Ltd.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
