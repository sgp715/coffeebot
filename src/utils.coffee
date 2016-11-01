mnist = require 'mnist'

sigmoid = (z) ->
    z.sigmoid()

utils =

    load: (sample, test) ->
        mnist.set sample, test

    # sigmoid_prime: (z) ->
    #     rows = z.rows
    #     cols = z.cols
    #     ones = Matrix.zero rows, cols
    #     (sigmoid z).mul ones.minus sigmoid z

module.exports = utils
