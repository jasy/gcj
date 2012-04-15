#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import string

def main():
    g = string.maketrans('abcdefghijklmnopqrstuvwxyz','yhesocvxduiglbkrztnwjpfmaq')
    T = int(sys.stdin.readline())
    for x in range(T):
        print( "Case #" + str(x+1) + ": " + sys.stdin.readline().rstrip("\r\n").translate(g) )

if __name__ == '__main__':
    main()
