# DrumModePacket


## Overview

The **DrumModePacket** signal contains a rapid attack that excites four nonharmonic drum-like modes with different damping rates, causing the initially dense spectrum to simplify over time.

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

For $k=1,\ldots,K$, define the damped nonharmonic mode by

```math
M_k(x)=
a_k e^{-\lambda_k u}
\sin(2\pi\nu_k u+\phi_k).
```

The signal is

```math
f(x)=
g(x)
\sum_{k=1}^{K}M_k(x).
```

[View Drum Mode Packet](../../assets/images/TF214_DrumModePacket.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Music/acoustics |
| Structure | Smoothly gated nonharmonic damped-mode packet |
| Attack behavior | Rapid smooth onset centered at $c_A$ |
| Spectral behavior | Four nonharmonic modes with mode-specific damping rates |
| Regularity | Sharp attack and evolving oscillatory tail |
| Main challenge | Preserving mode-specific decay across a dense onset |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of nonharmonic modes | 4 |
| $c_A$ | Attack time | 0.06 |
| $w_A$ | Attack width | 0.002 |
| $\mathbf{a}$ | Mode amplitudes | Specified in implementation |
| $\boldsymbol{\nu}$ | Mode frequencies | $(8.5,\,13.7,\,22.4,\,31.2)$ |
| $\boldsymbol{\lambda}$ | Mode decay rates | $(4,\,5.8,\,7.5,\,10)$ |
| $\boldsymbol{\phi}$ | Mode phase offsets | Specified in implementation |

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

