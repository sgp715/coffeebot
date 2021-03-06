mnist = require 'mnist'
la = new (require 'linear-algebra')
Matrix = la.Matrix

sigmoid = (z) ->
    z.sigmoid()

utils =

    load: (sample, test) ->

        mnist.set sample, test


    random: (r, c) ->

        m = Matrix.zero r, c
        m.map (v) ->
            v + (Math.random() * 2) - 1


    shuffle: (a) ->

        l = a.length

        for i in [0..l - 1]
            r = Math.floor (Math.random() * l)
            r_val = a[r]
            i_val = a[i]
            a[r] = i_val
            a[i] = r_val


    max: (array) ->

        index = null

        for i in [0..array.length - 1]

            if index == null
                index = i
                continue

            if array[index] < array[i]
                index = i

        index



module.exports = utils
