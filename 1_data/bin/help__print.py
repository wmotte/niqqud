#!/usr/bin/env python

"""
Print Hebrew in RTL format. 
"""

# Author:   Wim Otte <w.m.otte@umcutrecht.nl>

import os
import sys
import argparse
from bidi.algorithm import get_display

###
# Print line per line
##
def print_lines( infile ):
    fileHandler = open( infile, 'r' )
    listOfLines = fileHandler.readlines()
    fileHandler.close()
    for line in listOfLines:
        print( get_display( line.strip() )  )
    return 0

###############################################


def main():
    # argument parser
    parser = argparse.ArgumentParser( description = 'Print Hebrew from right to left.' )
    parser.add_argument( '-i','--infile', help = 'Input file', required = True )
    parsed = parser.parse_args()    

    # get input/output info
    infile = parsed.infile
    
    # print lines
    print_lines( infile )


###############################################

# run main
if __name__== "__main__":
    main()
