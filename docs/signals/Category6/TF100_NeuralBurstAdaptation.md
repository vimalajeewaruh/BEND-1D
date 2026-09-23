# NeuralBurstAdaptation

## Overview

The **NeuralBurstAdaptation** signal contains nine localized, internally oscillatory neural bursts on a slow background. Burst amplitude decreases and width increases through time.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,

$$
c=(0.12,0.24,0.355,0.465,0.57,0.67,0.765,0.855,0.935),
$$

$$
a=(0.70,0.64,0.58,0.54,0.49,0.45,0.42,0.39,0.36),\qquad
w_k=0.010+0.0025k.
$$

For $k=1,\ldots,9$, define

$$
g_k(x)=e^{-((x-c_k)/w_k)^2/2},\qquad
o_k(x)=0.60\sin[2\pi(72x+0.8k)].
$$

Then

$$
f(x)=0.08+0.035\sin(2\pi\,1.8x)+\sum_{k=1}^{9}a_k g_k(x)[0.75+0.25o_k(x)]-0.10s(x;0.52,0.12).
$$

[NeuralBurstAdaptation signal](../../assets/images/TF100_NeuralBurstAdaptation.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Evolving localized burst train |
| Adaptation | Decreasing amplitude and increasing width |
| Fine structure | High-frequency oscillation within each burst |
| Main challenge | Preserving nonstationary burst morphology across the record |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k$ | Burst centers | As above |
| $a_k$ | Burst amplitudes | As above |
| $w_k$ | Burst widths | $0.010+0.0025k$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF100_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF100_python.md)



## Recommended Uses

- Adaptive-burst denoising
- Evolving-width feature preservation
- Neural time-series benchmarking

## Provenance

**Status:** Adaptive-neural-burst-inspired deterministic surrogate.

---

[← Previous: CavefishNeuromast](TF099_CavefishNeuromast.md) | [Category 6 Catalog](index.md) | Next: end of Category 6
