# CancellationTrap


## Overview

The **CancellationTrap** signal subtracts two large, similar smooth components, leaving a delicate residual oscillation and a small localized peak.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the two broad components

```math
G_1(x)=A_1g(x;c_1,w_1),
```

```math
G_2(x)=A_2g(x;c_2,w_2).
```

Define the residual oscillation

```math
R(x)=A_R\sin(2\pi f_Rx).
```

Define the localized peak

```math
P(x)=A_Pg(x;c_P,w_P).
```

The signal is

```math
f(x)=G_1(x)-G_2(x)+R(x)+P(x).
```

[View CancellationTrap signal](../../assets/images/TF125_CancellationTrap.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Near-cancellation with fragile residual |
| Large components | Two broad, nearly matching Gaussians $G_1(x)$ and $G_2(x)$ |
| Residual oscillation | Low-amplitude oscillation with frequency $f_R$ |
| Small feature | Narrow positive peak centered at $c_P$ |
| Main challenge | Preserving a residual much smaller than its underlying components |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_1$ | First broad-component amplitude | 0.85 |
| $c_1$ | First broad-component center | 0.48 |
| $w_1$ | First broad-component width | 0.19 |
| $A_2$ | Second broad-component amplitude | 0.82 |
| $c_2$ | Second broad-component center | 0.50 |
| $w_2$ | Second broad-component width | 0.20 |
| $A_R$ | Residual-oscillation amplitude | 0.08 |
| $f_R$ | Residual-oscillation frequency | 7 |
| $A_P$ | Local-peak amplitude | 0.04 |
| $c_P$ | Local-peak center | 0.62 |
| $w_P$ | Local-peak width | 0.010 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF125_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF125_python.md)



## Recommended Uses

- Cancellation-sensitive denoising
- Delicate-residual preservation
- Weak-local-feature recovery

## Provenance

**Status:** Deliberately artificial near-cancellation stress test.

---

[← Previous: NestedWavePackets](TF124_NestedWavePackets.md) | [Category 7 Catalog](index.md) | Next: end of Category 7
