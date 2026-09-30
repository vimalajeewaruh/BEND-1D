# TrainingLossSchedule


## Overview

The **TrainingLossSchedule** signal combines fast and slow optimization decay, three discrete schedule-related improvements, and three transient loss spikes.

## Mathematical Definition

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1},
```

and the Gaussian transient

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the multirate decay component

```math
D(x)=A_1e^{-\alpha_1x}+A_2e^{-\alpha_2x}+b_0.
```

Define the schedule-change component

```math
S(x)=
-\sum_{j=1}^{J}d_j s(x;c_j,w_j).
```

Define the transient-spike component

```math
G(x)=
\sum_{k=1}^{K}a_k g(x;\mu_k,\sigma_k).
```

The signal is

```math
f(x)=D(x)+S(x)+G(x).
```

The schedule-change locations, magnitudes, and transition widths are

```math
\mathbf{c}=(0.34,\,0.58,\,0.78),
```

```math
\mathbf{d}=(0.065,\,0.045,\,0.028),
```

```math
\mathbf{w}=(0.006,\,0.006,\,0.005).
```

The transient centers, amplitudes, and widths are

```math
\boldsymbol{\mu}=(0.27,\,0.47,\,0.705),
```

```math
\mathbf{a}=(0.12,\,0.075,\,0.050),
```

```math
\boldsymbol{\sigma}=(0.010,\,0.008,\,0.006).
```

[View TrainingLossSchedule signal](../../assets/images/TF080_TrainingLossSchedule.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multirate decay with steps and spikes |
| Schedule changes | At locations $\mathbf{c}$ |
| Transients | $K$ narrow positive spikes centered at $\boldsymbol{\mu}$ |
| Main challenge | Separating genuine schedule changes from optimization roughness |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_1,A_2$ | Fast and slow decay amplitudes | 1.35, 0.24 |
| $\alpha_1,\alpha_2$ | Fast and slow decay rates | 5.8, 0.65 |
| $b_0$ | Baseline level | 0.065 |
| $J$ | Number of schedule changes | 3 |
| $\mathbf{c}$ | Schedule-change locations | As specified |
| $\mathbf{d}$ | Schedule-change magnitudes | As specified |
| $\mathbf{w}$ | Schedule transition widths | As specified |
| $K$ | Number of transient spikes | 3 |
| $\boldsymbol{\mu}$ | Transient centers | As specified |
| $\mathbf{a}$ | Transient amplitudes | As specified |
| $\boldsymbol{\sigma}$ | Transient widths | As specified |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF080_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF080_python.md)



## Recommended Uses

- Optimization-curve denoising
- Change-point preservation
- Transient-spike analysis

## Provenance

**Status:** Machine-learning-optimization-inspired deterministic surrogate.

---

[← Previous: CacheThrash](TF079_CacheThrash.md) | [Category 6 Catalog](index.md) | [Next: ExoplanetTransitSpots →](TF081_ExoplanetTransitSpots.md)
