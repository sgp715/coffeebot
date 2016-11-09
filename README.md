# Coffeebot

## Description
Coffeescript implementation of Michael Nielsen's [neural net tutorial](http://neuralnetworksanddeeplearning.com/chap1.html) , using Nodejs. The code itself is a neural network implementation. But, I have included examples and utilities that make it easy to learn from the MNIST database. The database contains labeled data of handwritten digits represented by black and white images. So, you can train the network to take in pixel data and output which digit it believes that image contains!

## Install

* Install [Nodejs](https://nodejs.org/en/)
* Clone the repo -> https://github.com/sgp715/coffeebot.git
* Then inside the repo run
```
$ npm install
```
* Install Coffeescript globally (to run from CLI)
```
$ sudo npm install -g coffeescript
```

## Usage

* Enter Coffeescript CLI
```
$ coffee
```
* Import the source files
```
coffee>  Network = require '../src/network.coffee'
coffee>  utils = require '../src/utils.coffee'
```
* Load data
```
coffee> data = utils.load 10000, 2000
```
* Create the network
```
coffee> n1 =  new Network([784, 30, 10])
```
* Train the network
```
coffee> n1.SGD(data.training, 30, 10, 3, (data.test.slice Math.floor(data.test.length * (2 / 5)), \
                                                 Math.floor(data.test.length)))
```
* Evaluate the network
```
coffee> accuracy = n1.evaluate data.test.slice Math.floor(data.test.length * (2 / 5)), \
                                       Math.floor(data.test.length * (4 / 5))
```
