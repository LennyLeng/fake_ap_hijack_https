#!/bin/python
#utf-8

import sys
from urllib import unquote

print unquote(sys.stdin.read())
