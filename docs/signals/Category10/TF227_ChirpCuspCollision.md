# ChirpCuspCollision


## Overview

The **ChirpCuspCollision** signal combines a square-root cusp and a rapidly compressed oscillation at the same location, so the two sources of difficulty cannot be separated spatially.

## Mathematical Definition

Let

```math
u=x-c,
```

and define the distance from the shared center by

```math
a=|u|.
```

Define the cusp component by

```math
C(x)=a^{p_C}.
```

Define the amplitude-weighted compressed chirp by

```math
H(x)=
A_H a^{p_H}
\sin\left(
\frac{\omega_H}{a+\varepsilon_H}
\right).
```

The native signal is

```math
r(x)=C(x)+H(x).
```

For sampled points $x_i$, define the sample mean

```math
\bar r=
\frac{1}{N}
\sum_{i=1}^{N}r(x_i).
```

The centered and max-normalized signal is

```math
f_i=
\frac{r(x_i)-\bar r}
{\max_j|r(x_j)-\bar r|}.
```

[View Chirp Cusp Collision](../../assets/images/TF227_ChirpCuspCollision.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Mathematical stress test |
| Structure | Cusp plus singularly compressed amplitude-weighted chirp |
| Cusp behavior | Square-root cusp centered at $c$ |
| Chirp behavior | Increasingly compressed oscillation toward the same center |
| Spatial interaction | Cusp and oscillatory difficulty occur at the same location |
| Regularity | Nonsmooth at the shared center |
| Main challenge | Protecting both the cusp and the local oscillation |

## Parameters

| Symbol | Meaning | Default |
|---|---|---:|
| $c$ | Shared cusp and chirp center | 0.52 |
| $p_C$ | Cusp power | $1/2$ |
| $A_H$ | Chirp amplitude coefficient | 0.48 |
| $p_H$ | Chirp amplitude power | $1/3$ |
| $\omega_H$ | Chirp phase numerator | 0.18 |
| $\varepsilon_H$ | Chirp regularizer | 0.004 |
| $\bar r$ | Sample mean used for centering | Computed from samples |
| $\max_j|r(x_j)-\bar r|$ | Normalization factor | Computed from samples |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF227_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF227_python.md)




## Recommended Uses

- Cusp preservation
- Compressed-chirp recovery
- Competing-scale stress testing

## Provenance

This is a deliberately artificial controlled stress test. Its normalization and sampling conventions are part of the definition.

[← Previous: AnalyticNearPole](TF226_AnalyticNearPole.md) · [Category 10 catalog](index.md) · [Next: LogPeriodicCusp →](TF228_LogPeriodicCusp.md)

