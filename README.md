# Coffeebot

## Description
Coffeescript implementation of Michael Nielsen's [neural net tutorial](http://neuralnetworksanddeeplearning.com/chap1.html) , using Nodejs.

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
