# DrumModePacket


## Overview

A rapid attack excites four nonharmonic drum-like modes with different damping rates, causing the initially dense spectrum to simplify over time.

## Mathematical Definition

Let $u=(x-0.06)_+$ and
$g(x)=[1+e^{-(x-0.06)/0.002}]^{-1}$. Then
$$
f(x)=g(x)\sum_{k=1}^{4}a_ke^{-\lambda_ku}
\sin(2\pi\nu_ku+\phi_k),
$$
using the nonharmonic mode parameters in the code.

[DrumModePacket signal](../../assets/images/TF214_DrumModePacket.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Music/acoustics |
| Structure | Smoothly gated nonharmonic damped-mode packet |
| Regularity | Sharp attack and evolving oscillatory tail |
| Main challenge | Preserve mode-specific decay across a dense onset |

## Parameters

| Parameter | Value |
|---|---|
| Attack time/width | $0.06/0.002$ |
| Frequencies | $8.5,13.7,22.4,31.2$ |
| Decay rates | $4,5.8,7.5,10$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF214_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF214_python.md)



## Recommended Uses

- Percussive-transient denoising
- Nonharmonic-mode preservation
- Time-varying spectrum recovery

## Provenance

This is a deterministic benchmark surrogate inspired by music/acoustics measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: BellBeating](TF213_BellBeating.md) · [Category 10 catalog](index.md) · [Next: TrafficStopGo →](TF215_TrafficStopGo.md)

