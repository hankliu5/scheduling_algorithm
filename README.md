# Scheduling Algorithms

Since I am currently taking CSE 21 - "Algorithm" in UCSD, I decided to write a simple
application to demonstrate the scheduling algorithm.

There are List Scheduling, McNaughton Scheduling Algorithm, Longest Processing Time First
Scheduling (LPT) and Shortest Processing Time First Scheduling (SPT)

## Run

To run the application, just type:
```
ruby UserInput.rb
```
in the correct folder, and then you can follow the instructions to schedule the jobs
with these algorithms.

## List Scheduling

Assume there is a list of jobs, we take one job from the list in order and schedule
it on the one of the processors that has done the least amount of work so far.
If there are more than one processor have the same work hours, choose the one with
the smallest index.

The worst case of List Scheduling can be roughly up to `2` times longer time than
an optimal schedule.

## Longest Processing Time First Scheduling

First, sort the list of jobs by descending order, then use List Scheduling to put
these jobs into schedule.

The worst case of LPT can be roughly up to `4 / 3` times longer time than
an optimal schedule.

## Shortest Processing Time First Scheduling

First, sort the list of jobs by ascending order, then use List Scheduling to put
these jobs into schedule.

One of the advantages of SPT is the sum of hours for each work done is smaller than
above scheduling algorithm.

## McNaughton Scheduling Algorithm

There are some assumptions before using this algorithm:

1. The processing of the jobs can be interrupted
2. Continue to work on the jobs after an interruption is possible
  * on any processor
  * at any time
  * without any time penalty

## Future Works

Added some graphs to show how these algorithms work.
