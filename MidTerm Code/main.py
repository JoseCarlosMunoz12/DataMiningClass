import numpy as np


def eigen(cov):
    w, v = np.linalg.eig(cov)
    print ("Printing the Eigen values of the Given square array:\n", w)
    print ("Printing the Eigen Vectors of the Given square array:\n", v)
    return v.transpose()


def center_data(name):
    m = np.loadtxt(name, dtype='i', delimiter=",")
    cm = np.mean(m, axis=0)
    print (cm)
    x_norm = m - np.mean(m, axis=0)
    print("Center Data is:")
    print (x_norm)
    x_norm_t = x_norm.transpose()
    cn = np.matmul(x_norm_t, x_norm)
    x, y = cn.shape
    cn = (1. / (x - 1.)) * cn
    print ("Covariance is:")
    print (cn)
    eig_m = eigen(cn)
    inv_eig_m = np.linalg.inv(eig_m)
    RotData = np.matmul(m, inv_eig_m)
    print ("rotated Dat is")
    print (RotData)


if __name__ == '__main__':
    center_data('Data.txt')
