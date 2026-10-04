# Seismic Dispersive Wave


## Overview

The **SeismicDispersiveWave** signal is a seismological surrogate that combines a quiet low-frequency baseline, a small early arrival, a broad dispersive wave packet, and a weak late coda. Its physically meaningful components differ substantially in amplitude, duration, and instantaneous frequency.

## Mathematical Definition

Define the positive-part variable

```math
u_a(x)=(x-a)_+.
```

Define the low-frequency baseline

```math
B(x)=
A_B\sin(2\pi f_Bx).
```

Define the localized early arrival

```math
E(x)=
A_E
\exp\left[
-\frac12
\left(
\frac{x-c_E}{w_E}
\right)^2
\right]
\sin(2\pi f_Ex).
```

Let

```math
u_M=(x-c_M)_+.
```

For $x\geq c_M$, define the main dispersive packet

```math
M(x)=
A_M
\exp\left[
-\frac12
\left(
\frac{x-\mu_M}{w_M}
\right)^2
\right]
\sin\left[
2\pi
\left(
f_Mu_M-\beta_Mu_M^2
\right)
\right],
```

with $M(x)=0$ for $x<c_M$.

Let

```math
u_C=(x-c_C)_+.
```

For $x\geq c_C$, define the late coda

```math
C(x)=
A_Ce^{-\alpha_Cu_C}
\sin(2\pi f_Cu_C),
```

with $C(x)=0$ for $x<c_C$.

The signal is

```math
f(x)=
B(x)+E(x)+M(x)+C(x).
```

[View Seismic Dispersive Wave](../../assets/images/TF171_SeismicDispersiveWave.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Localized dispersive oscillation |
| Components | Baseline, early packet, main packet, and coda |
| Baseline | Weak low-frequency oscillation |
| Early arrival | Localized high-frequency packet centered at $c_E$ |
| Main arrival | Broad dispersive packet beginning at $c_M$ |
| Frequency behavior | Decreasing frequency in the main packet controlled by $\beta_M$ |
| Late structure | Exponentially decaying coda beginning at $c_C$ |
| Amplitude hierarchy | Strong main arrival with weak precursor and coda |
| Main challenge | Preserving dispersion and low-amplitude arrivals |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_B$ | Baseline amplitude | 0.015 |
| $f_B$ | Baseline frequency | 3 |
| $A_E$ | Early-arrival amplitude | 0.10 |
| $c_E$ | Early-arrival center | 0.24 |
| $w_E$ | Early-arrival envelope width | 0.025 |
| $f_E$ | Early-arrival frequency | 42 |
| $A_M$ | Main-packet amplitude | 0.48 |
| $c_M$ | Main-packet onset | 0.39 |
| $\mu_M$ | Main-packet envelope center | 0.64 |
| $w_M$ | Main-packet envelope width | 0.16 |
| $f_M$ | Initial main-packet frequency | 34 |
| $\beta_M$ | Main-packet quadratic phase coefficient | 10 |
| $A_C$ | Coda amplitude | 0.10 |
| $c_C$ | Coda onset | 0.72 |
| $\alpha_C$ | Coda decay rate | 9 |
| $f_C$ | Coda frequency | 48 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF171_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF171_python.md)



## Recommended Uses

- Dispersive packet denoising
- Arrival-time and phase preservation
- Weak-coda recovery

## Provenance

This deterministic signal is inspired by qualitative seismic arrivals and dispersion. It is not a propagation simulation or recorded seismogram.

[← Previous: Van der Pol Relaxation](TF170_VanDerPolRelaxation.md) · [Category 9 catalog](index.md) · [Next: Tertiary Creep Failure →](TF172_TertiaryCreepFailure.md)
