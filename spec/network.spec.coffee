Network = require '../src/network.coffee'
utils = require '../src/utils.coffee'

describe 'network tests', () ->

    sizes = [2, 3, 1]
    n = new Network(sizes)

    data = utils.load 10, 10
    # console.log data

    # digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    #
    # find_digit = (label) ->
    #
    #     for l, i in label
    #         if l == 1
    #             return digits[i]

    it 'simple structure test', () ->

        num_layers = n.num_layers

        expect n.sizes
        .toEqual [2, 3, 1]

        expect num_layers
        .toBe 3

        expect n.biases.length
        .toBe num_layers - 1
        for i in [1..sizes.length - 1]
            expect n.biases[i - 1].rows
            .toBe sizes[i]

        expect n.weights.length
        .toBe num_layers - 1
        for i in [0..sizes.length - 2]
            expect n.weights[i].rows
            .toBe sizes[i]
            expect n.weights[i].cols
            .toBe sizes[i + 1]

    it 'feedforward returns response', () ->

        test_input = data.test[0]
        test_output = n.feedforward(test_input)

        expect test_input.length
        .toBe test_output.length
