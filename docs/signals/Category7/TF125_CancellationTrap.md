# CancellationTrap


## Overview

The **CancellationTrap** signal subtracts two large, similar smooth components, leaving a delicate residual oscillation and a small localized peak.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Define

$$
g_1(x)=0.85g(x;0.48,0.19),\qquad
g_2(x)=0.82g(x;0.50,0.20).
$$

Then

$$
f(x)=g_1(x)-g_2(x)+0.08\sin(14\pi x)+0.04g(x;0.62,0.010).
$$

[CancellationTrap signal](../../assets/images/TF125_CancellationTrap.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Near-cancellation with fragile residual |
| Large components | Two broad, nearly matching Gaussians |
| Small feature | Narrow peak near $x=0.62$ |
| Main challenge | Preserving a residual much smaller than its underlying components |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.85,0.82$ | Large-component amplitudes | As shown |
| $0.08$ | Residual-oscillation amplitude | 0.08 |
| $0.04$ | Local-peak amplitude | 0.04 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0125_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0125_python.md)



## Recommended Uses

- Cancellation-sensitive denoising
- Delicate-residual preservation
- Weak-local-feature recovery

## Provenance

**Status:** Deliberately artificial near-cancellation stress test.

---

[← Previous: NestedWavePackets](TF124_NestedWavePackets.md) | [Category 7 Catalog](index.md) | Next: end of Category 7
