### Non-Divisible Subset
**Link:** https://www.hackerrank.com/challenges/non-divisible-subset

### Problem
Given a set of distinct an integers, print the size of maximal subset of `S` where the sum of any 2 numbers in `S'` is not evenly divisible by `k`.

***Example:***
```
S = [19, 10, 12, 10, 24, 25, 22]
k = 4

One of the arrays that can be created is S'[0] = [10, 12, 25]. Another is S'[1] = [19, 22, 24].
After testing all permutations, the maximum length solution array has 3 elements.
```

### Solution
- The first, we will talk about divisible. If `(a + b) % k = 0` then we have two cases:
    + Case 1: `a % k = 0` and `b % k = 0`. For example `(10 + 15) % 5 = 0` then `10 % 5 = 0` and `15 % 5 = 0`
    + Case 2: `a % k = n` and `b % k = m` then `m + n` is divisible by `k`. For example `(13 + 22) % 5 = 0`, we have `13 % 5 = 3` and `22 % 5 = 2` and `(3 + 2) % 5 = 0`
- For case 1, we can not put more than two elements into the subset because they will make it divisible by k. So in this case, we can take at most one element. The total elements can be put to the subset is calculation by following formula: 
`total_elements = min(count(number_divisible_by_k), 1)`
- For case 2, `a % k = n` and `b % k = m` and `(n + m) % k = 0`. It's quite similar to case 1. We can not put both `a` and `b` elements into the subset because the sum of them can be divisible by k. So the total elements can be put to the subset in case 2 is calculation by following formula: 
`total_elements = max(count(n), count(k - n))`
- For case 2, we need to pay attention to the case where k is even number, assume that `k = c * c` and `a % k = c`, `b % k = c` then the formula is similar to case 1: 
`total_elements = min(count(c), 1)`