import math
import numpy as np

def wieghts(w,a,y,n, first):
    val = w.dot(a)
    print(val)
    s = 1
    r = n * y * a
    if first:
        w = w + r
    if np.sign(y) == np.sign(val) or first:
        return [w,True]
    w = w + r
    return [w,False]

def wieghts_creation(name):
    m = np.loadtxt(name,dtype=None,delimiter=",")
    first = True
    all_safe = True
    w = np.array([0,0,0])
    while True:
        for data in m:
            a = np.array([data[0],data[1],data[2]])
            y = data[3]
            dict = wieghts(w,a,y,1,first)
            w = dict[0]
            print(w)
            if dict[1] == False:
                all_safe = False
            first = False
        if all_safe:
            break
        else:
            all_safe = True
            first = False

if __name__ == '__main__':
    wieghts_creation('Data.csv')