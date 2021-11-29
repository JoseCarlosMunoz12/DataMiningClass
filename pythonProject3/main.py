import random
import smtplib
import numpy as np


def generate_list(int_max):
    is_unique = False
    ls = []
    while not is_unique:
        ls = random.sample(range(int_max), int_max)
        for x in range(len(ls)):
            is_unique = True
            if x == ls[x]:
                is_unique = False
                break
    return ls


def main(name):
    m = np.loadtxt(name, dtype=None, delimiter=',')
    d = {}
    vec = []
    for line in m:
        d[line[0]] = line[1]
        vec.append(line[1])
    ls = generate_list(len(m))
    # generate the variables to connect to email to then send the the message
    for x in range(len(ls)):
        _from = vec[x]
        _to = vec[ls[x]]
        _giver = d[_from]
        _receiver = d[_giver]
        message = "{g}\n you are are to give a gift to {r}".format(g=_giver, r=_receiver)
        print(message)


main("emails.csv")
