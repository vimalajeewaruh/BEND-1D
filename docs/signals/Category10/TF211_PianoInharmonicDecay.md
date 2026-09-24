# PianoInharmonicDecay


## Overview

After a short attack, four slightly inharmonic partials decay at frequency-dependent rates so the spectrum simplifies continuously over time.

## Mathematical Definition

Let $u=(x-0.035)_+$ and
$g(x)=[1+e^{-(x-0.035)/0.0025}]^{-1}$. Then
$$
f(x)=g(x)\sum_{k=1}^{4}a_ke^{-\lambda_ku}
\sin(2\pi\nu_ku+\phi_k),
$$
with $(a_k,\lambda_k,\nu_k,\phi_k)$ given exactly in the code.

[PianoInharmonicDecay signal](../../assets/images/TF211_PianoInharmonicDecay.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Music/acoustics |
| Structure | Smoothly gated sum of four damped inharmonic sinusoids |
| Regularity | Sharp attack with long oscillatory tail |
| Main challenge | Preserve weak upper partials and their changing balance |

## Parameters

| Parameter | Value |
|---|---|
| Attack time/width | $0.035/0.0025$ |
| Frequencies | $7,14.25,21.7,29.5$ |
| Decay rates | $2.2,4.0,6.0,8.0$ |

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

