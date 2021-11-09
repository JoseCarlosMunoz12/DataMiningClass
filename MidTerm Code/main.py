import math
import numpy as np


def weights(w, a, y, n, first):
    val = w.dot(a)
    print(a)
    print(val)
    r = n * y * a
    if first:
        w = w + r
        return [w, True]
    if val == 0 and y >= 0:
        return [w, True]
    if np.sign(y) == np.sign(val):
        return [w, True]
    w = w + r
    return [w, False]


def weights_creation(name):
    m = np.loadtxt(name, dtype=None, delimiter=",")
    first = True
    all_safe = True
    ar = []
    size = len(m[0])
    for x in range(size - 1):
        ar.append(0)
    w = np.asarray(ar)
    n = 1
    while True:
        for data in m:
            vec = []
            for num in range(size - 1):
                vec.append(data[num])
            a = np.asarray(vec)
            y = data[size - 1]
            ans = weights(w, a, y, n, first)
            w = ans[0]
            print(w)
            print('----')
            if not ans[1]:
                all_safe = False
            first = False
        if all_safe:
            break
        else:
            all_safe = True
            first = False


def lda(name):
    m = np.load(name, dtype=None, delimiter=',')
    x1 = []
    x2 = []
    size = len(m[0])
    # parse data
    for data in m:
        yVal = data[size - 1]
        vec = []
        for x in range(size - 1):
            vec.append(data[x])
        rs = np.asarray(vec)
        if yVal == -1:
            x1.append(rs)
        else:
            x2.append(rs)
    # start LDA
    
    print(size)


if __name__ == '__main__':
    weights_creation('data.csv')
    # lda('data.csv')
