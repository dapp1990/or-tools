************************************************************************
file with basedata            : cn348_.bas
initial value random generator: 1653013994
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  18
horizon                       :  128
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  3   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     16      0       15        8       15
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          3           7   8  11
   3        3          3           5  12  17
   4        3          3           6  10  16
   5        3          2          13  14
   6        3          2          11  15
   7        3          1           9
   8        3          3          10  12  14
   9        3          3          10  14  17
  10        3          1          13
  11        3          1          17
  12        3          2          13  16
  13        3          1          15
  14        3          2          15  16
  15        3          1          18
  16        3          1          18
  17        3          1          18
  18        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2  N 3
------------------------------------------------------------------------
  1      1     0       0    0    0    0    0
  2      1     1       6    5   10    6    5
         2     1       8    5    8    8    6
         3    10       1    4    4    5    3
  3      1     6       3    6    8    6    6
         2     7       2    3    7    5    5
         3     8       1    2    6    5    5
  4      1     3       6    7    8    8    2
         2     6       5    7    6    8    2
         3    10       4    7    5    8    1
  5      1     1       4    6    6    4    7
         2     1       3    5    6    5    7
         3     3       3    3    4    1    7
  6      1     2       6    4    8    6    6
         2     3       6    4    7    6    5
         3     4       6    2    4    4    3
  7      1     1       3    9    5    9    5
         2     4       2    9    5    4    5
         3     7       2    8    5    1    4
  8      1     3       3    8   10    9    8
         2     4       2    6    9    8    8
         3     8       1    4    9    6    8
  9      1     2       5    3    2    8    9
         2     5       5    2    2    8    8
         3     9       4    1    2    6    7
 10      1     3       4    6    9    7    8
         2    10       4    4    9    1    6
         3    10       3    5    9    4    6
 11      1     5      10    4    6    4    8
         2     7       3    4    3    4    7
         3     7       3    4    5    4    6
 12      1     2       7    9    3    6    4
         2     4       4    6    3    5    3
         3     7       2    6    3    5    3
 13      1     1       9    8   10    7    3
         2     3       7    7    8    7    2
         3    10       5    5    6    6    2
 14      1     4       6    3    5    5    2
         2     5       3    3    5    5    1
         3     5       2    1    3    5    2
 15      1     4       2    7   10    9    9
         2     4       2    8    8   10    9
         3    10       2    6    7    8    7
 16      1     3       5    9    9    8    3
         2     3       4    8   10    8    3
         3    10       4    7    6    8    2
 17      1     2       8    6    4    8    7
         2     4       7    4    3    6    7
         3    10       7    1    3    1    6
 18      1     0       0    0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2  N 3
   25   30   97   94   82
************************************************************************