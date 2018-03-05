# Examples

```
# Concate 3 source files using fancy GLX tranitions
# between each one.  Intro and Outr have no sound.
#
docker run --rm \
  --volume "$PWD":/video \
  --workdir /video \
  soodesune/ffmpeg:gl \
    -i intro.mp4 -i main.mp4 -i outro.mp4 \
    -filter_complex " \
      [0:v]split[v000][v010]; \
      [1:v]split[v100][v110]; \
      [2:v]split[v200][v210]; \
      [v000]trim=0:2[v001]; \
      [v010]trim=2:3[v011t]; \
      [v011t]setpts=PTS-STARTPTS[v011]; \
      [v100]trim=0:123[v101]; \
      [v110]trim=123:124[v111t]; \
      [v111t]setpts=PTS-STARTPTS[v111]; \
      [v200]trim=0:4[v201]; \
      [v210]trim=4:5[v211t]; \
      [v211t]setpts=PTS-STARTPTS[v211]; \
      [v011][v101]gltransition=duration=1:source=./crosswarp.glsl[vt0]; \
      [v111][v201]gltransition=duration=1[vt1]; \
      [v001][vt0][vt1][v211]concat=n=4[outv]; \
      [outv]subtitles=subtitle.srt[outs]; \
      [0:a]atrim=duration=2[a0]; \
      [a0][1:a][2:a]concat=n=3:v=0:a=1[outa]" \
    -map "[outs]" -map "[outa]" \
    -pix_fmt yuv420p \
    -y -f mpegts out.mp4
```


SPLIT: https://trac.ffmpeg.org/wiki/Creating%20multiple%20outputs
TRIM: https://ffmpeg.org/ffmpeg-filters.html#trim
SETPTS: https://ffmpeg.org/ffmpeg-filters.html#setpts_002c-asetpts
