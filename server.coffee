child_process = require('child_process')
express = require('express')
app = express()
fs = require('fs')
camera = child_process.spawn('raspivid', ['-o', '-', '-t', '0'])

app.all '*', (req, res) ->
  res.setHeader 'Content-Type', 'video/mp4'
  camera.stdout.pipe res
app.listen(1337)
