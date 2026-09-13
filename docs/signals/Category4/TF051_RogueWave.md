# RogueWave

## Overview

The **RogueWave** signal combines a modulated narrow-band ocean-wave train with one localized extreme wave group. The structured background and rare high-amplitude event must both be preserved.

## Mathematical Definition

The background sea is

$$
S(x)=\left[0.48+0.15\sin(1.6\pi x)\right]
\left[\sin(18\pi x)+0.20\sin(36\pi x+0.5)\right].
$$

The localized extreme group is

$$
R(x)=1.55\exp\!\left[-\frac12\left(\frac{x-0.61}{0.030}\right)^2\right]
\sin\{18\pi(x-0.61)+\pi/2\}.
$$

The signal is

$$
f(x)=S(x)+R(x).
$$

[RogueWave signal](../../assets/images/TF051_RogueWave.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Modulated wave train with localized extreme event |
| Background frequency | 9 with weak second harmonic |
| Extreme-event center | $x=0.61$ |
| Extreme-event width | 0.030 |
| Main challenge | Preserving ordinary wave structure and a rare extreme group |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $9$ | Carrier frequency | 9 |
| $1.55$ | Extreme-event amplitude | 1.55 |
| $0.030$ | Extreme-event width | 0.030 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF051_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF051_python.md)



## Recommended Uses

- Extreme-wave preservation
- Structured-background denoising
- Localized amplitude-event detection
- Ocean-wave measurement analysis

## Provenance

**Status:** Rogue-wave-inspired deterministic oceanographic surrogate.

---

[← Previous: VolcanicTremor](TF050_VolcanicTremor.md) | [Category 4 Catalog](index.md) | [Next: StellarTransitFlare →](TF052_StellarTransitFlare.md)

