Network = require '../src/network.coffee'

describe 'when initing network creates correct network', () ->

    it 'simple structure test', () ->

        sizes = [2, 3, 1]

        n = new Network(sizes)

        num_layers = n.num_layers

        expect n.sizes
        .toEqual [2, 3, 1]

        expect num_layers
        .toBe 3

        console.log n.biases
        expect n.biases.length
        .toBe num_layers - 1
        for i in [1..sizes.length - 1]
            expect n.biases[i - 1].rows
            .toBe sizes[i]

        console.log n.weights
        expect n.weights.length
        .toBe num_layers - 1
        for i in [0..sizes.length - 2]
            expect n.weights[i].rows
            .toBe sizes[i]
            expect n.weights[i].cols
            .toBe sizes[i + 1]
