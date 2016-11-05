utils = require '../src/utils.coffee'
la = new (require 'linear-algebra')
Matrix = la.Matrix

describe 'utils tests', () ->

    matrix = new Matrix [[1, 2], [3, 4]]

    it 'returns randomized matrix with elements ranging -1 to 1', () ->

        m = utils.random(2, 3)

        expect m.rows
        .toBe 2

        expect m.cols
        .toBe 3

        data = m.data
        for r in data
            for e in r
                if e >= 1 or e < -1
                    console.log e
                    # never reach here
                    expect 1
                    .toBe 0

    it 'shuffle return shuffled array', () ->

        a = [0, 1, 2, 3, 4, 5]
        s = [0, 1, 2, 3, 4, 5]
        utils.shuffle(s)

        expect a.length
        .toBe s.length

        for i in [0..a.length - 1]
            if s.indexOf(a[i]) == -1
                console.log 'shuffled arrays did not contain same'
                expect 1
                .toBe 0
#
#     # sigmoid
#     it 'when sigmoid is passed -1 return 0.2689414213699951', () ->
#         expect utils.sigmoid -1
#         .toBe 0.2689414213699951
#     it 'when sigmoid is passed 0 return 0.5', () ->
#         expect utils.sigmoid 0
#         .toBe 0.5
#     it 'when sigmoid is passed 100 return 1', () ->
#         expect utils.sigmoid 100
#         .toBe 1
#
#     # sigmoid_prime
#     it 'when sigmoid_prime is passed -1 return 0.199..', () ->
#         expect utils.sigmoid_prime -1
#         .toBe 0.19661193324148185
#     it 'when sigmoid is passed 0 return 0.25', () ->
#         expect utils.sigmoid_prime 0
#         .toBe 0.25
#     it 'when sigmoid is passed 100 return 0', () ->
#         expect utils.sigmoid_prime 100
#         .toBe 0
