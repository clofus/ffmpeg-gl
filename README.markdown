# Ffmpeg with built in GL transitions

## Build Docker Image

### Step: 1
Build Docker image with ffmpeg

`docker build . -f base_dockerfile -t clofus/ffmpeg:base`

### Step: 2
Build Docker image with ffmpeg + gl tranistion 

`docker build . -f gl_dockerfile -t clofus/ffmpeg:gl`


Based on these two projects:
- https://github.com/transitive-bullshit/ffmpeg-gl-transition
- https://github.com/jrottenberg/ffmpeg

## Examples

`
sh example.sh
`

SPLIT: https://trac.ffmpeg.org/wiki/Creating%20multiple%20outputs
TRIM: https://ffmpeg.org/ffmpeg-filters.html#trim
SETPTS: https://ffmpeg.org/ffmpeg-filters.html#setpts_002c-asetpts

## Available transitions

- crosswarp
- cube
- Butterflywavescrawler
- circlecrop
- circle
- simplezoom
- InvertedPageCurl
- Dreamy
- Mosaic
- DreamyZoom
- doorway
- fadecolor
- rotate_scale_fade
- swap

Remaining not tested yet...
