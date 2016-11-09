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

        activations = new Matrix a

        for i in [0..@weights.length - 1]
            #console.log 'activations'
            #console.log activations
            activations = ((activations.dot @weights[i]).plus @biases[i]).sigmoid()

        activations


    SGD: (training_data, epochs, mini_batch_size, eta, test_data = null) ->

        n = training_data.length
        for e in [1..epochs]

            utils.shuffle(training_data)

            mini_batches = []
            mini_batches.push(training_data.slice k, k + mini_batch_size) for k in [0..n - 1] by mini_batch_size

            console.log 'Starting to train...'

            for mini_batch in mini_batches
                biases_and_weights = this.update_mini_batch(mini_batch, eta)


            console.log 'Epoch ' + e + ' completed'

                # TODO: continually print progress


    update_mini_batch: (mini_batch, eta) ->

        new_biases = []
        new_biases.push Matrix.zero b.rows, b.cols for b in @biases
        new_weights = []
        new_weights.push Matrix.zero w.rows, w.cols for w in @weights
        #console.log new_weights

        for data in mini_batch

            w_n_b = this.backprop(data.input, data.output)
            biases_deltas = w_n_b.biases
            (new_biases[i].plus biases_deltas[i]) for i in [0..@biases.length - 1]
            weight_deltas = w_n_b.weights
            (new_weights[i].plus weight_deltas[i]) for i in [0..@weights.length - 1]

        calculate_change = (v) ->
            coefficient = (eta / mini_batch.length)
            coefficient * v

        for i in [0..@biases.length - 1]
            @biases[i] = @biases[i].minus (new_biases[i].map calculate_change)

        for i in [0..@weights.length - 1]
             @weights[i] = @weights[i].minus (new_weights[i].map calculate_change)

    backprop: (x, y) ->

        # holds the activations at each layer
        activation = new Matrix x
        activations = [activation]
        zs = []
        output = new Matrix y

        # TODO: assert same number of w as b

        for i in [0..@weights.length - 1]

            z = (activation.dot @weights[i]).plus @biases[i]
            zs.push z
            activation = (z).sigmoid()
            activations.push activation

        output_activations = activations[activations.length - 1]
        output_zs = zs[zs.length - 1]
        delta = calculate_delta(output_activations, output, output_zs)

        backprop_b = []
        backprop_b.push Matrix.zero b.rows, b.cols for b in @biases
        backprop_w = []
        backprop_w.push Matrix.zero w.rows, w.cols for w in @weights

        for L in [2..@num_layers - 1]
            z = zs[zs.length - L]
            sp = sigmoid_prime(z).trans()
            delta = ((@weights[@weights.length - L + 1].dot delta.trans()).mul sp).trans()
            # console.log backprop_b[backprop_b.length - L].rows
            # console.log backprop_b[backprop_b.length - L].cols
            backprop_b[backprop_b.length - L] = delta
            # console.log backprop_b[backprop_b.length - L].rows
            # console.log backprop_b[backprop_b.length - L].cols
            # backprop_w[backprop_w.length - L] = delta.dot activations[activations.length - L - 1]

        { 'biases': backprop_b, 'weights': backprop_w }

    evaluate: (test_data) ->

        correct = 0
        total = 0

        for d in test_data

            expected = utils.max d.output
            actual = utils.max (this.feedforward d.input).toArray()[0]

            # console.log actual
            # console.log expected

            if expected == actual
                correct += 1
            total += 1

        (correct / total) * 100

    sigmoid_prime = (z) ->

        ones = (Matrix.zero z.rows, z.cols).plusEach 1
        sigmoid_minus = ones.minus z.sigmoid()
        z.sigmoid().mul sigmoid_minus


    calculate_delta = (output_activations, output, output_zs) ->

        delta = (output_activations.minus output).mul(sigmoid_prime output_zs)

    # cost_derivative: () ->
    #
    #     console.log 'implement cost function'





module.exports = Network
