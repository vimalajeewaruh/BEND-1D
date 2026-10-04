# CavitationCollapse


## Overview

The **CavitationCollapse** signal contains very narrow pressure impulses occurring singly and in clusters, with every event exciting a damped high-frequency ring-down.

## Mathematical Definition

Define the Gaussian impulse profile

```math
G(x;c,w)=
\exp\left[
-\frac{1}{2}
\left(
\frac{x-c}{w}
\right)^2
\right].
```

Let the event centers be

```math
\mathbf{c}
=
(0.18,\,0.225,\,0.46,\,0.69,\,0.735,\,0.84),
```

with corresponding amplitudes, widths, and ring-down frequencies

```math
\mathbf{a}
=
(a_1,\ldots,a_K),
```

```math
\mathbf{w}
=
(w_1,\ldots,w_K),
```

and

```math
\boldsymbol{\nu}
=
(\nu_1,\ldots,\nu_K),
```

as specified in the implementation.

For each $k=1,\ldots,K$, define the pressure impulse by

```math
P_k(x)=
a_kG(x;c_k,w_k).
```

For $x\geq c_k$, let

```math
u_k=x-c_k,
```

and define the corresponding ring-down by

```math
R_k(x)=
\rho a_k
e^{-\alpha_Ru_k}
\sin(2\pi\nu_ku_k),
```

with $R_k(x)=0$ for $x<c_k$.

The signal is

```math
f(x)=
\sum_{k=1}^{K}
\left[
P_k(x)+R_k(x)
\right].
```

[View Cavitation Collapse](../../assets/images/TF196_CavitationCollapse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Fluid machinery |
| Structure | Six Gaussian pressure impulses with causal oscillatory tails |
| Event behavior | Isolated and closely clustered narrow impulses |
| Ring-down behavior | Each impulse excites a damped high-frequency oscillation |
| Regularity | Strongly localized multiscale transients |
| Main challenge | Resolving close impulses while retaining post-event ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of cavitation events | 6 |
| $\mathbf{c}$ | Event centers | $(0.18,\,0.225,\,0.46,\,0.69,\,0.735,\,0.84)$ |
| $\mathbf{a}$ | Event amplitudes | Specified in implementation |
| $\mathbf{w}$ | Pulse widths | $0.002$–$0.0035$ |
| $\boldsymbol{\nu}$ | Ring-down frequencies | $62$–$105$ |
| $\rho$ | Ring-down amplitude fraction | 0.18 |
| $\alpha_R$ | Ring-down decay rate | 35 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF196_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF196_python.md)




## Recommended Uses

- Impulse-cluster resolution
- Ring-down preservation
- High-dynamic-range transient denoising

## Provenance

This is a deterministic benchmark surrogate inspired by fluid machinery measurement morphology. It is not a calibrated physical simulator.

[← Previous: MeltPoolSpatter](TF195_MeltPoolSpatter.md) · [Category 10 catalog](index.md) · [Next: ModeBeatingDecay →](TF197_ModeBeatingDecay.md)

