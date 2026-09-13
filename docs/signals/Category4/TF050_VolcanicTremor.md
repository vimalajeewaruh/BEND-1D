# VolcanicTremor

## Overview

The **VolcanicTremor** signal has a smooth onset followed by persistent quasi-periodic oscillation. Two localized amplitude increases mimic bursts or changes in tremor intensity.

## Mathematical Definition

Define the onset envelope

$$
E(x)=\frac{1}{1+e^{-55(x-0.29)}},
$$

the carrier

$$
C(x)=\sin\{2\pi(17x+0.9x^2)\}+0.33\sin(70\pi x+0.4),
$$

and the burst modulation

$$
B(x)=1+0.55\exp\!\left[-\frac12\left(\frac{x-0.49}{0.045}\right)^2\right]
+0.42\exp\!\left[-\frac12\left(\frac{x-0.72}{0.035}\right)^2\right].
$$

The signal is

$$
f(x)=E(x)B(x)C(x).
$$

[VolcanicTremor signal](../../assets/images/TF050_VolcanicTremor.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Tremor onset with localized amplitude bursts |
| Onset center | $x=0.29$ |
| Burst centers | $x=0.49$ and $x=0.72$ |
| Oscillation | Chirped component plus frequency 35 component |
| Main challenge | Joint onset and nonstationary-amplitude preservation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $55$ | Onset sharpness | 55 |
| $0.045$ | First burst width | 0.045 |
| $0.035$ | Second burst width | 0.035 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF050_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF050_python.md)



## Recommended Uses

- Tremor-onset localization
- Persistent oscillation denoising
- Amplitude-burst recovery
- Nonstationary vibration analysis

## Provenance

**Status:** Volcanic-tremor-inspired deterministic measurement surrogate.

---

[← Previous: Seismogram](TF049_Seismogram.md) | [Category 4 Catalog](index.md) | [Next: RogueWave →](TF051_RogueWave.md)
