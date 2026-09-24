# ChirpCuspCollision


## Overview

A square-root cusp and a rapidly compressed oscillation occupy the same location, so their difficulties cannot be separated spatially.

## Mathematical Definition

Let $u=x-0.52$ and $a=|u|$. The native construction is
$$
r(x)=a^{1/2}+0.48a^{1/3}\sin\left(\frac{0.18}{a+0.004}\right).
$$
For sampled values, center and normalize:
$$
f_i=\frac{r(x_i)-\bar r}{\max_j|r(x_j)-\bar r|}.
$$

[ChirpCuspCollision signal](../../assets/images/TF227_ChirpCuspCollision.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Mathematical stress test |
| Structure | Cusp plus singularly compressed amplitude-weighted chirp |
| Regularity | Nonsmooth at the shared center |
| Main challenge | Protect both the cusp and the local oscillation |

## Parameters

| Parameter | Value |
|---|---|
| Center | $0.52$ |
| Chirp amplitude | $0.48$ |
| Chirp regularizer | $0.004$ |
| Output | Centered and max-normalized |

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

