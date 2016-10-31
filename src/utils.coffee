mnist = require 'mnist'

sigmoid = (z) ->
    1.0 / (1.0 + Math.exp(-z))

utils =

    load: (sample, test) ->
        mnist.set sample, test

    sigmoid: sigmoid

    sigmoid_prime: (z) ->
        sigmoid(z) * (1 - sigmoid(z))

module.exports = utils
