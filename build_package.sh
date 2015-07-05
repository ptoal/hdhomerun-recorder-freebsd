#!/bin/sh
portlint && make clean && make stage && make check-orphans && make package
