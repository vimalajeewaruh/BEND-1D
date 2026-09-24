# LogPeriodicCusp


## Overview

Cusp amplitude and logarithmically compressed oscillation scale change together near one singular point.

## Mathematical Definition

Let $u=x-0.57$ and $a=|u|$. Define
$$
r(x)=a^{0.34}[1+0.62\sin\{10.5\log(a+0.0025)\}].
$$
The sampled signal is centered and normalized:
$$
f_i=\frac{r(x_i)-\bar r}{\max_j|r(x_j)-\bar r|}.
$$

[LogPeriodicCusp signal](../../assets/images/TF228_LogPeriodicCusp.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Critical phenomena |
| Structure | Power cusp with multiplicative log-periodic modulation |
| Regularity | Hölder-like singularity with local frequency compression |
| Main challenge | Adapt simultaneously to changing amplitude and frequency |

## Parameters

| Parameter | Value |
|---|---|
| Center | $0.57$ |
| Cusp exponent | $0.34$ |
| Modulation depth | $0.62$ |
| Log frequency | $10.5$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF228_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF228_python.md)




## Recommended Uses

- Log-periodic structure preservation
- Local-regularity adaptation
- Critical-point denoising

## Provenance

This is a deliberately artificial controlled stress test. Its normalization and sampling conventions are part of the definition.

[← Previous: ChirpCuspCollision](TF227_ChirpCuspCollision.md) · [Category 10 catalog](index.md) · [Next: CancellationNeedle →](TF229_CancellationNeedle.md)

