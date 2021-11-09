import math
import numpy as np


def wieghts(w, a, y, n, first):
    val = w.dot(a)
    print(a)
    print(val)
    r = n * y * a
    if first:
        w = w + r
        return [w, True]
    if np.sign(y) == np.sign(val):
        return [w, True]
    w = w + r
    return [w, False]


def wieghts_creation(name):
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
            ans = wieghts(w, a, y, n, first)
            w = ans[0]
            print(w)
            print('----')
            if ans[1] == False:
                all_safe = False
            first = False
        if all_safe:
            break
        else:
            all_safe = True
            first = False


if __name__ == '__main__':
    wieghts_creation('data.csv')
