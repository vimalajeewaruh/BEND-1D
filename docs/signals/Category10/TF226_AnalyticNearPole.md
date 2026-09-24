# AnalyticNearPole


## Overview

This normalized rational peak is infinitely differentiable on the real interval, but nearby complex poles create extreme local curvature.

## Mathematical Definition

Let
$$
r(x)=\frac{1}{(x-0.52)^2+0.015^2}.
$$
For sampled points $x_i$, define
$$
f_i=\frac{r(x_i)}{\max_j r(x_j)}.
$$
The complex poles occur at $0.52\pm0.015i$.

[AnalyticNearPole signal](../../assets/images/TF226_AnalyticNearPole.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Mathematical stress test |
| Structure | Unit-normalized narrow rational peak |
| Regularity | Real analytic on $[0,1]$ despite extreme curvature |
| Main challenge | Avoid equating mathematical smoothness with slow variation |

## Parameters

| Parameter | Value |
|---|---|
| Center $x_0$ | $0.52$ |
| Pole distance $\delta$ | $0.015$ |
| Normalization | Sample maximum equals $1$ |

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

