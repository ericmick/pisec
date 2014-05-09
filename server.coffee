child_process = require('child_process')
express = require('express')
app = express()
fs = require('fs')
camera = child_process.spawn('raspivid', ['-o', '-', '-t', '0'])
ffmpeg = child_process.spawn('ffmpeg', ['-i', '-', 
  '-vcodec', 'copy', 
  '-f', 'mp4', 
  '-movflags', 'frag_keyframe+empty_moov',
  '-reset_timestamps', '1',
  '-vsync', '1',
  '-flags', 'global_header',
  '-bsf:v', 'dump_extra',
  '-y', '-'])

app.use express.logger()
app.all '*', (req, res) ->
  res.writeHead 200,
    'Connection': 'keep-alive'
    'Content-Type': 'video/mp4'
    'Accept-Ranges': 'bytes'
  camera.stdout.pipe ffmpeg.stdin
  ffmpeg.stdout.pipe res
app.listen(1337)
