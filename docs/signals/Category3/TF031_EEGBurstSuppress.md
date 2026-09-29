# EEGBurstSuppress

## Overview

The **EEGBurstSuppress** signal alternates between high-frequency multicomponent bursts and strongly suppressed intervals. A very weak low-frequency oscillation remains during suppression, testing whether structured low-amplitude activity can be distinguished from noise.

## Mathematical Definition

Define the burst waveform

```math
\psi(x)=
\sin[2\pi(f_0x+\beta x^2)]
+B_1\sin(\omega_1x+\delta_1)
+B_2\sin(\omega_2x-\delta_2).
```

For burst centers, widths, and amplitudes, let

```math
\mathbf{c}=(0.17,0.46,0.75),
\qquad
\mathbf{s}=(0.095,0.125,0.085),
\qquad
\mathbf{A}=(0.95,1.15,0.82).
```

For $k=1,2,3$, define the burst windows

```math
w_k(x)=
\exp\left[
-\left(\frac{x-c_k}{s_k}\right)^2
\right].
```

The complete signal is

```math
f(x)=
A_s\sin(\omega_s x)
+
\sum_{k=1}^{3}A_k w_k(x)\psi(x).
```

[View EEGBurstSuppress signal](../../assets/images/TF031_EEGBurstSuppress.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Intermittent multiscale bursts and suppression |
| Burst centers | $c_1$, $c_2$, and $c_3$ |
| Burst content | Chirped component plus two higher frequencies |
| Suppression content | Weak low-frequency oscillation |
| Main challenge | Separating weak structured activity from noise |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $\mathbf{c}$ | Burst centers | $(0.17,0.46,0.75)$ |
| $\mathbf{s}$ | Burst widths | $(0.095,0.125,0.085)$ |
| $\mathbf{A}$ | Burst amplitudes | $(0.95,1.15,0.82)$ |
| $f_0$ | Linear chirp coefficient | 31 |
| $\beta$ | Quadratic chirp coefficient | 4.5 |
| $B_1$ | First high-frequency amplitude | 0.52 |
| $\omega_1$ | First high-frequency angular frequency | $106\pi$ |
| $\delta_1$ | First phase shift | 0.7 |
| $B_2$ | Second high-frequency amplitude | 0.23 |
| $\omega_2$ | Second high-frequency angular frequency | $158\pi$ |
| $\delta_2$ | Second phase shift | 0.4 |
| $A_s$ | Suppression oscillation amplitude | 0.018 |
| $\omega_s$ | Suppression angular frequency | $10\pi$ |

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

