utils = require './utils.coffee'
la = new (require 'linear-algebra')
Matrix = la.Matrix

class Network


    constructor: (@sizes) ->

        @num_layers = @sizes.length
        @biases = []
        @biases.push(utils.random 1, y) for y in @sizes.slice(1, @num_layers)
        @weights = []
        @weights.push(utils.random @sizes[i], @sizes[i + 1]) for i in [0..@num_layers - 2]


    feedforward: (a) ->

        activations = new a

        for i in [0..@weights.length - 1]
            activations = ((activations.dot @weights[i]).plus @biases[i]).sigmoid()

        activations


    SGD: (training_data, epochs, mini_batch_size, eta, test_data = null) ->

        n = training_data.length
        for e in [1..epochs]

            utils.shuffle(training_data)

            mini_batches = [(training_data.slice k, k + mini_batch_size) for k in [0..n - 1] by 2]

            for mini_batch in mini_batches
                update_mini_batch(mini_batch, eta)
                console.log 'Epoch ' + e + ' completed.'

                # TODO: continually print progress


    update_mini_batch = (mini_batch, eta) ->
        console.log 'implement update mini batch'
        backprop()


    backprop = (x, y) ->
        console.log 'implement backprop'


    evaluate: (test_data) ->

        correct = 0
        total = 0

        for d in test_data

            expected = Math.max.apply null, d.output
            actual = Math.max.apply null, d.input

            console.log 'e' + expected
            console.log 'a' + actual
            if expected == actual
                correct += 1
            total += 1

        return (correct / total) * 100


    cost_derivative = () ->

        console.log 'implement cost function'





module.exports = Network
