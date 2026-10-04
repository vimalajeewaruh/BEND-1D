# AnalyticNearPole


## Overview

The **AnalyticNearPole** signal is a normalized rational peak that is infinitely differentiable on the real interval, while nearby complex poles produce extreme local curvature around the peak.

## Mathematical Definition

Define the rational function

```math
r(x)=
\frac{1}
{(x-x_0)^2+\delta^2}.
```

For sampled points $x_i$, define the normalized signal by

```math
f_i=
\frac{r(x_i)}
{\max_j r(x_j)}.
```

The corresponding complex poles are located at

```math
x=x_0\pm i\delta.
```

[View Analytic Near Pole](../../assets/images/TF226_AnalyticNearPole.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Mathematical stress test |
| Structure | Unit-normalized narrow rational peak |
| Peak behavior | Sharp symmetric peak centered at $x_0$ |
| Pole behavior | Complex poles lie a distance $\delta$ from the real axis |
| Regularity | Real analytic on $[0,1]$ despite extreme local curvature |
| Main challenge | Avoid equating mathematical smoothness with slow variation |

## Parameters

| Symbol | Meaning | Default |
|---|---|---:|
| $x_0$ | Peak center | 0.52 |
| $\delta$ | Distance of the complex poles from the real axis | 0.015 |
| $x_0\pm i\delta$ | Complex pole locations | $0.52\pm0.015i$ |
| $\max_j f_j$ | Sample-based normalization | 1 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF226_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF226_python.md)




## Recommended Uses

- Extreme-curvature recovery
- Bandwidth stress testing
- Smoothness-versus-scale diagnostics

## Provenance

This is a deliberately artificial controlled stress test. Its normalization and sampling conventions are part of the definition.

[← Previous: YieldShockRecovery](TF225_YieldShockRecovery.md) · [Category 10 catalog](index.md) · [Next: ChirpCuspCollision →](TF227_ChirpCuspCollision.md)

