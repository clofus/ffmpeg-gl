docker run --rm \
  --volume "$PWD":/video \
  --workdir /video \
  clofus/ffmpeg:gl \
    -i ffmpeg-gl-transition/media/0.mp4 -i ffmpeg-gl-transition/media/1.mp4 -i ffmpeg-gl-transition/media/2.mp4 \
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
      [v011][v101]gltransition=duration=1:source=/filters/crosswarp.glsl[vt0]; \
      [v111][v201]gltransition=duration=1[vt1]; \
      [v001][vt0][vt1][v211]concat=n=4" \
    -pix_fmt yuv420p \
    -y -f mpegts out.mp4
