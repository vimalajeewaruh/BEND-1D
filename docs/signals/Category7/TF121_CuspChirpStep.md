# CuspChirpStep


## Overview

The **CuspChirpStep** signal is an artificial stress test combining a cusp, accelerating chirp, smooth trend, and small sharp step in one record.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the cusp component

```math
C(x)=A_C\sqrt{|x-c_C|}.
```

Define the accelerating chirp

```math
H(x)=
A_H
\sin\left[
2\pi(f_0x+\beta x^2)
\right].
```

Define the sharp step

```math
J(x)=A_JS(x;c_J,w_J).
```

Define the smooth linear trend

```math
T(x)=mx.
```

The signal is

```math
f(x)=C(x)+H(x)+J(x)+T(x).
```

[View CuspChirpStep signal](../../assets/images/TF121_CuspChirpStep.png)

## Morphological Characteristics

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Cusp, chirp, step, and trend |
| Cusp | Located at $c_C$ with amplitude $A_C$ |
| Chirp | Increasing frequency governed by $f_0$ and $\beta$ |
| Step | Sharp positive transition near $c_J$ |
| Trend | Smooth linear increase with slope $m$ |
| Main challenge | Reconciling features that favor different smoothing scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_C$ | Cusp amplitude | 0.45 |
| $c_C$ | Cusp location | 0.30 |
| $A_H$ | Chirp amplitude | 0.22 |
| $f_0$ | Chirp base frequency | 8 |
| $\beta$ | Quadratic chirp coefficient | 18 |
| $A_J$ | Step magnitude | 0.28 |
| $c_J$ | Step location | 0.68 |
| $w_J$ | Step transition width | 0.004 |
| $m$ | Linear trend slope | 0.10 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF121_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF121_python.md)



## Recommended Uses

- Mixed-regularity stress testing
- Cusp and step preservation
- Chirp phase recovery

## Provenance

**Status:** Deliberately artificial multiregularity stress test.

---

[← Previous: InferenceQueueCollapse](TF120_InferenceQueueCollapse.md) | [Category 7 Catalog](index.md) | [Next: PeakForest →](TF122_PeakForest.md)
