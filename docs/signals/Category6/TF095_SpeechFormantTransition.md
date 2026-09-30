# SpeechFormantTransition


## Overview

The **SpeechFormantTransition** signal combines three oscillatory components whose frequencies move differently through time, under a smooth global and broad local envelope.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the amplitude envelope

```math
E(x)=
\left[
s(x;c_1,w_1)-s(x;c_2,w_2)
\right]
\left[
A_0+A_E
\exp\left(
-\frac12
\left(\frac{x-\mu_E}{s_E}\right)^2
\right)
\right].
```

Define the three nonstationary phase components

```math
\phi_k(x)=2\pi\left(f_kx+\beta_kx^2\right),
\qquad k=1,\ldots,K.
```

The signal is

```math
f(x)=
E(x)
\sum_{k=1}^{K}
A_k\sin\left[\phi_k(x)+\delta_k\right].
```

The base phase coefficients, quadratic phase coefficients, amplitudes, and phase shifts are

```math
\mathbf{f}=(8,\,22,\,38),
```

```math
\boldsymbol{\beta}=(7,\,-5,\,4),
```

```math
\mathbf{A}=(0.42,\,0.27,\,0.14),
```

```math
\boldsymbol{\delta}=(0,\,0.3,\,-0.5).
```

[View SpeechFormantTransition signal](../../assets/images/TF095_SpeechFormantTransition.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiple nonstationary oscillatory bands |
| Frequency trends | Two increasing and one decreasing phase rate |
| Envelope | Smooth onset near $c_1$ and release near $c_2$ |
| Broad emphasis | Centered near $x=\mu_E$ |
| Main challenge | Preserving distributed, time-varying spectral structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of oscillatory bands | 3 |
| $c_1,c_2$ | Envelope boundaries | 0.07, 0.93 |
| $w_1,w_2$ | Envelope transition widths | 0.025, 0.030 |
| $A_0$ | Envelope baseline amplitude | 0.78 |
| $A_E$ | Broad-emphasis amplitude | 0.22 |
| $\mu_E$ | Broad-emphasis center | 0.58 |
| $s_E$ | Broad-emphasis width | 0.22 |
| $\mathbf{f}$ | Base phase coefficients | $(8,\,22,\,38)$ |
| $\boldsymbol{\beta}$ | Quadratic phase coefficients | $(7,\,-5,\,4)$ |
| $\mathbf{A}$ | Band amplitudes | $(0.42,\,0.27,\,0.14)$ |
| $\boldsymbol{\delta}$ | Band phase shifts | $(0,\,0.3,\,-0.5)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF095_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF095_python.md)



## Recommended Uses

- Nonstationary speech-like denoising
- Moving-band preservation
- Time-frequency structure recovery

## Provenance

**Status:** Speech-formant-transition-inspired deterministic surrogate; not a recording.

---

[← Previous: ChordBeating](TF094_ChordBeating.md) | [Category 6 Catalog](index.md) | [Next: AudioIntro →](TF096_AudioIntro.md)
