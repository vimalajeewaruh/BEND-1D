# SatelliteReactionWheel


## Overview

The **SatelliteReactionWheel** signal combines two slowly varying wheel harmonics, a localized high-frequency resonance crossing, and a narrow momentum-dump-like impulse.

## Mathematical Definition

Let

$$
\phi_1(x)=2\pi(18x+3x^2),\qquad
\phi_2(x)=2\pi(31x-2x^2).
$$

Then

$$
\begin{aligned}
f(x)={}&0.22\sin\phi_1(x)+0.14\sin[\phi_2(x)+0.5]\\
&+0.20e^{-((x-0.58)/0.065)^2/2}\sin(108\pi x)\\
&-0.32e^{-((x-0.82)/0.008)^2/2}.
\end{aligned}
$$

[SatelliteReactionWheel signal](../../assets/images/TF137_SatelliteReactionWheel.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Persistent harmonics, resonance packet, and sparse impulse |
| Resonance | Localized near $x=0.58$ |
| Momentum-dump-like event | Narrow negative impulse near $x=0.82$ |
| Main challenge | Preserving a sparse event within nonstationary vibration |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $18,31$ | Nominal wheel-harmonic cycles | As shown |
| $54$ | Resonance cycle frequency | 54 |
| $-0.32$ | Impulse amplitude | -0.32 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0137_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0137_python.md)



## Recommended Uses

- Spacecraft-vibration denoising
- Resonance-packet recovery
- Sparse-event preservation

## Provenance

**Status:** Satellite-reaction-wheel-inspired deterministic surrogate.

---

[← Previous: GridInverterOscillation](TF136_GridInverterOscillation.md) | [Category 8 Catalog](index.md) | [Next: MicrofluidicDropletTrain →](TF138_MicrofluidicDropletTrain.md)
