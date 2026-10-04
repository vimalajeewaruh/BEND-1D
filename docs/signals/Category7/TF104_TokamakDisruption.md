# TokamakDisruption


## Overview

The **TokamakDisruption** signal contains a growing chirped oscillation, a slower locking-like component that emerges before failure, and an abrupt disruption collapse.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the growing chirped component

```math
C(x)=
(A_0+A_1x)
\sin\left[
2\pi(f_0x+\beta x^2)
\right].
```

Define the locking-like component

```math
L(x)=
A_L
\sin(2\pi f_Lx)
S(x;c_L,w_L).
```

Define the disruption collapse

```math
D(x)=
-A_D S(x;c_D,w_D).
```

The signal is

```math
f(x)=b_0+C(x)+L(x)+D(x).
```

[View TokamakDisruption signal](../../assets/images/TF104_TokamakDisruption.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Growing precursor and abrupt collapse |
| Chirped precursor | Increasing amplitude and frequency governed by $A_1$ and $\beta$ |
| Locking component | Emerges near $c_L$ with transition width $w_L$ |
| Disruption | Sharp negative transition near $c_D$ |
| Main challenge | Retaining weak precursor structure before the dominant event |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.55 |
| $A_0$ | Initial chirp amplitude | 0.04 |
| $A_1$ | Chirp amplitude-growth coefficient | 0.30 |
| $f_0$ | Chirp base frequency | 8 |
| $\beta$ | Quadratic phase coefficient | 10 |
| $A_L$ | Locking-component amplitude | 0.16 |
| $f_L$ | Locking-component frequency | 2.5 |
| $c_L$ | Locking-component onset location | 0.58 |
| $w_L$ | Locking-component transition width | 0.02 |
| $A_D$ | Collapse magnitude | 0.95 |
| $c_D$ | Disruption location | 0.79 |
| $w_D$ | Disruption transition width | 0.006 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF104_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF104_python.md)


## Recommended Uses

- Precursor-preserving denoising
- Abrupt-collapse localization
- Nonstationary oscillation recovery

## Provenance

**Status:** Tokamak-disruption-inspired deterministic fusion surrogate.

---

[← Previous: FusionELMSawtooth](TF103_FusionELMSawtooth.md) | [Category 7 Catalog](index.md) | [Next: CalciumTransientTrain →](TF105_CalciumTransientTrain.md)
