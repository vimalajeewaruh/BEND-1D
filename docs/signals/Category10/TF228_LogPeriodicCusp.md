# LogPeriodicCusp


## Overview

The **LogPeriodicCusp** signal combines a power-law cusp with logarithmically compressed oscillations whose amplitude and local frequency change together near a common singular point.

## Mathematical Definition

Let

```math
u=x-c,
```

and define the distance from the singular point by

```math
a=|u|.
```

Define the native signal by

```math
r(x)=
a^{p}
\left[
1+
A_L
\sin\left(
\omega_L\log(a+\varepsilon_L)
\right)
\right].
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
{\max_j \lvert r(x_j)-\bar r\rvert}.
```

[View Log-Periodic Cusp](../../assets/images/TF228_LogPeriodicCusp.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Critical phenomena |
| Structure | Power cusp with multiplicative log-periodic modulation |
| Cusp behavior | Amplitude decreases toward the singular point according to the power $p$ |
| Oscillatory behavior | Logarithmically compressed oscillations concentrate near the same singular point |
| Spatial interaction | Oscillation amplitude and local frequency change simultaneously near $c$ |
| Regularity | Hölder-like singularity with local frequency compression |
| Main challenge | Adapting simultaneously to changing amplitude and frequency |

## Parameters

| Symbol | Meaning | Default |
|---|---|---:|
| $c$ | Singular-point center | 0.57 |
| $p$ | Cusp exponent | 0.34 |
| $A_L$ | Log-periodic modulation depth | 0.62 |
| $\omega_L$ | Log-periodic angular frequency | 10.5 |
| $\varepsilon_L$ | Logarithmic regularizer | 0.0025 |
| $\bar r$ | Sample mean used for centering | Computed from samples |
| $\max_j \lvert r(x_j)-\bar r\rvert$ | Normalization factor | Computed from samples |

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

