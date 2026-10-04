# PianoInharmonicDecay


## Overview

The **PianoInharmonicDecay** signal contains a short attack followed by four slightly inharmonic partials that decay at frequency-dependent rates, causing the spectral composition to simplify continuously over time.

## Mathematical Definition

Define the smooth attack gate

```math
g(x)=
\left[
1+e^{-(x-c_A)/w_A}
\right]^{-1}.
```

Let

```math
u=(x-c_A)_+.
```

For $k=1,\ldots,K$, define the damped partial by

```math
P_k(x)=
a_k e^{-\lambda_k u}
\sin(2\pi\nu_k u+\phi_k).
```

The signal is

```math
f(x)=
g(x)
\sum_{k=1}^{K}P_k(x).
```

[View Piano Inharmonic Decay](../../assets/images/TF211_PianoInharmonicDecay.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Music/acoustics |
| Structure | Smoothly gated sum of four damped inharmonic sinusoids |
| Attack behavior | Rapid smooth onset centered at $c_A$ |
| Spectral behavior | Four slightly inharmonic partials with frequency-dependent decay |
| Regularity | Sharp attack with long oscillatory tail |
| Main challenge | Preserving weak upper partials and their changing balance |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of partials | 4 |
| $c_A$ | Attack time | 0.035 |
| $w_A$ | Attack width | 0.0025 |
| $\mathbf{a}$ | Partial amplitudes | Specified in implementation |
| $\boldsymbol{\lambda}$ | Decay rates | $(2.2,\,4.0,\,6.0,\,8.0)$ |
| $\boldsymbol{\nu}$ | Partial frequencies | $(7,\,14.25,\,21.7,\,29.5)$ |
| $\boldsymbol{\phi}$ | Partial phase offsets | Specified in implementation |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF211_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF211_python.md)



## Recommended Uses

- Inharmonic transient denoising
- Attack preservation
- Time-varying spectral recovery

## Provenance

This is a deterministic benchmark surrogate inspired by music/acoustics measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: FungalGrowthPulse](TF210_FungalGrowthPulse.md) · [Category 10 catalog](index.md) · [Next: GuitarPluckDualDecay →](TF212_GuitarPluckDualDecay.md)

