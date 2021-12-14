import math
import numpy as np


def dot_product(vec0, vec1):
    size = len(vec0)
    value = 0
    for ii in range(0, size):
        value += vec0[ii] * vec1[ii]
    return value


def corr(vec0, vec1):
    numerator = dot_product(vec0, vec1)
    denom0 = math.sqrt(dot_product(vec0, vec0))
    denom1 = math.sqrt(dot_product(vec1, vec1))
    denom = denom1 * denom0
    return numerator / denom


def hamming_dis(vec0, vec1):
    size = len(vec0)
    count = 0
    for ii in range(0, size):
        if vec0[ii] != vec1[ii]:
            count += 1
    return count


def hamming_values(name):
    vecs = np.loadtxt(name, dtype=None, delimiter=",")
    matt = []
    for var0 in vecs:
        row = []
        for var1 in vecs:
            dis = hamming_dis(var0, var1)
            row.append(dis)
        matt.append(row)
    mat = np.matrix(matt)
    print (mat)


def co_cor(name):
    vecs = np.loadtxt(name, dtype=None, delimiter=",")
    value = corr(vecs[0], vecs[1])
    print value


def main():
    # hamming part of the exam
    hamming_values("data.csv")
    # phonetic correlation
    co_cor("data0.csv")


if __name__ == '__main__':
    main()
