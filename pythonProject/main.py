import pandas as pd
import numpy as np

#protectoron functions

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
    average = average /  count
    return  average

def center_mat(mat,vec):
    for row in mat:
        row = row - vec
    return  mat

def scatter_mat(mat):
    mat_t = mat.transpose()
    tt =  np.matmul(mat_t,mat)
    return tt

def get_sb(mu1,mu2):
    sub = np.matrix(mu1 - mu2)
    subt = sub.transpose()
    tt = np.matmul(subt,sub)
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
        if yVal == -1:
            x1parse.append(rs)
        else:
            x2parse.append(rs)
    # step 1) create 2 matrices
    x1 = np.matrix(x1parse)
    x2 = np.matrix(x2parse)
    # step 2) get vector average
    mu1 = get_mu(x1)
    mu2 = get_mu(x2)
    # step 3) center data
    x1c = center_mat(x1,mu1)
    x2c = center_mat(x2,mu2)
    # step 4) get scatter matrix
    sc0 = scatter_mat(x1c)
    sc1 = scatter_mat(x2c)
    # step 5) get Sw
    sw = sc0 + sc1
    # step 6) get SB
    sb = get_sb(mu1,mu2)
    # step 7) get Matrix
    inv = np.linalg.inv(sw)
    mat = np.matmul(inv,sb)
    # step 8) get eigen values
    u,v = np.linalg.eig(mat)
    w = v[:,1]
    # step 9) calculate seperator
    mu0w = np.dot(w,mu1)
    mu1w = np.dot(w,mu2)
    seperator = ( mu0w + mu1w) /2
    return [w,seperator]


if __name__ == '__main__':
    weights_creation('data.csv')
    ans = lda('LDA.csv')
