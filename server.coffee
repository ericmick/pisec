child_process = require('child_process')
express = require('express')
app = express()
fs = require('fs')
camera = child_process.spawn('raspistill', ['-o', '-', '-t', '100', '-w', '800', '-h', '600', '-s'])

app.all '*', (req, res) ->
  res.setHeader 'Content-Type', 'image/jpeg'
  camera.stdout.pipe res
  camera.kill 'SIGUSR1'
  setTimeout () -> 
    res.end()
  , 1000
app.listen(1337)
