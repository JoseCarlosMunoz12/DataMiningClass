import pandas as pd
import numpy as np


# protectron functions


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
    ar.append(1)
    w = np.asarray(ar)
    n = 1
    while True:
        for data in m:
            vec = []
            for num in range(size - 1):
                vec.append(data[num])
            vec.append(1)
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


# lda functions


def get_mu(mat):
    count = 0
    size = mat.shape
    average = [0] * size[1]
    for row in mat:
        average += row
        count += 1
    average = average / count
    return average


def center_mat(mat, vec):
    points = mat.mean(axis=0)
    return mat - points


def scatter_mat(mat):
    mat_t = mat.transpose()
    tt = np.matmul(mat_t, mat)
    return tt


def get_sb(mu1, mu2):
    sub = np.matrix(mu1 - mu2)
    subt = sub.transpose()
    tt = np.matmul(subt, sub)
    return tt


def lda(name):
    m = np.loadtxt(name, dtype=None, delimiter=',')
    x1parse = []
    x2parse = []
    size = len(m[0])
    # parse data
    for data in m:
        yVal = data[size - 1]
        vec = []
        for x in range(size - 1):
            vec.append(data[x])
        rs = np.asarray(vec)
        if yVal == 1:
            x1parse.append(rs)
        else:
            x2parse.append(rs)
    # step 1) create 2 matrices
    x1 = np.matrix(x1parse)
    print (x1)
    x2 = np.matrix(x2parse)
    print (x2)
    # step 2) get vector average
    mu1 = get_mu(x1)
    print (mu1)
    mu2 = get_mu(x2)
    print (mu2)
    # step 3) center data
    x1c = center_mat(x1, mu1)
    print (x1c)
    x2c = center_mat(x2, mu2)
    print (x2c)
    # step 4) get scatter matrix
    sc0 = scatter_mat(x1c)
    print (sc0)
    sc1 = scatter_mat(x2c)
    print (sc1)
    # step 5) get Sw
    sw = sc0 + sc1
    print (sw)
    # step 6) get SB
    sb = get_sb(mu1, mu2)
    print (sb)
    # step 7) get Matrix
    inv = np.linalg.inv(sw)
    mat = np.matmul(inv, sb)
    print (mat)
    # step 8) get eigen values
    u, v = np.linalg.eig(mat)
    w = v[:, 1]
    print (w)
    # step 9) calculate seperator
    mu0w = np.matmul(mu1, w)
    mu1w = np.matmul(mu2, w)
    print (mu0w)
    print (mu1w)
    seperator = (mu0w + mu1w) / 2
    print (seperator)
    return [w, seperator]


# Neighbor algorithms


def majority(rows, neighbor):
    x0 = 0
    x1 = 0
    for x in range(neighbor):
        if rows[x][1] == 1:
            x1 += 1
        else:
            x0 += 1
    if x1 > x0:
        print ('is class 1')
    else:
        print ('is class 2')


def weights_majority(rows, neighbor):
    x0 = 0
    x1 = 0
    for x in range(neighbor):
        val = rows[x][0]
        val = val * val
        val = 1 / val
        if rows[x][1] == 1:
            x1 += val
        else:
            x0 += val
    if x1 > x0:
        print ('is class 1')
    else:
        print ('is class 2')


def knn(name, main_value):
    m = np.loadtxt(name, dtype=None, delimiter=",")
    diffs = []
    count = 0
    for row in m:
        var = abs(row[0] - main_value)
        diffs.append([var, count])
        count += 1
    diffs.sort(key=lambda y: y[0])
    sorted = []
    for row in diffs:
        sorted.append([row[0], m[row[1]][1]])
    neighbors = [1, 3, 5, 9]
    for neighs in neighbors:
        majority(sorted, neighs)
        weights_majority(sorted, neighs)


if __name__ == '__main__':
    weights_creation('data.csv')
    ans = lda('LDA.csv')
    pnt = [5, 4]
    value = np.matmul(pnt, ans[0])
    print (value)
    knn('KNN.csv', 5)


