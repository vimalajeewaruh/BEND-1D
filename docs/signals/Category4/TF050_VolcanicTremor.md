# VolcanicTremor

## Overview

The **VolcanicTremor** signal has a smooth onset followed by persistent quasi-periodic oscillation. Two localized amplitude increases mimic bursts or changes in tremor intensity.

## Mathematical Definition

Define the onset envelope

```math
E(x)=\frac{1}{1+e^{-k(x-x_c)}}.
```

Define the carrier

```math
C(x)=\sin\left[2\pi(f_0x+\beta x^2)\right]
+A_h\sin(\omega_hx+\delta).
```

Define the burst modulation

```math
B(x)=1
+A_1\exp\left[-\frac12\left(\frac{x-\mu_1}{s_1}\right)^2\right]
+A_2\exp\left[-\frac12\left(\frac{x-\mu_2}{s_2}\right)^2\right].
```

The signal is

```math
f(x)=E(x)B(x)C(x).
```

[View VolcanicTremor signal](../../assets/images/TF050_VolcanicTremor.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Tremor onset with localized amplitude bursts |
| Onset center | $x=x_c$ |
| Burst centers | $x=\mu_1$ and $x=\mu_2$ |
| Oscillation | Chirped component plus frequency 35 component |
| Main challenge | Joint onset and nonstationary-amplitude preservation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Onset center | 0.29 |
| $k$ | Onset sharpness | 55 |
| $f_0$ | Initial carrier frequency | 17 |
| $\beta$ | Chirp coefficient | 0.9 |
| $A_h$ | Secondary-component amplitude | 0.33 |
| $\omega_h$ | Secondary angular frequency | $70\pi$ |
| $\delta$ | Secondary phase shift | 0.4 |
| $A_1$ | First burst amplitude | 0.55 |
| $\mu_1$ | First burst center | 0.49 |
| $s_1$ | First burst width | 0.045 |
| $A_2$ | Second burst amplitude | 0.42 |
| $\mu_2$ | Second burst center | 0.72 |
| $s_2$ | Second burst width | 0.035 |

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
