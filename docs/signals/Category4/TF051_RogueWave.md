# RogueWave

## Overview

The **RogueWave** signal combines a modulated narrow-band ocean-wave train with one localized extreme wave group. The structured background and rare high-amplitude event must both be preserved.

## Mathematical Definition

Define the background wave component

```math
S(x)=
[A_0+A_m\sin(\omega_m x)]
[\sin(\omega_c x)+A_h\sin(2\omega_c x+\delta_h)].
```

Define the localized extreme group

```math
R(x)=
A_R\exp\left[
-\frac12\left(\frac{x-x_R}{s_R}\right)^2
\right]
\sin\left[\omega_c(x-x_R)+\phi_R\right].
```

The signal is

```math
f(x)=S(x)+R(x).
```

[View RogueWave signal](../../assets/images/TF051_RogueWave.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Modulated wave train with localized extreme event |
| Background frequency | $f_c$ with weak second harmonic |
| Extreme-event center | $x=x_R$ |
| Extreme-event width | $s_R$ |
| Main challenge | Preserving ordinary wave structure and a rare extreme group |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $A_0$ | Background amplitude level | 0.48 |
| $A_m$ | Modulation amplitude | 0.15 |
| $\omega_m$ | Modulation angular frequency | $1.6\pi$ |
| $f_c$ | Carrier frequency | 9 |
| $\omega_c$ | Carrier angular frequency | $18\pi$ |
| $A_h$ | Second-harmonic amplitude | 0.20 |
| $\delta_h$ | Second-harmonic phase shift | 0.5 |
| $A_R$ | Extreme-event amplitude | 1.55 |
| $x_R$ | Extreme-event center | 0.61 |
| $s_R$ | Extreme-event width | 0.030 |
| $\phi_R$ | Extreme-event phase shift | $\pi/2$ |

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

