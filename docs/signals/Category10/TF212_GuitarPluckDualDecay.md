# GuitarPluckDualDecay


## Overview

The **GuitarPluckDualDecay** signal represents a sharp pluck attack that excites a slowly decaying fundamental and three faster-decaying harmonics, leaving a long low-amplitude tail.

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

For $k=1,\ldots,K$, define the damped harmonic component by

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

[View Guitar Pluck Dual Decay](../../assets/images/TF212_GuitarPluckDualDecay.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Music/acoustics |
| Structure | Smoothly gated harmonic sum with mode-specific damping |
| Attack behavior | Sharp smooth onset centered at $c_A$ |
| Decay behavior | Slowly decaying fundamental accompanied by faster-decaying higher harmonics |
| Regularity | Sharp smooth onset and multirate oscillatory decay |
| Main challenge | Keeping the attack and weak late harmonics together |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of harmonic components | 4 |
| $c_A$ | Attack time | 0.045 |
| $w_A$ | Attack width | 0.002 |
| $\mathbf{a}$ | Harmonic amplitudes | Specified in implementation |
| $\boldsymbol{\nu}$ | Harmonic frequencies | $(6.5,\,13,\,19.5,\,32.5)$ |
| $\boldsymbol{\lambda}$ | Decay rates | $(1.8,\,5.5,\,8.0,\,11)$ |
| $\boldsymbol{\phi}$ | Phase offsets | Specified in implementation |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF212_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF212_python.md)



## Recommended Uses

- Plucked-string denoising
- Sharp-attack recovery
- Weak harmonic-tail preservation

## Provenance

This is a deterministic benchmark surrogate inspired by music/acoustics measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: PianoInharmonicDecay](TF211_PianoInharmonicDecay.md) · [Category 10 catalog](index.md) · [Next: BellBeating →](TF213_BellBeating.md)

