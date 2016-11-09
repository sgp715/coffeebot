# Coffeebot

## Description
Coffeescript implementation of Michael Nielsen's [neural net tutorial](http://neuralnetworksanddeeplearning.com/chap1.html) , using Nodejs.

## Install

1. Install [Nodejs](https://nodejs.org/en/)
2. Clone the repo
3. Then inside the repo run
```
$ npm install
```
4. Install Coffeescript globally (to run from CLI)
```
$ sudo npm install -g coffeescript
```

## Usage

1. Enter Coffeescript CLI
```
$ coffee
```
2. Import the source files
```
coffee>  Network = require '../src/network.coffee'
coffee>  utils = require '../src/utils.coffee'
```
3. Load data
```
coffee> data = utils.load 10000, 2000
```
4. Create the network
```
coffee> n1 =  new Network([784, 30, 10])
```
5. Train the network
```
coffee> n1.SGD(data.training, 30, 10, 3, (data.test.slice Math.floor(data.test.length * (2 / 5)), \
                                                 Math.floor(data.test.length)))
```
6. Evaluate the network
```
coffee> accuracy = n1.evaluate data.test.slice Math.floor(data.test.length * (2 / 5)), \
                                       Math.floor(data.test.length * (4 / 5))
```
