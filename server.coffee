child_process = require('child_process')
express = require('express')
app = express()

camera = child_process.spawn('raspivid', ['-o', '-', '-t', '0'])
camera.stderr.pipe process.stderr

ffmpeg = child_process.spawn('ffmpeg', ['-i', '-', 
  '-vcodec', 'copy', 
  '-f', 'mp4', 
  '-movflags', 'frag_keyframe+empty_moov',
  '-reset_timestamps', '1',
  '-vsync', '1',
  '-flags', 'global_header',
  '-bsf:v', 'dump_extra',
  '-y', '-'])
ffmpeg.stderr.pipe process.stderr
camera.stdout.pipe ffmpeg.stdin

app.use express.logger()
app.all '*', (req, res) ->

  res.writeHead 200,
    'Connection': 'keep-alive'
    'Content-Type': 'video/mp4'
    'Accept-Ranges': 'bytes'
  
  ffmpeg.stdout.pipe res

app.listen(1337)
console.log 'Listening on 1337'
