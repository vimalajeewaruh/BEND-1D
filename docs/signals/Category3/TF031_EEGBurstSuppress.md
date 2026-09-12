# EEGBurstSuppress

## Overview

The **EEGBurstSuppress** signal alternates between high-frequency multicomponent bursts and strongly suppressed intervals. A very weak low-frequency oscillation remains during suppression, testing whether structured low-amplitude activity can be distinguished from noise.

## Mathematical Definition

Let

$$
\psi(x)=\sin\{2\pi(31x+4.5x^2)\}
+0.52\sin(106\pi x+0.7)
+0.23\sin(158\pi x-0.4).
$$

For burst centers, widths, and amplitudes

$$
c=(0.17,0.46,0.75),\quad
s=(0.095,0.125,0.085),\quad
A=(0.95,1.15,0.82),
$$

define

$$
w_k(x)=\exp\!\left[-\left(\frac{x-c_k}{s_k}\right)^2\right].
$$

The complete signal is

$$
f(x)=0.018\sin(10\pi x)+\sum_{k=1}^{3}A_kw_k(x)\psi(x).
$$

[EEGBurstSuppress signal](../../assets/images/TF031_EEGBurstSuppress.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Intermittent multiscale bursts and suppression |
| Burst centers | $0.17$, $0.46$, and $0.75$ |
| Burst content | Chirped component plus two higher frequencies |
| Suppression content | Weak 5-cycle oscillation |
| Main challenge | Separating weak structured activity from noise |

## Parameters

| Parameter | Meaning | Default |
|---|---|---|
| $N$ | Number of samples | 1024 |
| $c$ | Burst centers | $(0.17,0.46,0.75)$ |
| $s$ | Burst widths | $(0.095,0.125,0.085)$ |
| $A$ | Burst amplitudes | $(0.95,1.15,0.82)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF031_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF031_python.md)



## Recommended Uses

- Burst-suppression segmentation
- Intermittent high-frequency denoising
- Weak structured-signal retention
- Multiscale EEG-like activity analysis

## Provenance

**Status:** EEG burst-suppression-inspired deterministic surrogate.

---

[← Previous: CheyneStokes](TF030_CheyneStokes.md) | [Category 3 Catalog](index.md) | [Next: TremorOnset →](TF032_TremorOnset.md)

