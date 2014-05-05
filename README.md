#pisec
This is a work in progress.  Watch if you'd like to know when I get this working.

Pisec is a module for using the raspberr

## setup
Here's how to get started from a fresh install of Raspbian Wheezy (2014-01-07).

0. Install the Raspberry Pi camera board
Before you get started, make sure you've connected and enabled the camera per the [instructions](http://www.raspberrypi.org/documentation/usage/camera/).
Also, make sure Raspbian, Node.js, and npm are installed and up to date.
```
sudo apt-get upgrade;
sudo apt-get update
wget http://nodejs.org/dist/v0.11.9/node-v0.11.9-linux-arm-pi.tar.gz
tar -xvzf node-v0.11.9-linux-arm-pi.tar.gz
NODE_JS_HOME=/home/pi/node-v0.10.2-linux-arm-pi
PATH=$PATH:$NODE_JS_HOME/bin
```
1. Install python-picamera (camera interface)
```
sudo apt-get install python-picamera
```
2. Install ffmpeg (video transcoder)
```
sudo apt-get ffmpeg
```
3. Clone this repository, install and run it
```
git clone https://github.com/ericmick/pisec.git
cd pisec
npm install
node server.js
```
