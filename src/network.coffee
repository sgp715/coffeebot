utils = require './utils.coffee'
la = new (require 'linear-algebra')
Matrix = la.Matrix

class Network

    constructor: (@sizes) ->

        @num_layers = @sizes.length
        @biases = []
        @biases.push(Matrix.zero y, 1) for y in @sizes.slice(1, @num_layers)
        @weights = []
        @weights.push(Matrix.zero @sizes[i], @sizes[i + 1]) for i in [0..@num_layers - 2]

    feedforward: (a) ->

        for i in [0..a.length-1]
            a = utils.sigmoid(a.dot(@weights, a) + @biases)

        a

module.exports = Network
