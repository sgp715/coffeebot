Network = require '../src/network.coffee'
utils = require '../src/utils.coffee'
la = new (require 'linear-algebra')
Matrix = la.Matrix

describe 'network tests', () ->

    sizes = [2, 3, 1]
    n = new Network(sizes)

    data = utils.load 8000, 2000

    n1 =  new Network([784, 30, 10])

    it 'simple structure test', () ->

        num_layers = n.num_layers

        expect n.sizes
        .toEqual [2, 3, 1]

        expect num_layers
        .toBe 3

        expect n.biases.length
        .toBe num_layers - 1
        for i in [1..sizes.length - 1]
            expect n.biases[i - 1].cols
            .toBe sizes[i]
            expect n.biases[i - 1].rows
            .toBe 1

        expect n.weights.length
        .toBe num_layers - 1
        for i in [0..sizes.length - 2]
            expect n.weights[i].rows
            .toBe sizes[i]
            expect n.weights[i].cols
            .toBe sizes[i + 1]

    it 'sgd should cycle through data', () ->

        n1.SGD(data.training, 30, 10, 3, data.test.slice 1500, data.test.length)

        accuracy = n1.evaluate data.test.slice 0, 1500
        console.log 'Classified ' + accuracy + '% correctly!?'

        if accuracy < 90

            expect 1
            .toBe 0
