import math
import numpy as np


def z_func(pa, pb, n):
    diff = pa - pb
    p = (pa + pb) / 2.0
    dev = math.sqrt((2 * p * (1 - p)) / n)
    return diff / dev


def center_data(name):
    m = np.loadtxt(name, dtype=None, delimiter=",")
    units = [[1, 1], [1, 2], [1, 3], [2, 1], [2, 2], [2, 3], [3, 1], [3, 2], [1, 3]]
    for items in units:
        ans = [0, 0, 0]
        for val in m:
            z = z_func(val[items[0]], val[items[1]], val[0])
            if z > 1.96:
                ans[0] += 1
            elif z < -1.96
                ans[1] += 1
            else:
                ans[1] += 1
        print(ans)


if __name__ == '__main__':
    center_data('Data.txt')
