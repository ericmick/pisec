startRecording = require('child_process').spawn('python ./vid.py')
express = require('express')
app = express()
transcoder = require('stream-transcoder')
net = require('net')

recordingProcess = startRecording()
app.all '*', (req, res) ->
  client = net.connect 8000, () ->
    new Transcoder(client)
      .videoCodec('h264')
      .format('mp4')
      .stream()
      .pipe(res)
