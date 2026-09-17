# GravitationalWaveChirp

## Overview

The **GravitationalWaveChirp** signal has simultaneous amplitude and frequency acceleration toward a merger-like event, followed by a short damped ring-down.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$, $W(x)=s(x;0.10,0.018)-s(x;0.79,0.010)$, and

$$
\phi(x)=2\pi(5x+4x^2+18x^4+38x^7),\qquad A(x)=0.06+0.62x^{2.8}.
$$

Then

$$
f(x)=W(x)A(x)\sin\phi(x)+0.70I(x\ge0.79)e^{-15(x-0.79)}\sin[2\pi\,52(x-0.79)+0.3].
$$

[GravitationalWaveChirp signal](../../assets/images/TF083_GravitationalWaveChirp.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Accelerating chirp and damped ring-down |
| Active chirp | Approximately 0.10–0.79 |
| Nonstationarity | Rapidly changing frequency and amplitude |
| Main challenge | Preserving merger-localized fine scales and post-event ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.79$ | Merger/ring-down time | 0.79 |
| $15$ | Ring-down decay rate | 15 |
| $52$ | Ring-down cycle frequency | 52 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF083_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF083_python.md)



## Recommended Uses

- Chirp denoising
- Time-varying frequency recovery
- Ring-down preservation

## Provenance

**Status:** Compact-binary-waveform-inspired deterministic surrogate; not a physical simulator.

---

[← Previous: PulsarProfile](TF082_PulsarProfile.md) | [Category 6 Catalog](index.md) | [Next: MicrolensingPlanet →](TF084_MicrolensingPlanet.md)
