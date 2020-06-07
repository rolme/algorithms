# (2Max)[https://programmingpraxis.com/2020/06/05/2max/]
June 5, 2020
Today’s exercise comes from (Stack Overflow)[https://stackoverflow.com/q/59513876]:

## Problem Description
Given an array A consisting of N integers, return the maximum sum of two numbers whose digits add up to an equal sum. If there are not two numbers whose digits have an equal sum, the function should return -1. For example, A = [51, 71, 17, 42] would output 93 because there are two sets of numbers with the same digit-sum, (51, 42) with a digit-sum of 6 and (17, 71) with a digit-sum of 8, and the first pair has the maximum sum of two numbers of 93.

Your task is to write a program to calculated the requested maximum sum. When you are finished, you are welcome to read or run a suggested solution, or to post your own solution or discuss the exercise in the comments below.

## Strategies
- start with a small sample
- think of edge cases
  - value is 0
  - value is negative
- deal with negative numbers after
- use look up table
- storing max

## Walking through problem
A = [51, 71, 17, 42]
sum list loop
6 = 51, 42
8 = 71, 17

max list loop
if list length 0, return 0
if list length 1, return list[0]
if list length 2, return list[0] + list[1]
if list length > 2, loop for max 2 and return sum