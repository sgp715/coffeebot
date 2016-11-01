utils = require './utils.coffee'
la = new (require 'linear-algebra')
Matrix = la.Matrix
Vector = la.Vector

class Network

    # TODO: make weights and biases random
    constructor: (@sizes) ->

        @num_layers = @sizes.length
        @biases = []
        @biases.push(Matrix.zero 1, y) for y in @sizes.slice(1, @num_layers)
        @weights = []
        @weights.push(Matrix.zero @sizes[i], @sizes[i + 1]) for i in [0..@num_layers - 2]

    feedforward: (a) ->

        activations = new Matrix a

        for i in [0..a.length-1]
            activations = ((activations.dot @weights[i]).plus @biases[i]).sigmoid()

        activations

    # SGD(training_data, epochs, mini_batch_size, eta): ->

    # update_mini_batch(mini_batch, eta): ->

    # backprop: ->




module.exports = Network
