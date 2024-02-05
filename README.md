# MBP polynomial experiments

## poly-3b-v2x-1b-078-red.cpp

Optimized version of poly-3b-v2x.cpp with three key
optimizations. Note that the //RSS and RSS2 comments were added to
incrementally track code changes. Results from running test problem
for 10 steps indicate the following.

+ Total energy differs only slightly in last reported decimal,
-20877.18150 from original code vs. -20877.18149 from optimized code.

+ Impact on runtime is difficult to assess given the significant
variability in runs time and the small contribution of multibody
potentials to overall time, at least for current version of software
and problem size.

(1) elements of array t[] renumbered to avoid gaps and (hopefully)
improve cache behavior. For example ...

```
    t[1] = a[11];
    t[2] = a[204];
    [lines not shown]
    t[38] = a[418];
    t[39] = t[38] * t[34];
```

Becomes ...

```
    t[0] = a[11];
    t[1] = a[204];
    [lines not shown]
    t[35] = a[418];
    t[36] = t[35] * t[25];
```

(2) Pairs of consecutive array elements that always appear together
are condensed into a single element. For example

```
    t[848] = t[728] * t[68];
    t[849] = t[720] * t[88];
    [lines not shown]
    t[878] = t[671] + t[677] + t[683] + t[697] + t[713] + t[848] + t[849] + t[853] + ...
```

Becomes

```
    t[848] = t[728] * t[68] + //RSS
      t[720] * t[88];
    [lines not shown]
    t[878] = t[671] + t[677] + t[683] + t[697] + t[713] + t[848] + t[853] + ...
```

(3) Condensed expressions (see above) are further simplified to
minimize number of floating point operations. For example,

```
    t[2108] = t[2107] * t[2] + //RSS
      t[2107] * t[7] +
      t[2107] * t[11];
```

Becomes

```
    t[2108] = t[2107] * (t[2] + t[7] + t[11]);//RSS2
```
