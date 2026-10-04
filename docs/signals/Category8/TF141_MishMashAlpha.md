# MishMashAlpha

## Overview

The **MishMashAlpha** artificial stress test combines a linear trend, square-root cusp, narrow bump, sharp step, and accelerating chirp.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the linear trend

```math
T(x)=mx.
```

Define the square-root cusp

```math
C(x)=
A_C\sqrt{|x-c_C|}.
```

Define the narrow bump

```math
B(x)=
A_B
\exp\left[
-\frac12\left(\frac{x-c_B}{w_B}\right)^2
\right].
```

Define the sharp step

```math
J(x)=
A_JS(x;c_J,w_J).
```

Define the accelerating chirp

```math
H(x)=
A_H
\sin\left[
2\pi(f_0x+\beta x^2)
\right].
```

The signal is

```math
f(x)=T(x)+C(x)+B(x)+J(x)+H(x).
```

[View MishMashAlpha signal](../../assets/images/TF141_MishMashAlpha.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Trend, cusp, bump, step, and chirp |
| Trend | Linear increase with slope $m$ |
| Local singularity | Square-root cusp centered at $c_C$ |
| Localized feature | Narrow positive bump centered at $c_B$ |
| Abrupt feature | Sharp positive transition centered at $c_J$ |
| Chirp | Increasing frequency governed by $f_0$ and $\beta$ |
| Main challenge | Each component favors a different smoothing scale |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $m$ | Linear trend slope | 0.18 |
| $A_C$ | Cusp amplitude | 0.32 |
| $c_C$ | Cusp location | 0.27 |
| $A_B$ | Bump amplitude | 0.22 |
| $c_B$ | Bump center | 0.48 |
| $w_B$ | Bump width | 0.012 |
| $A_J$ | Step magnitude | 0.25 |
| $c_J$ | Step location | 0.68 |
| $w_J$ | Step transition width | 0.004 |
| $A_H$ | Chirp amplitude | 0.18 |
| $f_0$ | Chirp base frequency | 7 |
| $\beta$ | Quadratic chirp coefficient | 18 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF141_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF141_python.md)


## Recommended Uses

- Mixed-regularity stress testing
- Cusp and step preservation
- Adaptive-scale evaluation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: BridgeStrainEvent](TF140_BridgeStrainEvent.md) | [Category 8 Catalog](index.md) | [Next: MishMashBeta →](TF142_MishMashBeta.md)
