# MagnetarBurstStorm


## Overview

The **MagnetarBurstStorm** signal contains unequal narrow bursts occurring in clusters, with damped high-frequency ringing after the two strongest events. Several nearby bursts deliberately challenge temporal resolution.

## Mathematical Definition

Define the Gaussian burst profile

```math
G(x;c,w)=
\exp\left[
-\frac12
\left(
\frac{x-c}{w}
\right)^2
\right].
```

Let the burst centers be

```math
\mathbf{c}
=
(0.16,\,0.28,\,0.295,\,0.48,\,0.67,\,0.715,\,0.83),
```

with corresponding amplitudes $\mathbf{a}=(a_1,\ldots,a_K)$ and widths $\mathbf{w}=(w_1,\ldots,w_K)$ as specified in the implementation.

Define the low-frequency baseline by

```math
B(x)=
A_B\sin(2\pi f_Bx).
```

The burst component is

```math
P(x)=
\sum_{k=1}^{K}
a_kG(x;c_k,w_k).
```

Let the ring-down onset locations and amplitudes be

```math
\mathbf{r}
=
(0.48,\,0.715),
```

```math
\mathbf{b}
=
(0.18,\,0.12).
```

For each $j=1,\ldots,J$, define

```math
u_j=x-r_j.
```

For $x\geq r_j$, define the ring-down component by

```math
R_j(x)=
b_j e^{-\alpha_Ru_j}
\sin(2\pi f_Ru_j),
```

with $R_j(x)=0$ for $x<r_j$.

The signal is

```math
f(x)=
B(x)+P(x)+
\sum_{j=1}^{J}R_j(x).
```

[View Magnetar Burst Storm](../../assets/images/TF184_MagnetarBurstStorm.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | High-energy astrophysics |
| Primary family | Sparse burst storm with ring-downs |
| Structure | Unequal Gaussian bursts plus two causal ring-downs |
| Burst organization | Isolated and closely clustered events |
| Ring-down behavior | Damped high-frequency oscillations after the strongest events |
| Regularity | Smooth, sparse, and strongly nonstationary |
| Main challenge | Preserving weak clustered events and their oscillatory tails |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of Gaussian bursts | 7 |
| $\mathbf{c}$ | Burst centers | $(0.16,\,0.28,\,0.295,\,0.48,\,0.67,\,0.715,\,0.83)$ |
| $\mathbf{a}$ | Burst amplitudes | Specified in implementation |
| $\mathbf{w}$ | Burst widths | Specified in implementation |
| $A_B$ | Baseline amplitude | 0.025 |
| $f_B$ | Baseline frequency | 3 |
| $J$ | Number of ring-downs | 2 |
| $\mathbf{r}$ | Ring-down onset locations | $(0.48,\,0.715)$ |
| $\mathbf{b}$ | Ring-down amplitudes | $(0.18,\,0.12)$ |
| $\alpha_R$ | Ring-down decay rate | 22 |
| $f_R$ | Ring-down frequency | 55 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF184_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF184_python.md)


## Recommended Uses

- Sparse transient recovery
- Cluster resolution
- Ring-down preservation

## Provenance

This is a deterministic benchmark surrogate inspired by high-energy astrophysics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: PulsarGlitchRecovery](TF183_PulsarGlitchRecovery.md) · [Category 10 catalog](index.md) · [Next: XrayQPODrift →](TF185_XrayQPODrift.md)

