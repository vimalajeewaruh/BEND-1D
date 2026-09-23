# DerivativeZoo


## Overview

The **DerivativeZoo** stress test places a near jump, kink, curvature change, square-root cusp, smooth trend, and analytic bump in one signal.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
\begin{aligned}
f(x)={}&0.10x+0.28S(x;0.18,0.0025)+0.35|x-0.36|\\
&+0.18(x-0.55)^2I(x\ge0.55)+0.25\sqrt{|x-0.72|}\\
&+0.16e^{-((x-0.88)/0.025)^2/2}.
\end{aligned}
$$

[DerivativeZoo signal](../../assets/images/TF145_DerivativeZoo.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiple orders of local regularity |
| Nonsmooth features | Near jump, kink, and square-root cusp |
| Smooth features | Trend, curvature change, and Gaussian bump |
| Main challenge | Adapting to different differentiability classes within one record |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.18$ | Near-jump location | 0.18 |
| $0.36$ | Kink location | 0.36 |
| $0.72$ | Cusp location | 0.72 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0145_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0145_python.md)


## Recommended Uses

- Local-regularity adaptation tests
- Edge, kink, and cusp preservation
- Mixed-smoothness benchmarking

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: NeedleInChirp](TF144_NeedleInChirp.md) | [Category 8 Catalog](index.md) | [Next: MultiscaleComb →](TF146_MultiscaleComb.md)
