# GuitarPluckDualDecay


## Overview

A sharp pluck attack excites a slowly decaying fundamental and three faster-decaying harmonics, leaving a long low-amplitude tail.

[GuitarPluckDualDecay signal](../../assets/images/TF212_GuitarPluckDualDecay.png)

## Mathematical Definition

Let $u=(x-0.045)_+$ and
$g(x)=[1+e^{-(x-0.045)/0.002}]^{-1}$. Then
$$
f(x)=g(x)\sum_{k=1}^{4}a_ke^{-\lambda_ku}
\sin(2\pi\nu_ku+\phi_k),
$$
with the mode parameters given in the implementations.

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Music/acoustics |
| Structure | Gated harmonic sum with mode-specific damping |
| Regularity | Sharp smooth onset and multirate oscillatory decay |
| Main challenge | Keep the attack and weak late harmonics together |

## Parameters

| Parameter | Value |
|---|---|
| Attack time/width | $0.045/0.002$ |
| Frequencies | $6.5,13,19.5,32.5$ |
| Decay rates | $1.8,5.5,8.0,11$ |

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

