# DerivativeZoo


## Overview

The **DerivativeZoo** stress test places a near jump, kink, curvature change, square-root cusp, smooth trend, and analytic bump in one signal.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the smooth linear trend

```math
T(x)=mx.
```

Define the near-jump component

```math
J(x)=
A_JS(x;c_J,w_J).
```

Define the kink

```math
K(x)=
A_K|x-c_K|.
```

For $x\geq c_Q$, define the curvature-change component

```math
Q(x)=
A_Q(x-c_Q)^2,
```

with $Q(x)=0$ for $x<c_Q$.

Define the square-root cusp

```math
C(x)=
A_C\sqrt{|x-c_C|}.
```

Define the analytic Gaussian bump

```math
B(x)=
A_B
\exp\left[
-\frac12\left(\frac{x-c_B}{w_B}\right)^2
\right].
```

The signal is

```math
f(x)=T(x)+J(x)+K(x)+Q(x)+C(x)+B(x).
```

[View DerivativeZoo signal](../../assets/images/TF145_DerivativeZoo.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiple orders of local regularity |
| Near jump | Sharp smooth transition centered at $c_J$ |
| Kink | Absolute-value singularity centered at $c_K$ |
| Curvature change | One-sided quadratic component beginning at $c_Q$ |
| Cusp | Square-root singularity centered at $c_C$ |
| Smooth features | Linear trend and analytic Gaussian bump |
| Main challenge | Adapting to different differentiability classes within one record |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $m$ | Linear trend slope | 0.10 |
| $A_J$ | Near-jump magnitude | 0.28 |
| $c_J$ | Near-jump location | 0.18 |
| $w_J$ | Near-jump transition width | 0.0025 |
| $A_K$ | Kink amplitude | 0.35 |
| $c_K$ | Kink location | 0.36 |
| $A_Q$ | Curvature-change amplitude | 0.18 |
| $c_Q$ | Curvature-change location | 0.55 |
| $A_C$ | Cusp amplitude | 0.25 |
| $c_C$ | Cusp location | 0.72 |
| $A_B$ | Gaussian-bump amplitude | 0.16 |
| $c_B$ | Gaussian-bump center | 0.88 |
| $w_B$ | Gaussian-bump width | 0.025 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF145_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF145_python.md)


## Recommended Uses

- Local-regularity adaptation tests
- Edge, kink, and cusp preservation
- Mixed-smoothness benchmarking

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: NeedleInChirp](TF144_NeedleInChirp.md) | [Category 8 Catalog](index.md) | [Next: MultiscaleComb →](TF146_MultiscaleComb.md)
