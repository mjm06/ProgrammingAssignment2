### Introduction

The script included in this repo (cachematrix.R) includes an
R function that calculates the inverse of a matrix, or, if the
matrix remains unchanged from the previous time the function 
was run, the function returns the cached inverse of the matrix.


This script was prepared as an assignment for the Coursera 
R Programming course. 
The goal is to take advantage of the scoping rules of R to
cache potentially time-consuming computations (such as calculating
the inverse of a matrix).


Note that, for this assignment, I assume that the matrix supplied is always
invertible.

