import numpy as np
import pandas as pd


def print_hi(name):
    m = np.loadtxt(name, dtype='i', delimiter=",")
    print ("Printing the original square array:\n", m)
    w, v = np.linalg.eig(m)
    print ("Printing the Eigen values of the Given square array:\n", w)
    print ("Printing the Eigen Vectors of the Given square array:\n", v)


def center_data(name):
    m = np.loadtxt(name, dtype='i', delimiter=",")
    cm = np.mean(m, axis=0)
    print (cm)
    x_norm = m - np.mean(m, axis=0)
    print(x_norm)


if __name__ == '__main__':
    print_hi('Covariance Matrix.txt')
    center_data('Data.txt')
